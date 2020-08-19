package com.ecit.dao;

import java.util.List;

import com.ecit.entity.ClassLevel;
import com.ecit.entity.ClassMessage;
import com.ecit.entity.ClassType;

public interface ClassDao {
	public List<ClassMessage> queryClassList(ClassMessage clazz);
	
	public int insertClassMessage(ClassMessage clazz);
	
	public List<ClassType> queryClassTypeList();
	
	public List<ClassLevel> queryClassLevelByTypeId(Integer typeId);
	
	
	
}
