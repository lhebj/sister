package com.sister.web.dto;


public class BrandDTO {
	
	private Long idBrd;
	private String nameBrd;
	private String picPath;
	private String picName;
	public Long getIdBrd() {
		return idBrd;
	}
	public void setIdBrd(Long idBrd) {
		this.idBrd = idBrd;
	}
	public String getNameBrd() {
		return nameBrd;
	}
	public void setNameBrd(String nameBrd) {
		this.nameBrd = nameBrd;
	}
	public String getPicPath() {
		return picPath;
	}
	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	public String getPicName() {
		return picName;
	}
	public void setPicName(String picName) {
		this.picName = picName;
	}
	
}
