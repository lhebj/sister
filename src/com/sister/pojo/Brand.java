package com.sister.pojo;

// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sister.web.dto.BrandDTO;
import com.sister.web.upload.UploadFileUtil;

/**
 * Brand entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sister_brand_brd", catalog = "sisterdb")
public class Brand implements java.io.Serializable {

	// Fields

	public static String FILE_PIC = "pic";
	
	/**
	 * TODO
	 */
	private static final long serialVersionUID = -6830309925526383474L;
	private Long idBrd;
	private String nameBrd;
	private Content picBrd;
	private Boolean isEnabledBrd;

	// Constructors

	/** default constructor */
	public Brand() {
	}

	/** full constructor */
	public Brand(Long idBrd, String nameBrd, Content picBrd, Boolean isEnabledBrd) {
		this.idBrd = idBrd;
		this.nameBrd = nameBrd;
		this.picBrd = picBrd;
		this.isEnabledBrd = isEnabledBrd;
	}

	// Property accessors

	@Id
	@GeneratedValue
	@Column(name = "id_brd", unique = true, nullable = false)
	public Long getIdBrd() {
		return this.idBrd;
	}

	public void setIdBrd(Long idBrd) {
		this.idBrd = idBrd;
	}

	@Column(name = "name_brd", length = 128)
	public String getNameBrd() {
		return this.nameBrd;
	}

	public void setNameBrd(String nameBrd) {
		this.nameBrd = nameBrd;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_pic_brd")
	public Content getPicBrd() {
		return picBrd;
	}

	public void setPicBrd(Content picBrd) {
		this.picBrd = picBrd;
	}
	

	@Column(name = "is_enabled_brd")
	public Boolean getIsEnabledBrd() {
		return this.isEnabledBrd;
	}

	public void setIsEnabledBrd(Boolean isEnabledBrd) {
		this.isEnabledBrd = isEnabledBrd;
	}
	
	public BrandDTO toDTO(){
		BrandDTO dto = new BrandDTO();
		dto.setIdBrd(idBrd);
		dto.setNameBrd(nameBrd);
		if(this.getPicBrd() != null){
			dto.setPicPath(UploadFileUtil.getContentPath(getPicBrd()));
			dto.setPicName(this.getPicBrd().getOriginalFilenameCon());
		}	
		return dto;
	}
}