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
			if(id==0){
				return "redirect:/error.do?action=1&message=" + URLEncoder.encode(LocalizationUtil.getClientString("PageNotFound", request), "utf-8");
			}
			
			Brand brand = brandService.findBrandById(id);
			if(brand == null){
				return "redirect:/error.do?action=1&message=" + URLEncoder.encode(LocalizationUtil.getClientString("PageNotFound", request), "utf-8");
			}
			
			model.addAttribute("brandDTO", brand.toDTO());
			
			List<ProductDTO> productDTOList = productService.getProductDTOListByBrandId(0, 1000, id);	
			
			model.addAttribute("productDTOList", productDTOList);
			
			//default product
			Product product = productService.findProductById(pId);
			if(product != null && product.getBrand().getIdBrd() == id){
				List<ProductPic> list = productService.getProductPicListByProductId(pId);
				List<ProductPicDTO> productPicDTOList = new ArrayList<ProductPicDTO>();
				for(ProductPic pd: list){
					productPicDTOList.add(pd.toDTO());
				}
				model.addAttribute("productPicDTOList", productPicDTOList);
			}		
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "brandDetail";
	}
	
	@RequestMapping(params = "action=list")
	public String list(HttpServletRequest request, HttpServletResponse response, Model model) {
		try{			
			List<BrandDTO> brandDTOList = brandService.getBrandDTOList();
			model.addAttribute("brandDTOList", brandDTOList);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "brandDetail";
	}
}
