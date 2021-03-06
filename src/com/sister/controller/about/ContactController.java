package com.sister.controller.about;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sister.pojo.About;
import com.sister.service.about.IAboutService;

@Controller
@RequestMapping("/")
public class ContactController {
	@Resource(name = "aboutService")
	private IAboutService aboutService;
	
	@RequestMapping("/contact.do")
	public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
		About about = aboutService.findAboutByType(About.TYPE_CONTACT);
		if(about != null){
			model.addAttribute("contact", about.toDTO());
		}
		return "contact";
	}
}
