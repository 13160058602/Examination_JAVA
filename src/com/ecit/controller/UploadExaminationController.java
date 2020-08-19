package com.ecit.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.ecit.entity.ExaminationJob;
import com.ecit.entity.Job;
import com.ecit.entity.Page;
import com.ecit.entity.UploadFile;
import com.ecit.entity.User;
import com.ecit.entity.UserType;
import com.ecit.job.thread.JobThread;
import com.ecit.service.ClassService;
import com.ecit.service.JobService;
import com.ecit.service.UserService;

@Controller("uploadExaminationController")
@Scope("prototype")
@RequestMapping("/uploadExamination")
public class UploadExaminationController {
	
	@Resource
	private ClassService classService;
	@Resource
	private JobService jobService;
	
	@RequestMapping("/toUploadExaminationListPage")
	public String toUploadExaminationListPage(ModelMap map){
		
		map.put("jobs", this.jobService.queryExaminationJobList(null));
		
		return "admin/uploadExaminationList";
	}
	
	@RequestMapping("/toUploadExaminationPage")
	public String toUploadExaminationPage(ModelMap map){
		
		List<ClassType> cts = classService.queryClassTypeList();
		
		map.put("classTypeList", cts);
		
		return "admin/uploadExaminationPage";
	}
	
	@RequestMapping("/createExamination")
	public String createExamination(@RequestParam("file") CommonsMultipartFile file,
			ExaminationJob job , HttpSession session , ModelMap map){
		
		
		String path = session.getServletContext().getRealPath("/upload");
		
		String fileName = file.getOriginalFilename();
		
		
		fileName = fileName.substring(fileName.indexOf("."));
		
		String name = "StudentExaminationMessage(1)"+(new Date()).getTime() + fileName;
		
		File newFile=new File(path , name);
		
		try {
			file.transferTo(newFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		this.jobService.createExaminationJob(job,newFile,name);
		
		return "redirect:/uploadExamination/toUploadExaminationListPage.do";
	}
	
	
}
