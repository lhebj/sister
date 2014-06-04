package com.sister.pojo;

// default package

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sister.web.dto.ProductDTO;
import com.sister.web.upload.UploadFileUtil;
import com.sister.web.util.DateUtil;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sister_product_prd", catalog = "sisterdb")
public class Product implements java.io.Serializable {

	// Fields
	public static String FILE_LOGO="logo";

	/**
	 * TODO
	 */
	private static final long serialVersionUID = 7972167563372632720L;
	private Long idPrd;
	private String namePrd;
	private Brand brand;
	private String infoPrd;
	private Content logoPrd;
	private Date dateCreatePrd;

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** full constructor */
	public Product(Long idPrd, String namePrd, Brand brand, String infoPrd, Content logoPrd, Date dateCreatePrd) {
		this.idPrd = idPrd;
		this.namePrd = namePrd;
		this.brand = brand;
		this.infoPrd = infoPrd;
		this.logoPrd = logoPrd;
		this.dateCreatePrd = dateCreatePrd;
	}

	// Property accessors

	@Id
	@GeneratedValue
	@Column(name = "id_prd", unique = true, nullable = false)
	public Long getIdPrd() {
		return this.idPrd;
	}

	public void setIdPrd(Long idPrd) {
		this.idPrd = idPrd;
	}

	@Column(name = "name_prd", length = 256)
	public String getNamePrd() {
		return this.namePrd;
	}

	public void setNamePrd(String namePrd) {
		this.namePrd = namePrd;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_brd_prd")
	public Brand getBrand() {
		return this.brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	@Column(name = "info_prd", length = 128)
	public String getInfoPrd() {
		return this.infoPrd;
	}

	public void setInfoPrd(String infoPrd) {
		this.infoPrd = infoPrd;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_logo_prd")
	public Content getLogoPrd() {
		return logoPrd;
	}

	public void setLogoPrd(Content logoPrd) {
		this.logoPrd = logoPrd;
	}

	@Column(name = "date_create_prd", length = 19)
	public Date getDateCreatePrd() {
		return dateCreatePrd;
	}

	public void setDateCreatePrd(Date dateCreatePrd) {
		this.dateCreatePrd = dateCreatePrd;
	}

	public ProductDTO toDTO(){
		ProductDTO dto = new ProductDTO();
		dto.setIdPrd(idPrd);
		dto.setInfoPrd(infoPrd);
		dto.setNamePrd(namePrd);
		if(getLogoPrd() != null){
			dto.setLogoNamePrd(getLogoPrd().getFilenameCon());
			dto.setLogoPathPrd(UploadFileUtil.getContentPath(getLogoPrd()));
		}
		dto.setDateCreatePrd(DateUtil.format(dateCreatePrd, DateUtil.DEFAULT_DATETIME_FORMAT));
		return dto;
	}
}