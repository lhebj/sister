package com.sister.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.sister.web.dto.MessageDTO;
import com.sister.web.util.DateUtil;

/**
 * ProMessageMsg entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sister_message_msg", catalog = "sisterdb")
public class Message implements java.io.Serializable {

	// Fields

	/**
	 * TODO
	 */
	private static final long serialVersionUID = 9059404522220519517L;
	private Long idMsg;
	private String messageMsg;
	private Date dateCreateMsg;
	private String ipMsg;

	// Constructors

	/** default constructor */
	public Message() {
	}

	/** full constructor */
	public Message(String messageMsg, Date dateCreateMsg, String ipMsg) {
		this.messageMsg = messageMsg;
		this.dateCreateMsg = dateCreateMsg;
		this.ipMsg = ipMsg;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "id_msg", unique = true, nullable = false)
	public Long getIdMsg() {
		return this.idMsg;
	}

	public void setIdMsg(Long idMsg) {
		this.idMsg = idMsg;
	}

	@Column(name = "message_msg", length = 8192)
	public String getMessageMsg() {
		return this.messageMsg;
	}

	public void setMessageMsg(String messageMsg) {
		this.messageMsg = messageMsg;
	}

	
	@Column(name = "date_create_msg", length = 19)
	public Date getDateCreateMsg() {
		return this.dateCreateMsg;
	}

	public void setDateCreateMsg(Date dateCreateMsg) {
		this.dateCreateMsg = dateCreateMsg;
	}

	@Column(name = "ip_msg", length = 16)
	public String getIpMsg() {
		return this.ipMsg;
	}

	public void setIpMsg(String ipMsg) {
		this.ipMsg = ipMsg;
	}
	
	public MessageDTO toDTO(){
		MessageDTO dto  = new MessageDTO();
		dto.setIdMsg(idMsg);
		dto.setIpMsg(ipMsg);
		dto.setDateCreateMsg(DateUtil.format(dateCreateMsg, DateUtil.DEFAULT_DATETIME_FORMAT));
		dto.setMessageMsg(messageMsg);
		return dto;
	}

}