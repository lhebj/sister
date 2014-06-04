package com.sister.dao;

import com.sister.pojo.Content;

public interface IContentDAO {
	public void saveOrUpdateContent(Content content);
	
	public Content findContentDetailById(Long id);
	
	public void deleteContent(Content content);
}
