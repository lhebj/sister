package com.sister.service.message;

import java.util.List;

import com.sister.pojo.Message;
import com.sister.web.dto.MessageDTO;

public interface IMessageService {
	public void saveOrUpdateMessage(Message message);
	
	public Message findMessageById(Long id);
	
	public void deleteMessage(Message message);
	
	public void deleteMessageById(Long id);
	
	public List<MessageDTO> getMessageList (int start, int limit); 
	
	public int getMessageTotalCount();
}
