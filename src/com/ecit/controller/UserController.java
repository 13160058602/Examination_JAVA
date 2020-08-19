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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecit.entity.Page;
import com.ecit.entity.User;
import com.ecit.entity.UserType;
import com.ecit.service.UserService;

@Controller("userController")
@Scope("prototype")
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserService userService;
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		
		session.removeAttribute("user");
		
		return "redirect:/page/admin/login.jsp";
	}
	
	@RequestMapping(value="/updateUserStuts")
	public String updateUserStuts(User user,Page page,ModelMap map){
		
		int r = userService.updateUser(user);
		if(r >= 1){
			map.put("message", "审核通过");
		}else{
			map.put("message", "审核失败，请联系管理员！");
		}
		List<User> users = userService.queryUserByPar(new User());
		map.put("userList", users);
		
		return "admin/userList";
	}
	
	@RequestMapping(value="/getUserList")
	public String getUserList(User user,Page page,
			HttpSession session,ModelMap map){
		if(!StringUtils.isEmpty(user.getUserNameLike())){
			map.put("userNameLike", user.getUserNameLike());
			user.setUserNameLike("%"+user.getUserNameLike()+"%");
		}
		//查所有数据
		List<User> users = userService.queryUserByPar(user);
		page.setCount(users.size());
		
		page = userService.formatPageEntity(page);
		
		user.setIndex(page.getIndex());
		user.setSize(page.getSize());
		users = userService.queryUserByPar(user);
		
		map.put("page", page);
		map.put("userList", users);
		
		return "admin/userList";
	}
	
	@RequestMapping(value="/toAdminIndexPage")
	public String toAdminIndexPage(HttpSession session){
		
		User user = (User)session.getAttribute("user");
		
		if(user == null){
			return "redirect:/page/admin/login.jsp";
		}
		
		return "admin/index";
	}
	
	
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(User user,String code,HttpSession session,ModelMap map){
		
		if(StringUtils.isEmpty(user.getUserName())){
			map.put("message", "用户名不可为空！");
			return "admin/login";
		}
		
		if(StringUtils.isEmpty(user.getPassWord())){
			map.put("message", "密码不可为空！");
			map.put("username", user.getUserName());
			return "admin/login";
		}
		
		if(StringUtils.isEmpty(code)){
			map.put("message", "验证码不可为空！");
			map.put("username", user.getUserName());
			return "admin/login";
		}
		if(!code.equals(session.getAttribute("code"))){
			map.put("message", "验证码不正确！");
			map.put("username", user.getUserName());
			return "admin/login";
		}
		
		user.setStuts(null);
		user.setWithOut(null);
		List<User> users = userService.queryUserByPar(user);
		
		if(users.size()!=1){
			map.put("message", "用户名或密码错误！");
			map.put("username", user.getUserName());
			return "admin/login";
		}else{
			user.setStuts(1);
			users = userService.queryUserByPar(user);
			if(users.size()!=1){
				map.put("message", "管理员尚未审核通过，请联系管理员！");
				map.put("username", user.getUserName());
				return "admin/login";
			}
			
			session.setAttribute("user", users.get(0));
			
			return "redirect:/user/toAdminIndexPage.do";
		}
		
	}
	
	
	@RequestMapping(value="/toRegPage",method=RequestMethod.GET)
	public String toRegPage(User user,String code,HttpSession session,ModelMap map){
		
		List<UserType> uts = userService.queryUserTypeList();
		
		map.put("userTypes", uts);
		
		return "admin/register";
	}
	
	
	@RequestMapping(value="/regUser",method=RequestMethod.POST)
	public String regUser(User user,String code,HttpSession session,ModelMap map){
		
		List<UserType> uts = userService.queryUserTypeList();
		
		map.put("userTypes", uts);
		
		if(StringUtils.isEmpty(user.getUserName())){
			map.put("unMsg", "用户名不可为空！");
			return "admin/reg";
		}
		
		List<User> users = userService.queryUserByPar(user);
		if(users.size()!=0){
			map.put("unMsg", "用户名不可用！");
			return "admin/reg";
		}
		
		if(StringUtils.isEmpty(user.getPassWord())){
			map.put("pwMsg", "密码不可为空！");
			map.put("username", user.getUserName());
			return "admin/reg";
		}
		
		if(StringUtils.isEmpty(code)){
			map.put("codeMsg", "验证码不可为空！");
			map.put("username", user.getUserName());
			return "admin/reg";
		}
		
		if(!code.equals(session.getAttribute("code"))){
			map.put("codeMsg", "验证码不正确！");
			map.put("username", user.getUserName());
			return "admin/reg";
		}
		
		if(user.getUserTypeId()==-1){
			map.put("userTypeMsg", "用户类型不可为空！");
			map.put("username", user.getUserName());
			return "admin/reg";
		}
		
		int r = userService.insertUser(user);
		if(r == 1){
			map.put("message", "用户注册成功，请等待管理员审核通过！");
			return "admin/login";
		}
		
		return "";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/checkUserName",method=RequestMethod.GET)
	public Object checkUserName(User user){
		
		List<User> users = userService.queryUserByPar(user);
		
		Map<String,Object> map = new HashMap<String,Object>();

		if(users.size() == 0){
			map.put("result", "success");
		}else{
			map.put("result", "error");
		}
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/getCode",method=RequestMethod.POST)
	public Object getCode(HttpSession session){
		//生成一串永远不会重复的字符串
		UUID uuid = UUID.randomUUID();
		String code = uuid.toString().split("-")[0].substring(0,4);
		
		session.setAttribute("code", code);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("code", code);
		
		return map;
	}
}
