package com.sister.dao.hibernate.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.sister.dao.IBasicHibernateDAO;
import com.sister.dao.IContentDAO;
import com.sister.pojo.Content;


@Repository("contentDAO")
public class ContentDAOImpl implements IContentDAO {
	
	@Resource
	private IBasicHibernateDAO basicHibernateDao;

	@Override
	public void saveOrUpdateContent(Content content) {
		// TODO Auto-generated method stub
		basicHibernateDao.saveOrUpdate(content);
	}

	@Override
	public Content findContentDetailById(Long id) {
		// TODO Auto-generated method stub
		return basicHibernateDao.getById(Content.class, id);
	}

	@Override
	public void deleteContent(Content content) {
		// TODO Auto-generated method stub
		basicHibernateDao.delete(content);
	}

}
