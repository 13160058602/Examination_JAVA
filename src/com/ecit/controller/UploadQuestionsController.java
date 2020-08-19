package com.ecit.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

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
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.ecit.entity.ClassMessage;
import com.ecit.entity.ClassType;
import com.ecit.entity.Job;
import com.ecit.entity.Page;
import com.ecit.entity.UploadFile;
import com.ecit.entity.User;
import com.ecit.entity.UserType;
import com.ecit.job.thread.JobThread;
import com.ecit.service.ClassService;
import com.ecit.service.JobService;
import com.ecit.service.UserService;

@Controller("uploadQuestionsController")
@Scope("prototype")
@RequestMapping("/uploadQuestions")
public class UploadQuestionsController {
	
	@Resource
	private ClassService classService;
	@Resource
	private JobService jobService;
	
	@RequestMapping("/toUploadQuestionsPage")
	public String toUploadQuestionsPage(ModelMap map){
		
		List<ClassType> cts = classService.queryClassTypeList();
		
		map.put("classTypeList", cts);
		
		return "admin/uploadQuestionsPage";
	}
	
	@RequestMapping("/uploadFileList")
	public String uploadFileList(
			@RequestParam("path")String[] path,
			@RequestParam("fileName")String[] fileName,
			@RequestParam("classType")int[] classType,
			@RequestParam("classLevel")int[] classLevel,
			HttpSession session
	){
		
		User user = (User)session.getAttribute("user");
		
		String interfaceName = 
			(String) session.getServletContext().getAttribute("interfaceName");
		String interfaceImplName = 
			(String) session.getServletContext().getAttribute("interfaceImplName");
		//创建任务job
		Job job = new Job();
		job.setCode(UUID.randomUUID().toString().replaceAll("-", "").toUpperCase());
		job.setUserId(user.getId());
		jobService.insertJob(job);
		
		
		List<UploadFile> ufs = new ArrayList<UploadFile>();
		
		for(int i = 0 ; i < path.length ; i ++){
			UploadFile uf = new UploadFile();
			
			uf.setFilePath(path[i]);
			uf.setFileName(fileName[i]);
			
			uf.setClassType(classType[i]);
			uf.setClassLevel(classLevel[i]);
			
			uf.setJobCode(job.getCode());
			uf.setUserId(user.getId());
			
			ufs.add(uf);
		}
		
		jobService.insertUploadFile(ufs);
		
		
		
		return "redirect:/uploadQuestions/toUploadQuestionsPage.do";
	}
	
	
	
	@ResponseBody
	@RequestMapping("/uploadQuestionsFile")
	public Object uploadQuestionsFile(@RequestParam("file") CommonsMultipartFile file,
			HttpSession session){
		
		String path = session.getServletContext().getRealPath("/upload");
		
		String fileName = file.getOriginalFilename();
		
		
		fileName = fileName.substring(fileName.indexOf("."));
		
		String name = "Questions"+(new Date()).getTime() + fileName;
		
		File newFile=new File(path , name);
		
		try {
			file.transferTo(newFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Map<String,Object> result = new HashMap<String,Object>();
		
		result.put("path", path);
		result.put("fileName", name);
		result.put("stuts", "SUCCESS");
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/getJobList")
	public Object getJobList(HttpSession session){
		
		User user = (User)session.getAttribute("user");
		
		Job job = new Job();
		job.setUserId(user.getId());
		
		
		return this.jobService.queryJob(job);
	}	
}
