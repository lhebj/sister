package com.sister.dao;

import java.util.List;

import com.sister.pojo.Product;

public interface IProductDAO {

	public void saveOrUpdateProduct(Product product);
	
	public Product findProductById(Long id);
	
	public void deleteProduct(Product product);
	
	public void deleteProductById(Long id);
	
	public List<Product> getProductListByBrandId (int start, int limit, long brandId); 
	
	public int getProductTotalCountByBrandId(long brandId);
	
	public List<Product> getProductList (int start, int limit);
	
	public int getProductTotalCount();
	
	public List<Product> getProductListByName (int start, int limit, String name); 
	
	public int getProductTotalCountByName(String name); 
}
