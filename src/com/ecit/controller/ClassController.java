package com.ecit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecit.entity.ClassMessage;
import com.ecit.entity.ClassType;
import com.ecit.entity.Page;
import com.ecit.entity.User;
import com.ecit.entity.UserType;
import com.ecit.service.ClassService;
import com.ecit.service.UserService;

@Controller("classController")
@Scope("prototype")
@RequestMapping("/class")
public class ClassController {
	
	@Resource
	private ClassService classService;
	@Resource
	private UserService userService;
	
	@RequestMapping("/toClassMessageListPage")
	public String toClassMessageListPage(ClassMessage classMessage ,Page page, ModelMap map){
		
		if(!StringUtils.isEmpty(classMessage.getNameLike())){
			map.put("nameLike", classMessage.getNameLike());
			classMessage.setNameLike("%"+classMessage.getNameLike()+"%");
		}
		
		List<ClassMessage> cms = classService.queryClassList(classMessage);
		
		page.setCount(cms.size());
		
		page = userService.formatPageEntity(page);
		
		classMessage.setIndex(page.getIndex());
		classMessage.setSize(page.getSize());
		
		cms = classService.queryClassList(classMessage);
		
		map.put("page", page); 
		map.put("classMessageList", cms);
		
		return "admin/classMessageList";
	}
	
	@RequestMapping("/toInsertClassMessagePage")
	public String toInsertClassMessagePage(ModelMap map){
		
		List<ClassType> cts = classService.queryClassTypeList();
		
		map.put("classTypeList", cts);
		
		return "admin/classMessageInsert";
	}
	
	@ResponseBody
	@RequestMapping("/getClassLevelList")
	public Object getClassLevelList(@RequestParam("typeId")Integer typeId){
		
		return classService.queryClassLevelByTypeId(typeId);
	}
	
	@RequestMapping("/insertClassMessage")
	public String insertClassMessage(ClassMessage classMessage,HttpSession session){
		User user = (User)session.getAttribute("user");
		classMessage.setUserId(user.getId());
		int r = classService.insertClassMessage(classMessage);
		if(r == 1){
			return "redirect:/class/toClassMessageListPage.do?message=新增班级成功!";
		}else{
			return "redirect:/class/toInsertClassMessagePage.do?message=新增班级失败!";
		}
	}
}
