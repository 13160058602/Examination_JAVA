package com.ecit.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.ecit.dao.UserDao;
import com.ecit.entity.Page;
import com.ecit.entity.User;
import com.ecit.entity.UserType;
import com.ecit.service.UserService;

@Service("userService")
@Scope("prototype")
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserDao userDao;
	
	
	public List<User> queryUserByPar(User user) {
		// TODO Auto-generated method stub
		return userDao.queryUserByPar(user);
	}

	public int insertUser(User user) {
		// TODO Auto-generated method stub
		return userDao.insertUser(user);
	}

	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return userDao.updateUser(user);
	}

	public List<UserType> queryUserTypeList() {
		// TODO Auto-generated method stub
		return userDao.queryUserTypeList(new UserType());
	}

	public Page formatPageEntity(Page page) {
		// TODO Auto-generated method stub
		page.setSize(10);
		if(page.getPageNumber()==null){
			page.setPageNumber(1);
		}
		page.setIndex((page.getPageNumber()-1)*page.getSize());
		
		
		page.setPageCount(page.getCount()%page.getSize()==0?
				(page.getCount()/page.getSize()):
					((page.getCount()/page.getSize())+1));
		
		return page;
	}

}
