package com.ecit.service;

import java.util.List;

import com.ecit.entity.ClassLevel;
import com.ecit.entity.ClassMessage;
import com.ecit.entity.ClassType;

public interface ClassService {
	
	public List<ClassMessage> queryClassList(ClassMessage clazz);
	
	public int insertClassMessage(ClassMessage clazz);
	
	public List<ClassType> queryClassTypeList();
	
	public List<ClassLevel> queryClassLevelByTypeId(Integer typeId);
	
}
