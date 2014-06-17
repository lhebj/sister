package com.sister.controller.brand;

import java.net.URLEncoder;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sister.pojo.Brand;
import com.sister.pojo.Content;
import com.sister.pojo.Product;
import com.sister.pojo.ProductPic;
import com.sister.service.brand.IBrandService;
import com.sister.service.content.IContentService;
import com.sister.service.product.IProductService;
import com.sister.web.upload.UploadFileUtil;
import com.sister.web.util.CommonStaticConst;
import com.sister.web.util.JSONHelperUtil;
import com.sister.web.util.LocalizationUtil;
import com.sister.web.util.LogUtil;
import com.sister.web.util.ParamUtils;
import com.sister.web.util.SisterConfig;
import com.sister.web.util.StringUtil;
import com.sister.web.util.WebUtil;

@Controller
@RequestMapping("/productAdmin.do")
public class ProductAdminController {

	@Resource(name = "brandService")
	private IBrandService brandService;

	@Resource(name = "productService")
	private IProductService productService;

	@Resource(name = "contentService")
	private IContentService contentService;

	@RequestMapping(params = "action=save")
	public String save(HttpServletRequest request, HttpServletResponse response) {
		Long id = ParamUtils.getLongParameter(request, "id", 0);
		Long idbrdPrd = ParamUtils.getLongParameter(request, "idbrdPrd", 0);
		String namePrd = ParamUtils.getParameter(request, "namePrd");
		String infoPrd = ParamUtils.getParameter(request, "infoPrd");
		String infoEnPrd = ParamUtils.getParameter(request, "infoEnPrd");

		try {
			Map<String, Map<String, Object>> fileMap = UploadFileUtil.uploadMultiFile(request, Content.SRC_CON_PRODUCT, SisterConfig.MAX_UPLOADSIZE);

			Map<String, Object> logoMap = fileMap.get(Product.FILE_LOGO);
			boolean isSuccess = (Boolean) logoMap.get(UploadFileUtil.SUCCESS);
			if (id == 0 && !isSuccess) {
				return "redirect:/error.do?action=1&message=" + (String) logoMap.get(UploadFileUtil.MESSAGE);
			}
			Brand brand = null;
			if (idbrdPrd != 0) {
				brand = brandService.findBrandById(idbrdPrd);
			}
			if (brand == null) {
				return "redirect:/error.do?action=1&message=" + URLEncoder.encode(LocalizationUtil.getClientString("Parameter.error", request), "utf-8");
			}

			Product product = null;
			if (id != 0) {
				product = productService.findProductById(id);
			}

			if (product == null) {
				product = new Product();
			}
			product.setBrand(brand);
			product.setNamePrd(namePrd);
			product.setInfoPrd(StringUtil.filterWordFormatAndSomeHTML(infoPrd));
			product.setInfoEnPrd(StringUtil.filterWordFormatAndSomeHTML(infoEnPrd));
			
			//Logo
			Content logo = (Content) logoMap.get(UploadFileUtil.UPLOAD_FILE);
			if(logo!=null){
				contentService.saveOrUpdateContent(logo);
				product.setLogoPrd(logo);
			}
						
			productService.saveOrUpdateProduct(product);

			this.processUploadFiles(request, product, fileMap);

			LogUtil.log.info(WebUtil.getUserId(request) + " saves product id " + brand.getIdBrd());

		} catch (Exception e) {
			e.printStackTrace();
			JSONHelperUtil.outputOperationResultAsJSON(Boolean.FALSE, "saveOrUpdate false!", response);
		}
		return "redirect:/admin.do?action=manageProduct&brandId=" + idbrdPrd;
	}

	private void processUploadFiles(HttpServletRequest request, Product product, Map<String, Map<String, Object>> fileMap) {
		Map<String, Object> uploadFileMap = null;
		for (int i = 1; i <= ProductPic.MAX_UPLOADFILES; i++) {
//			String nameprdlKey = "namePrdl" + i;
			String infoPrdl = ParamUtils.getParameter(request, (ProductPic.NAME_PRE + i));
			if (infoPrdl == null) {
//				LogUtil.log.info(WebUtil.getUserId(request) + " saves ProductDownload, productId= " + product.getIdPrd() + ", namePrdl is null, break!");
				continue;
			}
//			String filePrdlKey = ProductDownload.FILE_PRE + i;
			uploadFileMap = fileMap.get(ProductPic.FILE_PRE + i);
			if (!(Boolean) uploadFileMap.get(UploadFileUtil.SUCCESS) || uploadFileMap.get(UploadFileUtil.UPLOAD_FILE) == null) {
//				LogUtil.log.info(WebUtil.getUserId(request) + " saves ProductDownload, productId= " + product.getIdPrd() + ", UPLOAD_FILE is null, break!");
				continue;
			}
			
			Content filePrdl = (Content) uploadFileMap.get(UploadFileUtil.UPLOAD_FILE);
			contentService.saveOrUpdateContent(filePrdl);
			
			ProductPic pdl = new ProductPic();
			pdl.setProduct(product);
			pdl.setPicPrdp(filePrdl);
			pdl.setInfoPrdp(infoPrdl);
			pdl.setDateCreatePrdp(new Date());
			productService.saveOrUpdateProductPic(pdl);
			LogUtil.log.info(WebUtil.getUserId(request) + " saves ProductDownload, productId= " + product.getIdPrd() + ", infoPrdl = " + infoPrdl);
		}
		
		//delete old files
		String deleteOldFilesId = ParamUtils.getParameter(request, "deleteOldFiles");
		if(deleteOldFilesId != null){
			String[] deleteOldFilesIdArray = deleteOldFilesId.split(",");
			for(int i=0;i<deleteOldFilesIdArray.length;i++){
				if(StringUtil.isNumeric(deleteOldFilesIdArray[i])){
					productService.deleteProductPicById(Long.parseLong(deleteOldFilesIdArray[i]));
					LogUtil.log.info(WebUtil.getUserId(request) + " delete ProductPic, productId= " + product.getIdPrd() + ", id = " + deleteOldFilesIdArray[i]);
				}
			}
		}

	}

	@RequestMapping(params = "action=delete")
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		Long id = ParamUtils.getLongParameter(request, "id", 0);
		Long categoryId = ParamUtils.getLongParameter(request, "categoryId", 0);

		try {
			if (id == 0) {
				return "redirect:/error.do?action=1&message=" + URLEncoder.encode(LocalizationUtil.getClientString("Parameter.error", request), "utf-8");
			}
			Map<String, Object> map = productService.deleteFullProductById(id, request);
			if ((Boolean) map.get(CommonStaticConst.RETURN_SUCCESS) == false) {
				return "redirect:/error.do?action=1&message=" + URLEncoder.encode(LocalizationUtil.getClientString("Parameter.error", request), "utf-8");
			}

		} catch (Exception e) {
			JSONHelperUtil.outputOperationResultAsJSON(Boolean.FALSE, "Delete false!", response);
			e.printStackTrace();
		}
		return "redirect:/admin.do?action=manageProduct&categoryId=" + categoryId;
	}
}
