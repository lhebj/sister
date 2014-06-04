package com.sister.service.content;

import com.sister.pojo.Content;

public interface IContentService {

	public void saveOrUpdateContent(Content content);
	
	public Content findContentDetailById(Long id);
	
	public void deleteContent(Content content);
}
