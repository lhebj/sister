package com.sister.dao;

import java.util.List;

import com.sister.pojo.User;
import com.sister.pojo.UserAuthority;

public interface IUserDAO {
	public void saveOrUpdateUser(User user);
	
	public User findUserDetailById(Long id);
	
	
	public User findUserByUsername(String username);
	
	public User findUserByEmail(String email);
	
	public void deleteUser(User user);
	
	
	public void saveOrUpdateUserAuthority(UserAuthority userAuthority);
	
	public UserAuthority findUserAuthorityByUserId(Long userId);	
	
	public List<User> getUserList (int start, int limit); 
	
	public int getUserTotalCount();
}
