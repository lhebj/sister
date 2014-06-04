package com.sister.web.dto;


public class MessageDTO {
	private Long idMsg;
	private String messageMsg;
	private String dateCreateMsg;
	private String ipMsg;
	public Long getIdMsg() {
		return idMsg;
	}
	public void setIdMsg(Long idMsg) {
		this.idMsg = idMsg;
	}
	public String getMessageMsg() {
		return messageMsg;
	}
	public void setMessageMsg(String messageMsg) {
		this.messageMsg = messageMsg;
	}
	public String getDateCreateMsg() {
		return dateCreateMsg;
	}
	public void setDateCreateMsg(String dateCreateMsg) {
		this.dateCreateMsg = dateCreateMsg;
	}
	public String getIpMsg() {
		return ipMsg;
	}
	public void setIpMsg(String ipMsg) {
		this.ipMsg = ipMsg;
	}
}
