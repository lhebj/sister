package com.sister.dao;

import java.util.List;

import com.sister.pojo.ProductPic;

public interface IProductPicDAO {
	public void saveOrUpdateProductPic(ProductPic pdl);
	
	public ProductPic findProductPicById(Long id);
	
	public void deleteProductPic(ProductPic pdl);
	
	public void deleteProductPicById(Long id);
	
	public List<ProductPic> getProductPicListByProductId (Long productId);
}
