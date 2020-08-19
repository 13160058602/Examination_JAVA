package com.ecit.service;

import java.util.List;

import com.ecit.entity.Page;
import com.ecit.entity.User;
import com.ecit.entity.UserType;

public interface UserService {
	/**
	 * 查询用户：用户列表，单个用户是否存在
	 * @param user
	 * @return
	 */
	public List<User> queryUserByPar(User user);
	
	/**
	 * 注册用户
	 * @param user
	 * @return
	 */
	public int insertUser(User user);
	
	/**
	 * 修改用户
	 * @param user
	 * @return
	 */
	public int updateUser(User user);
	
	
	public List<UserType> queryUserTypeList();
	
	public Page formatPageEntity(Page page);
}
