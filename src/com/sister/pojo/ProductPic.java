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

import com.sister.web.dto.ProductPicDTO;
import com.sister.web.upload.UploadFileUtil;
import com.sister.web.util.DateUtil;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sister_product_pic_prdp", catalog = "sisterdb")
public class ProductPic implements java.io.Serializable {
	public static final String NAME_PRE = "namePrdl";
	public static final String FILE_PRE = "dlFile";
	public static final int MAX_UPLOADFILES = 20;
	
	/**
	 * TODO
	 */
	private static final long serialVersionUID = -3339873434450414228L;
	private Long idPrdp;
	private Product product;
	private String infoPrdp;
	private Content picPrdp;
	private Date dateCreatePrdp;

	// Constructors

	/** default constructor */
	public ProductPic() {
	}

	/** full constructor */
	public ProductPic(Long idPrdp,Product product, String infoPrdp, Content picPrdp, Date dateCreatePrdp) {
		this.idPrdp = idPrdp;
		this.product = product;
		this.infoPrdp = infoPrdp;
		this.picPrdp = picPrdp;
		this.dateCreatePrdp = dateCreatePrdp;
	}

	@Id
	@GeneratedValue
	@Column(name = "id_prdp", unique = true, nullable = false)
	public Long getIdPrdp() {
		return idPrdp;
	}

	public void setIdPrdp(Long idPrdp) {
		this.idPrdp = idPrdp;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_prd_prdp")
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Column(name = "info_prdp", length = 256)
	public String getInfoPrdp() {
		return infoPrdp;
	}

	public void setInfoPrdp(String infoPrdp) {
		this.infoPrdp = infoPrdp;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_pic_prdp")
	public Content getPicPrdp() {
		return picPrdp;
	}

	public void setPicPrdp(Content picPrdp) {
		this.picPrdp = picPrdp;
	}

	@Column(name = "date_create_prdp", length = 19)
	public Date getDateCreatePrdp() {
		return dateCreatePrdp;
	}

	public void setDateCreatePrdp(Date dateCreatePrdp) {
		this.dateCreatePrdp = dateCreatePrdp;
	}
	
	public ProductPicDTO toDTO(){
		ProductPicDTO dto = new ProductPicDTO();
		dto.setInfoPrdp(infoPrdp);
		if(picPrdp != null){
			dto.setPicNamePrdp(getPicPrdp().getFilenameCon());
			dto.setPicPathPrdp(UploadFileUtil.getContentPath(getPicPrdp()));
		}
		dto.setDateCreatePrdp(DateUtil.format(dateCreatePrdp, DateUtil.DEFAULT_DATETIME_FORMAT));
		return dto;
	}
	
}
