package com.sister.controller.message;

import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sister.service.message.IMessageService;
import com.sister.web.util.JSONHelperUtil;
import com.sister.web.util.LocalizationUtil;
import com.sister.web.util.LogUtil;
import com.sister.web.util.ParamUtils;
import com.sister.web.util.WebUtil;

@Controller
@RequestMapping("/messageAdmin.do")
public class MessageAdminController {
	
	@Resource
	private IMessageService messageService;
	
	@RequestMapping(params = "action=delete")
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		Long id = ParamUtils.getLongParameter(request, "id", 0);

		try {
			if (id == 0) {
				return "redirect:/error.do?action=1&message=" + URLEncoder.encode(LocalizationUtil.getClientString("Parameter.error", request), "utf-8");
			}
			messageService.deleteMessageById(id);
			LogUtil.log.info(WebUtil.getUserId(request) + " deletes message id " + id);
		} catch (Exception e) {
			JSONHelperUtil.outputOperationResultAsJSON(Boolean.FALSE, "Delete false!", response);
			e.printStackTrace();
		}
		return "redirect:/admin.do?action=manageMessage";
	}
}
