package com.sister.controller.about;

import java.net.URLEncoder;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sister.pojo.About;
import com.sister.service.about.IAboutService;
import com.sister.web.util.JSONHelperUtil;
import com.sister.web.util.LocalizationUtil;
import com.sister.web.util.LogUtil;
import com.sister.web.util.ParamUtils;
import com.sister.web.util.WebUtil;

@Controller
@RequestMapping("/aboutAdmin.do")
public class AboutAdminControll {

	@Resource(name = "aboutService")
	private IAboutService aboutService;

	@RequestMapping(params = "action=save")
	public String save(HttpServletRequest request, HttpServletResponse response) {
		String contentAb = ParamUtils.getParameter(request, "contentAb");
		String typeAb = ParamUtils.getParameter(request, "typeAb");

		try {
			if (contentAb == null || typeAb == null) {
				return "redirect:/error.do?action=1&message=" + URLEncoder.encode(LocalizationUtil.getClientString("Parameter.error", request), "utf-8");
			}
			About about = aboutService.findAboutByType(typeAb);
			if (about == null) {
				return "redirect:/error.do?action=1&message=" + URLEncoder.encode(LocalizationUtil.getClientString("Parameter.error", request), "utf-8");
			}
			about.setContentAb(contentAb);
			about.setTypeAb(typeAb);
			about.setDateCreateAb(new Date());
			aboutService.saveOrUpdateAbout(about);
			LogUtil.log.info(WebUtil.getUserId(request) + " saves about type " + about.getTypeAb());

		} catch (Exception e) {
			e.printStackTrace();
			JSONHelperUtil.outputOperationResultAsJSON(Boolean.FALSE, "saveOrUpdate false!", response);
		}
		if(typeAb.equals(About.TYPE_ABOUT)){
			return "redirect:/admin.do?action=manageAbout";
		}
		return "redirect:/admin.do?action=manageContact";
	}
}
