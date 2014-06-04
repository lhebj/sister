package com.sister.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.acegisecurity.providers.dao.DaoAuthenticationProvider;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sister.web.util.RunAsAdminManager;


@Controller
@RequestMapping("/")
public class LogoutController {
	
	@Resource
	private DaoAuthenticationProvider daoAuthenticationProvider;
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, Model model){
//		WebUtil.removeCookie(response, CommonStaticConst.COOKIE_ASUSS);
		RunAsAdminManager.authenticationAsGuest(daoAuthenticationProvider);
		return "redirect:/index.do";		
	}
	
}
