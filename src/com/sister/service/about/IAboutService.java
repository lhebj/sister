package com.sister.service.about;

import com.sister.pojo.About;

public interface IAboutService {
	public void saveOrUpdateAbout(About about);
	
	public About findAboutById(Long id);
	
	public void deleteAbout(About about);
	
	public About findAboutByType(String typeAb);
}
