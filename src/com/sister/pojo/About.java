package com.sister.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sister.web.dto.AboutDTO;
import com.sister.web.upload.UploadFileUtil;

/**
 * KnxAboutAb entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sister_about_ab", catalog = "sisterdb")
public class About implements java.io.Serializable {

	// Fields
	public static String TYPE_ABOUT = "about";
	public static String TYPE_CONTACT = "contact";
	public static String TYPE_NEWS = "news";
	
	/**
	 * TODO
	 */
	private static final long serialVersionUID = -2343832216513212251L;
	private Long idAb;
	private String typeAb;
	private Content picAb;
	private String contentAb;
	private String contentEnAb;
	private Date dateCreateAb;

	// Constructors

	/** default constructor */
	public About() {
	}

	/** full constructor */
	public About(Long idAb, String typeAb, Content picAb, String contentAb,String contentEnAb, Date dateCreateAb) {
		this.idAb = idAb;
		this.typeAb = typeAb;
		this.picAb = picAb;
		this.contentAb = contentAb;
		this.contentEnAb = contentEnAb; 
		this.dateCreateAb = dateCreateAb;
	}

	// Property accessors

	@Id
	@GeneratedValue
	@Column(name = "id_ab", unique = true, nullable = false)
	public Long getIdAb() {
		return this.idAb;
	}

	public void setIdAb(Long idAb) {
		this.idAb = idAb;
	}

	@Column(name = "type_ab", length = 7)
	public String getTypeAb() {
		return this.typeAb;
	}

	public void setTypeAb(String typeAb) {
		this.typeAb = typeAb;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_pic_ab")
	public Content getPicAb() {
		return picAb;
	}

	public void setPicAb(Content picAb) {
		this.picAb = picAb;
	}

	@Column(name = "content_ab", length = 65535)
	public String getContentAb() {
		return this.contentAb;
	}

	public void setContentAb(String contentAb) {
		this.contentAb = contentAb;
	}

	@Column(name = "content_en_ab", length = 65535)
	public String getContentEnAb() {
		return contentEnAb;
	}

	public void setContentEnAb(String contentEnAb) {
		this.contentEnAb = contentEnAb;
	}

	@Column(name = "date_create_ab", length = 19)
	public Date getDateCreateAb() {
		return this.dateCreateAb;
	}

	public void setDateCreateAb(Date dateCreateAb) {
		this.dateCreateAb = dateCreateAb;
	}

	public AboutDTO toDTO(){
		AboutDTO dto = new AboutDTO();
		dto.setIdAb(idAb);
		dto.setTypeAb(typeAb);
		dto.setContentAb(contentAb);
		dto.setContentEnAb(contentEnAb);
		if(this.getPicAb() != null){
			dto.setPicPath(UploadFileUtil.getContentPath(getPicAb()));
			dto.setPicName(getPicAb().getOriginalFilenameCon());
		}	
		return dto;
	}
	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof About))
			return false;
		About castOther = (About) other;

		return ((this.getIdAb() == castOther.getIdAb()) || (this.getIdAb() != null && castOther.getIdAb() != null && this.getIdAb().equals(castOther.getIdAb())))
				&& ((this.getTypeAb() == castOther.getTypeAb()) || (this.getTypeAb() != null && castOther.getTypeAb() != null && this.getTypeAb().equals(castOther.getTypeAb())))
				&& ((this.getContentAb() == castOther.getContentAb()) || (this.getContentAb() != null && castOther.getContentAb() != null && this.getContentAb().equals(castOther.getContentAb())))
				&& ((this.getDateCreateAb() == castOther.getDateCreateAb()) || (this.getDateCreateAb() != null && castOther.getDateCreateAb() != null && this.getDateCreateAb().equals(castOther.getDateCreateAb())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getIdAb() == null ? 0 : this.getIdAb().hashCode());
		result = 37 * result + (getTypeAb() == null ? 0 : this.getTypeAb().hashCode());
		result = 37 * result + (getContentAb() == null ? 0 : this.getContentAb().hashCode());
		result = 37 * result + (getDateCreateAb() == null ? 0 : this.getDateCreateAb().hashCode());
		return result;
	}

}