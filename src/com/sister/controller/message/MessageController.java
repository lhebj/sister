package com.sister.controller.message;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sister.messagefactory.MailBody;
import com.sister.pojo.Message;
import com.sister.service.message.IMessageService;
import com.sister.web.util.DateUtil;
import com.sister.web.util.JSONHelperUtil;
import com.sister.web.util.LogUtil;
import com.sister.web.util.MailSenderUtil;
import com.sister.web.util.ParamUtils;
import com.sister.web.util.SisterConfig;
import com.sister.web.util.StringUtil;
import com.sister.web.util.WebUtil;

@Controller
@RequestMapping("/message.do")
public class MessageController {


	@Resource(name = "messageService")
	private IMessageService messageService;
	
	@RequestMapping(params = "action=save")
	public String save(HttpServletRequest request, HttpServletResponse response) {
		String message = ParamUtils.getParameter(request, "message");
		
		try {

			if (message == null) {
				JSONHelperUtil.outputOperationResultAsJSON(Boolean.FALSE, "Parameter.error", response);
				return null;
			}

			Message msg = new Message();
			msg.setMessageMsg(message);
			msg.setDateCreateMsg(new Date());
			msg.setIpMsg(StringUtil.getRequestIp(request));
			messageService.saveOrUpdateMessage(msg);
			LogUtil.log.info(StringUtil.getRequestIp(request) + ", " + WebUtil.getUserId(request) + " saves msg id " + msg.getMessageMsg());
//			this.sendEmail(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONHelperUtil.outputOperationResultAsJSON(Boolean.TRUE, "success", response);
		return null;
	}
	
	private void sendEmail(Message msg){
		
		MailBody mailbody = new MailBody();
		mailbody.setFrom(SisterConfig.MAIL_USERNAME);
		mailbody.setPersonal(SisterConfig.EMAIL_PERSONAL_CN);
		mailbody.setTo(SisterConfig.EMAIL_RECIPIENT);
		mailbody.setSubject("用户留言");
		mailbody.setText("<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"></head><body>" +
				"<table> " +
				"<tr><td>用户IP：</td><td>"+(msg.getIpMsg()!=null?msg.getIpMsg():"")+"</td></tr>" +
				"<tr><td>时间：</td><td>"+DateUtil.format(msg.getDateCreateMsg(), DateUtil.DEFAULT_DATETIME_FORMAT)+"</td></tr>" +
				"<tr><td>信息：</td><td>"+(msg.getMessageMsg()!=null?msg.getMessageMsg():"")+"</td></tr>" +
				"</table>" +
				"</body></html>");
		mailbody.setActivated(true);
		mailbody.setWillSend(true);
		MailSenderUtil.sendMimeMail(mailbody);
	}
}
