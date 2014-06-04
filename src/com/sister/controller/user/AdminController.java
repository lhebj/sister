package com.sister.controller.user;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gdata.util.common.base.StringUtil;
import com.sister.pojo.About;
import com.sister.pojo.Brand;
import com.sister.pojo.Product;
import com.sister.pojo.ProductPic;
import com.sister.pojo.User;
import com.sister.service.about.IAboutService;
import com.sister.service.brand.IBrandService;
import com.sister.service.message.IMessageService;
import com.sister.service.product.IProductService;
import com.sister.service.user.IUserService;
import com.sister.web.dto.BrandDTO;
import com.sister.web.dto.MessageDTO;
import com.sister.web.dto.ProductDTO;
import com.sister.web.dto.ProductPicDTO;
import com.sister.web.dto.UserDTO;
import com.sister.web.util.LocalizationUtil;
import com.sister.web.util.PageUtil;
import com.sister.web.util.ParamUtils;
import com.sister.web.util.WebUtil;

@Controller
@RequestMapping("/admin.do")
public class AdminController {

	@Resource(name = "userService")
	private IUserService userService;

	@Resource(name = "brandService")
	private IBrandService brandService;

	@Resource(name = "productService")
	private IProductService productService;

	@Resource(name = "aboutService")
	private IAboutService aboutService;
	
	@Resource(name = "messageService")
	private IMessageService messageService;

	@RequestMapping(params = "action=home")
	public String home(HttpServletRequest request, HttpServletResponse response, Model model) {
		String fromurl = ParamUtils.getParameter(request, "fromurl");
		if (fromurl != null) {
			return "redirect:" + fromurl;
		}
		return "admin/home";
	}


	@RequestMapping(params = "action=manageUsers")
	public String manageUsers(HttpServletRequest request, HttpServletResponse response, Model model) {
		int curPage = ParamUtils.getIntParameter(request, "curPage", 1);
		int pageSize = ParamUtils.getIntParameter(request, "pageSize", 10);
		int totalCount = userService.getUserTotalCount();
		PageUtil pageUtil = new PageUtil(totalCount, curPage, pageSize);
		List<User> userList = userService.getUserList(pageUtil.getStart(), pageUtil.getEnd());
		List<UserDTO> userDtoList = new ArrayList<UserDTO>();
		for (User user : userList) {
			userDtoList.add(user.toDTO());
		}
		model.addAttribute("userDtoList", userDtoList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageutil", pageUtil.getToolBar("admin.do?action=manageUsers", request));
		return "admin/user/manageUsers";
	}

	@RequestMapping(params = "action=modifyPassword")
	public String modifyPassword(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "admin/user/setPassword";
	}

	@RequestMapping(params = "action=setPassword")
	public String setPassword(HttpServletRequest request, HttpServletResponse response, Model model) {
		String oldPassword = ParamUtils.getParameter(request, "oldPassword");
		String newPassword = ParamUtils.getParameter(request, "newPassword");
		String newPasswordSure = ParamUtils.getParameter(request, "newPasswordSure");

		if (StringUtil.isEmptyOrWhitespace(oldPassword)) {
			model.addAttribute("message", "当前密码不能为空");
			return "admin/user/setPassword";
		}

		if (StringUtil.isEmptyOrWhitespace(newPassword)) {
			model.addAttribute("message", "新密码不能为空");
			return "admin/user/setPassword";
		}

		if (StringUtil.isEmptyOrWhitespace(newPasswordSure) || !newPasswordSure.equals(newPassword)) {
			model.addAttribute("message", "确认密码不一致");
			return "admin/user/setPassword";
		}

		User user = userService.findUserByUsername(WebUtil.getUserId(request));
		if (!oldPassword.equals(user.getPasswordU())) {
			model.addAttribute("message", "当前密码不正确");
			return "admin/user/setPassword";
		}

		user.setPasswordU(newPassword);
		userService.saveOrUpdateUser(user);

		return "redirect:/admin.do?action=manageUsers";
	}

	@RequestMapping(params = "action=manageNews")
	public String manageNews(HttpServletRequest request, HttpServletResponse response, Model model) {
		About about = aboutService.findAboutByType(About.TYPE_NEWS);
		if (about != null) {
			model.addAttribute("about", about);
		}
		return "admin/about/manageAbout";
	}
	
	@RequestMapping(params = "action=manageContact")
	public String manageContact(HttpServletRequest request, HttpServletResponse response, Model model) {
		About about = aboutService.findAboutByType(About.TYPE_CONTACT);
		if (about != null) {
			model.addAttribute("about", about);
		}
		return "admin/about/manageAbout";
	}

	@RequestMapping(params = "action=manageAbout")
	public String manageAbout(HttpServletRequest request, HttpServletResponse response, Model model) {
		About about = aboutService.findAboutByType(About.TYPE_ABOUT);
		if (about != null) {
			model.addAttribute("about", about);
		}
		return "admin/about/manageAbout";
	}

	@RequestMapping(params = "action=postAbout")
	public String postAbout(HttpServletRequest request, HttpServletResponse response, Model model) {
		String type = ParamUtils.getParameter(request, "type");
		if (type != null) {
			About about = aboutService.findAboutByType(type);
			if (about != null) {
				model.addAttribute("about", about);
			}
		}
		if (About.TYPE_ABOUT.equals(type)) {
			model.addAttribute("type", LocalizationUtil.getClientString("About.about", request));
		}
		if (About.TYPE_CONTACT.equals(type)) {
			model.addAttribute("type", LocalizationUtil.getClientString("About.contact", request));
		}
		if (About.TYPE_NEWS.equals(type)) {
			model.addAttribute("type", LocalizationUtil.getClientString("About.news", request));
		}

		return "admin/about/postAbout";
	}

	@RequestMapping(params = "action=manageBrand")
	public String manageBrand(HttpServletRequest request, HttpServletResponse response, Model model) {
		List<BrandDTO> brandDTOList = brandService.getBrandDTOList();
		model.addAttribute("brandDTOList", brandDTOList);
		return "admin/brand/manageBrand";
	}

	@RequestMapping(params = "action=postBrand")
	public String postBrand(HttpServletRequest request, HttpServletResponse response, Model model) {
		Long id = ParamUtils.getLongParameter(request, "id", 0);
		if (id != 0) {
			Brand brand = brandService.findBrandById(id);
			if (brand != null) {
				model.addAttribute("brandDTO", brand.toDTO());
			}
		}

		return "admin/brand/postBrand";
	}
	@RequestMapping(params = "action=manageProduct")
	public String manageProduct(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		// 分类及产品
		int curPage = ParamUtils.getIntParameter(request, "curPage", 1);
		int pageSize = ParamUtils.getIntParameter(request, "pageSize", 10);
		long brandId = ParamUtils.getLongParameter(request, "brandId", 0);

		if (brandId != 0) {
			Brand brand = brandService.findBrandById(brandId);
			if (brand != null) {
				model.addAttribute("brandDTO", brand.toDTO());
			}
		}

		List<ProductDTO> productDTOList = null;
		PageUtil pageUtil = null;
		String pageLink = null;

		int totalCount = productService.getProductTotalCountByBrandId(brandId);
		pageUtil = new PageUtil(totalCount, curPage, pageSize);
		productDTOList = productService.getProductDTOListByBrandId(pageUtil.getStart(), pageUtil.getEnd(), brandId);
		pageLink = "admin.do?action=manageProduct";
		model.addAttribute("productDTOList", productDTOList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageutil", pageUtil.getToolBar(pageLink, request));
		return "admin/product/manageProduct";
	}

	@RequestMapping(params = "action=postProduct")
	public String postProduct(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		Long id = ParamUtils.getLongParameter(request, "id", 0);
		long brandId = ParamUtils.getLongParameter(request, "brandId", 0);

		model.addAttribute("selectedBrandId", brandId);
		
		List<BrandDTO> brandDTOList = brandService.getBrandDTOList();
		model.addAttribute("brandDTOList", brandDTOList);
		if( id!=0 ){
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
		}
		

		return "admin/product/postProduct";
	}
	

	@RequestMapping(params = "action=manageMessage")
	public String manageMessage(HttpServletRequest request, HttpServletResponse response, Model model) {

		int curPage = ParamUtils.getIntParameter(request, "curPage", 1);
		int pageSize = ParamUtils.getIntParameter(request, "pageSize", 10);
		int totalCount = 0;
		List<MessageDTO> messageDTOList = null;
		PageUtil pageUtil = null;
		String pageLink = "admin.do?action=manageMessage";

		totalCount = messageService.getMessageTotalCount();
		pageUtil = new PageUtil(totalCount, curPage, pageSize);
		messageDTOList = messageService.getMessageList(pageUtil.getStart(), pageUtil.getLimit());
		model.addAttribute("messageDTOList", messageDTOList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageutil", pageUtil.getToolBar(pageLink, request));
		return "admin/message/manageMessage";
	}
}
