package com.sister.dao.hibernate.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.sister.dao.IBasicHibernateDAO;
import com.sister.dao.IProductPicDAO;
import com.sister.pojo.ProductPic;

@Repository("productDownloadDAO")
public class ProductPicDAOImpl implements IProductPicDAO {

	@Resource
	private IBasicHibernateDAO basicHibernateDao;

	@Override
	public void saveOrUpdateProductPic(ProductPic pdl) {
		// TODO Auto-generated method stub
		basicHibernateDao.saveOrUpdate(pdl);
	}

	@Override
	public ProductPic findProductPicById(Long id) {
		// TODO Auto-generated method stub
		String hql = " from ProductPic where idPrdl=:idPrdl ";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idPrdl", id);
		List<ProductPic> list = basicHibernateDao.getResultList(0, 1, hql.toString(), param);
		return list.size() > 0 ? list.get(0) : null;
	}

	@Override
	public void deleteProductPic(ProductPic pdl) {
		// TODO Auto-generated method stub
		basicHibernateDao.delete(pdl);
	}
	
	public void deleteProductPicById(Long id){
		String hql = " delete from ProductPic where idPrdp=:idPrdp ";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idPrdp", id);
		basicHibernateDao.executeUpdate(hql, param);
	}

	@Override
	public List<ProductPic> getProductPicListByProductId(Long productId) {
		// TODO Auto-generated method stub
		String hql = " from ProductPic where product.idPrd=:idPrd ";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idPrd", productId);
		List<ProductPic> list = basicHibernateDao.getResultList(0, 0, hql.toString(), param);
		return list;
	}

}
