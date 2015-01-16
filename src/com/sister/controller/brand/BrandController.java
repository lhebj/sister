package com.sister.controller.brand;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sister.pojo.Brand;
import com.sister.pojo.Product;
import com.sister.pojo.ProductPic;
import com.sister.service.brand.IBrandService;
import com.sister.service.product.IProductService;
import com.sister.web.dto.BrandDTO;
import com.sister.web.dto.ProductDTO;
import com.sister.web.dto.ProductPicDTO;
import com.sister.web.util.LocalizationUtil;
import com.sister.web.util.ParamUtils;

@Controller
@RequestMapping("/brand.do")
public class BrandController {	
	

	@Resource(name = "brandService")
	private IBrandService brandService;
	
	@Resource(name = "productService")
	private IProductService productService; 
	
	@RequestMapping(params = "action=detail")
	public String detail(HttpServletRequest request, HttpServletResponse response, Model model) {
		Long id = ParamUtils.getLongParameter(request, "id", 0);
		Long pId = ParamUtils.getLongParameter(request, "pId", 0);
		try{
			if(id==0 && pId==0){
				return "redirect:/error.do?action=1&message=" + URLEncoder.encode(LocalizationUtil.getClientString("Parameter.error", request), "utf-8");
			}
			
			Brand brand = null;
			Product currentProduct = null; 
			
			if(id!=0){
				brand = brandService.findBrandById(id);
				if(brand == null){
					return "redirect:/error.do?action=1&message=" + URLEncoder.encode(LocalizationUtil.getClientString("Parameter.error", request), "utf-8");
				}
			}
			
			if(pId != 0){
				currentProduct = productService.findProductById(pId);
				if(currentProduct == null){
					return "redirect:/error.do?action=1&message=" + URLEncoder.encode(LocalizationUtil.getClientString("Parameter.error", request), "utf-8");
				}
				
				if(brand == null){
					brand = currentProduct.getBrand();
				}
			}
			
			
			
			model.addAttribute("brandDTO", brand.toDTO());
			
			//品牌下的产品
			List<ProductDTO> productDTOList = productService.getProductDTOListByBrandId(0, 1000, brand.getIdBrd());	
			
			model.addAttribute("productDTOList", productDTOList);
			model.addAttribute("productNum", productDTOList.size());
			
			if(productDTOList.size() != 0){
				if(pId == 0){
					pId = productDTOList.get(0).getIdPrd();
					currentProduct = productService.findProductById(pId);
				}
				//当前产品
				if(currentProduct.getBrand().getIdBrd() != brand.getIdBrd()){
					return "redirect:/error.do?action=1&message=" + URLEncoder.encode(LocalizationUtil.getClientString("Parameter.error", request), "utf-8");
				}
				model.addAttribute("currentProductDTO", currentProduct.toDTO());	
				
				//当前产品的不同图片
				List<ProductPic> list = productService.getProductPicListByProductId(pId);
				List<ProductPicDTO> productPicDTOList = new ArrayList<ProductPicDTO>();
				for(ProductPic pd: list){
					productPicDTOList.add(pd.toDTO());
				}
				model.addAttribute("productPicDTOList", productPicDTOList);				
//				JSONHelperUtil.outputDTOToJSON(brand.toDTO(), response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
//		return null;
		return "brandDetail";
	}
	
	@RequestMapping(params = "action=list")
	public String list(HttpServletRequest request, HttpServletResponse response, Model model) {
		try{			
			List<BrandDTO> brandDTOList = brandService.getBrandDTOList();
			model.addAttribute("brandDTOList", brandDTOList);
			
//			JSONHelperUtil.outputDTOToJSON(brandDTOList, response);
		}catch(Exception e){
			e.printStackTrace();
		}
//		return null;
		return "brandList";
	}
	
	@RequestMapping(params = "action=test")
	public String test(HttpServletRequest request, HttpServletResponse response, Model model) {
		try{			
			List<BrandDTO> brandDTOList = brandService.getBrandDTOList();
			model.addAttribute("brandDTOList", brandDTOList);
			
//			JSONHelperUtil.outputDTOToJSON(brandDTOList, response);
		}catch(Exception e){
			e.printStackTrace();
		}
//		return null;
		return "brandListTest";
	}
}
