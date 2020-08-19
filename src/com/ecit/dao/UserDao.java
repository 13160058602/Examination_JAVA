package com.ecit.dao;

import java.util.List;

import com.ecit.entity.User;
import com.ecit.entity.UserType;

public interface UserDao {
	/**
	 * ��ѯ�û����û��б������û��Ƿ����
	 * @param user
	 * @return
	 */
	public List<User> queryUserByPar(User user);
	
	/**
	 * ע���û�
	 * @param user
	 * @return
	 */
	public int insertUser(User user);
	
	/**
	 * �޸��û�
	 * @param user
	 * @return
	 */
	public int updateUser(User user);
	
	
	
	public List<UserType> queryUserTypeList(UserType ut);
	
	
	
}
