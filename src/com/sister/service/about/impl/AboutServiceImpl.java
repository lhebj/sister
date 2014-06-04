package com.sister.service.about.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sister.dao.IAboutDAO;
import com.sister.pojo.About;
import com.sister.service.about.IAboutService;

@Service(value = "aboutService")
public class AboutServiceImpl implements IAboutService {

	@Resource
	private IAboutDAO aboutDAO;
	
	@Override
	public void saveOrUpdateAbout(About about) {
		// TODO Auto-generated method stub
		aboutDAO.saveOrUpdateAbout(about);
	}

	@Override
	public About findAboutById(Long id) {
		// TODO Auto-generated method stub
		return aboutDAO.findAboutById(id);
	}

	@Override
	public void deleteAbout(About about) {
		// TODO Auto-generated method stub
		aboutDAO.deleteAbout(about);
	}

	@Override
	public About findAboutByType(String typeAb) {
		// TODO Auto-generated method stub
		return aboutDAO.findAboutByType(typeAb);
	}

}
