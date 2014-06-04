package com.sister.service.product.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.sister.dao.IProductDAO;
import com.sister.dao.IProductPicDAO;
import com.sister.pojo.Product;
import com.sister.pojo.ProductPic;
import com.sister.service.content.IContentService;
import com.sister.service.product.IProductService;
import com.sister.web.dto.ProductDTO;
import com.sister.web.util.CommonStaticConst;
import com.sister.web.util.LocalizationUtil;
import com.sister.web.util.LogUtil;
import com.sister.web.util.WebUtil;

@Service(value = "productService")
public class ProductServiceImpl implements IProductService {

	@Resource
	private IProductDAO productDAO;
	
	@Resource
	private IProductPicDAO productPicDAO;

	@Resource(name = "contentService")
	private IContentService contentService;

	@Override
	public void saveOrUpdateProduct(Product product) {
		// TODO Auto-generated method stub
		productDAO.saveOrUpdateProduct(product);
	}

	@Override
	public Product findProductById(Long id) {
		// TODO Auto-generated method stub
		return productDAO.findProductById(id);
	}

	@Override
	public void deleteProduct(Product product) {
		// TODO Auto-generated method stub
		productDAO.deleteProduct(product);
	}

	@Override
	public void deleteProductById(Long id) {
		// TODO Auto-generated method stub
		productDAO.deleteProductById(id);
	}

	public Map<String, Object> deleteFullProductById(Long id, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (id == 0) {
			map.put(CommonStaticConst.RETURN_MESSAGE, LocalizationUtil.getClientString("Parameter.error", request));
			map.put(CommonStaticConst.RETURN_SUCCESS, false);
			return map;
		}

		try {
			Product product = findProductById(id);
			if (product == null) {
				map.put(CommonStaticConst.RETURN_MESSAGE, LocalizationUtil.getClientString("Parameter.error", request));
				map.put(CommonStaticConst.RETURN_SUCCESS, false);
				return map;
			}
			
			List<ProductPic> list = this.getProductPicListByProductId(product.getIdPrd());
			for(ProductPic pp: list){
				this.deleteProductPic(pp);
			}

			this.deleteProduct(product);
			LogUtil.log.info(WebUtil.getUserId(request) + " deletes product id " + id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put(CommonStaticConst.RETURN_MESSAGE, "");
		map.put(CommonStaticConst.RETURN_SUCCESS, true);
		return map;
	}

	@Override
	public int getProductTotalCountByBrandId(long brandId) {
		return productDAO.getProductTotalCountByBrandId(brandId);
	}

	@Override
	public List<ProductDTO> getProductDTOListByBrandId(int start, int limit, long brandId) {
		// TODO Auto-generated method stub
		List<ProductDTO> dtoList = new ArrayList<ProductDTO>();
		List<Product> list = productDAO.getProductListByBrandId(start, limit, brandId);
		for (Product product : list) {
			dtoList.add(product.toDTO());
		}
		return dtoList;
	}

	public List<ProductDTO> getProductDTOList(int start, int limit) {
		// TODO Auto-generated method stub
		List<ProductDTO> dtoList = new ArrayList<ProductDTO>();
		List<Product> list = productDAO.getProductList(start, limit);
		for (Product product : list) {
			dtoList.add(product.toDTO());
		}
		return dtoList;
	}

	public int getProductTotalCount() {
		return productDAO.getProductTotalCount();
	}

	@Override
	public int getProductTotalCountByName(String name) {
		return productDAO.getProductTotalCountByName(name);
	}

	@Override
	public List<ProductDTO> getProductDTOListByName(int start, int limit, String name) {
		List<ProductDTO> dtoList = new ArrayList<ProductDTO>();
		List<Product> list = productDAO.getProductListByName(start, limit, name);
		for (Product product : list) {
			dtoList.add(product.toDTO());
		}
		return dtoList;
	}
	
	public void saveOrUpdateProductPic(ProductPic pdl){
		productPicDAO.saveOrUpdateProductPic(pdl);
	}
	
	public ProductPic findProductPicById(Long id){
		return productPicDAO.findProductPicById(id);
	}
	
	public void deleteProductPic(ProductPic pdl){
		productPicDAO.deleteProductPic(pdl);
	}
	
	public void deleteProductPicById(Long id){
		productPicDAO.deleteProductPicById(id);
	}
	
	public List<ProductPic> getProductPicListByProductId (Long productId){
		return productPicDAO.getProductPicListByProductId(productId);
	}
}
