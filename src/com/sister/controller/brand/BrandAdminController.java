package com.sister.controller.brand;

import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sister.pojo.Brand;
import com.sister.pojo.Content;
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
import com.sister.web.util.WebUtil;

@Controller
@RequestMapping("/brandAdmin.do")
public class BrandAdminController {

	
	@Resource(name = "brandService")
	private IBrandService brandService;
	
	
	@Resource(name = "productService")
	private IProductService productService;
	
	@Resource(name = "contentService")
	private IContentService contentService;
	
	@RequestMapping(params = "action=save")
	public String save(HttpServletRequest request, HttpServletResponse response) {
		Long id = ParamUtils.getLongParameter(request, "id", 0);
		String nameBrd = ParamUtils.getParameter(request, "nameBrd");
		
		try {
			Map<String, Map<String, Object>> fileMap = UploadFileUtil.uploadMultiFile(request, Content.SRC_CON_BRAND, SisterConfig.MAX_UPLOADSIZE);
			Map<String, Object> logoMap = fileMap.get(Brand.FILE_PIC);
			boolean isSuccess = (Boolean) logoMap.get(UploadFileUtil.SUCCESS);
			if (id == 0 && !isSuccess) {
				return "redirect:/error.do?action=1&message=" +  (String) logoMap.get(UploadFileUtil.MESSAGE);
			}
			if (nameBrd == null) {
				return "redirect:/error.do?action=1&message=" +  (String) logoMap.get(UploadFileUtil.MESSAGE);
			}
			Brand brand = null;
			if( id !=0 ){
				brand = brandService.findBrandById(id);
			}
			if(brand == null){
				brand = new Brand();
			}
			brand.setNameBrd(nameBrd);
			if (logoMap.get(UploadFileUtil.UPLOAD_FILE) != null) {
				Content content = (Content) logoMap.get(UploadFileUtil.UPLOAD_FILE);
				contentService.saveOrUpdateContent(content);
				brand.setPicBrd(content);
			}
			brand.setIsEnabledBrd(true);
			brandService.saveOrUpdateBrand(brand);	
			LogUtil.log.info(WebUtil.getUserId(request) + " saves brand id " + brand.getIdBrd());
						
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin.do?action=manageBrand";
	}

	@RequestMapping(params = "action=delete")
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		Long id = ParamUtils.getLongParameter(request, "id", 0);
		
		try {
			if (id == 0) {
				return "redirect:/error.do?action=1&message=" + URLEncoder.encode(LocalizationUtil.getClientString("Parameter.error", request), "utf-8");
			}

			Map<String, Object> map = brandService.fullLogicallyDeleteBrandById(id, request);
			if((Boolean)map.get(CommonStaticConst.RETURN_SUCCESS) == false){
				return "redirect:/error.do?action=1&message=" + URLEncoder.encode(LocalizationUtil.getClientString("Parameter.error", request), "utf-8");
			}
			LogUtil.log.info(WebUtil.getUserId(request) + " deletes brand id " + id);
		} catch (Exception e) {
			JSONHelperUtil.outputOperationResultAsJSON(Boolean.FALSE, "Delete false!", response);
			e.printStackTrace();
		}
		return "redirect:/admin.do?action=manageBrand";
	}
}
