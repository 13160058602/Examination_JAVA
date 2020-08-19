package com.ecit.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.ecit.dao.ClassDao;
import com.ecit.dao.UserDao;
import com.ecit.entity.ClassLevel;
import com.ecit.entity.ClassMessage;
import com.ecit.entity.ClassType;
import com.ecit.service.ClassService;

@Service("classService")
@Scope("prototype")
public class ClassServiceImpl implements ClassService{
	@Resource
	private ClassDao classDao;

	public int insertClassMessage(ClassMessage clazz) {
		// TODO Auto-generated method stub
		return classDao.insertClassMessage(clazz);
	}

	public List<ClassLevel> queryClassLevelByTypeId(Integer typeId) {
		// TODO Auto-generated method stub
		return classDao.queryClassLevelByTypeId(typeId);
	}

	public List<ClassMessage> queryClassList(ClassMessage clazz) {
		// TODO Auto-generated method stub
		return classDao.queryClassList(clazz);
	}

	public List<ClassType> queryClassTypeList() {
		// TODO Auto-generated method stub
		return classDao.queryClassTypeList();
	}
	
	

}
