package com.sister.service.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sister.pojo.Product;
import com.sister.pojo.ProductPic;
import com.sister.web.dto.ProductDTO;

public interface IProductService {

public void saveOrUpdateProduct(Product product);
	
	public Product findProductById(Long id);
	
	public void deleteProduct(Product product);
	
	public void deleteProductById(Long id);
	
	public  Map<String, Object> deleteFullProductById(Long id,HttpServletRequest request);
	
	public int getProductTotalCountByBrandId(long brandId);
	
	public List<ProductDTO> getProductDTOListByBrandId (int start, int limit, long brandId); 
	
	public List<ProductDTO> getProductDTOList (int start, int limit);
	
	public int getProductTotalCount();
	
	public int getProductTotalCountByName(String name);
	
	public List<ProductDTO> getProductDTOListByName (int start, int limit, String name); 
	
	
	public void saveOrUpdateProductPic(ProductPic pdl);
	
	public ProductPic findProductPicById(Long id);
	
	public void deleteProductPic(ProductPic pdl);
	
	public void deleteProductPicById(Long id);
	
	public List<ProductPic> getProductPicListByProductId (Long productId);
}
