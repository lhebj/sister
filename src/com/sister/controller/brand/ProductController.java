package com.sister.controller.brand;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sister.pojo.Product;
import com.sister.pojo.ProductPic;
import com.sister.service.brand.IBrandService;
import com.sister.service.product.IProductService;
import com.sister.web.dto.ProductPicDTO;
import com.sister.web.util.LocalizationUtil;
import com.sister.web.util.ParamUtils;


@Controller
@RequestMapping("/product.do")
public class ProductController {
	
	@Resource(name = "brandService")
	private IBrandService brandService;
	
	@Resource(name = "productService")
	private IProductService productService; 
		
	@RequestMapping(params = "action=detail")
	public String detail(HttpServletRequest request, HttpServletResponse response, Model model) {
		Long id = ParamUtils.getLongParameter(request, "id", 0);
		if(id==0){
			return "redirect:/error.do?action=1&message=" + LocalizationUtil.getClientString("PageNotFound", request);
		}
		
		Product product = productService.findProductById(id);
		if(product == null){
			return "redirect:/error.do?action=1&message=" + LocalizationUtil.getClientString("PageNotFound", request);
		}		
		model.addAttribute("productDTO", product.toDTO());		
		
		List<ProductPic> list = productService.getProductPicListByProductId(id);
		List<ProductPicDTO> productPicDTOList = new ArrayList<ProductPicDTO>();
		for(ProductPic pd: list){
			productPicDTOList.add(pd.toDTO());
		}
		model.addAttribute("productPicDTOList", productPicDTOList);
		return "product";
	}
}
