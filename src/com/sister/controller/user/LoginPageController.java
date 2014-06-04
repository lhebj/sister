package com.sister.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sister.web.util.ParamUtils;



@Controller
@RequestMapping("/")
public class LoginPageController {

	@RequestMapping("/pLogin.do")
	public String index(HttpServletRequest request, HttpServletResponse response, Model model){
		// TODO Auto-generated method stub
		String type = ParamUtils.getParameter(request, "type");		
		model.addAttribute("type", type);
		return "login";
	}

}
