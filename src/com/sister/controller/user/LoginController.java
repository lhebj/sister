package com.sister.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.acegisecurity.providers.dao.DaoAuthenticationProvider;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sister.pojo.User;
import com.sister.service.user.IUserService;
import com.sister.web.util.JSONHelperUtil;
import com.sister.web.util.MD5Util;
import com.sister.web.util.ParamUtils;
import com.sister.web.util.RunAsAdminManager;

@Controller
@RequestMapping("/")
public class LoginController {
	@Resource
	private IUserService userService;

	@Resource
	private DaoAuthenticationProvider daoAuthenticationProvider;

	@RequestMapping("/login.do")
	public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
		// TODO Auto-generated method stub
		String usernameOrEmail = ParamUtils.getParameter(request, "usernameOrEmail");
		String password = ParamUtils.getParameter(request, "password");
		if (usernameOrEmail == null) {
			return "redirect:/pLogin.do?type=fail";
		}
		if (password == null) {
			return "redirect:/pLogin.do?type=fail";
		}
		User user = null;
		user = userService.findUserByUsername(usernameOrEmail);
		if (user == null) {
			user = userService.findUserByEmail(usernameOrEmail);
		}
		if (user != null) {
			String encryption = MD5Util.getMD5(MD5Util.getMD5( password + user.getSaltU()));
			if (encryption.equals(user.getPasswordU())) {
				RunAsAdminManager.authenticationRestore(daoAuthenticationProvider, user);
				return "redirect:/admin.do?action=home";
			}
		}
		return "redirect:/pLogin.do?type=fail";
	}

}
