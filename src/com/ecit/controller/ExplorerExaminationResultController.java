package com.ecit.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ecit.entity.ExaminationJob;
import com.ecit.entity.vo.ExaminationResultMessage;
import com.ecit.service.ExaminationService;
import com.ecit.service.JobService;



@Controller("explorerExaminationResultController")
@Scope("prototype")
@RequestMapping("/eerc")
public class ExplorerExaminationResultController {
	
	@Resource
	private JobService jobService;
	@Resource
	private ExaminationService examinationService;
	
	@RequestMapping("/toExplorerExaminationResultPage")
	public String toExplorerExaminationResultPage(ModelMap map){
		
		ExaminationJob job = new ExaminationJob();
		job.setEndTime(new Date());
		
		List<ExaminationJob> examinationJobs = 
			jobService.queryExaminationJobList(job);
		
		map.put("examinationJobs", examinationJobs);
		
		return "admin/ExplorerExaminationResultList";
	}
	
	@ResponseBody
	@RequestMapping("/getExaminationResultFile")
	public Object getExaminationResultFile(@RequestParam("code")String code,
			HttpSession session){
		ExaminationResultMessage erm = new ExaminationResultMessage();
		erm.setExaminationCode(code);
		List<ExaminationResultMessage> erms = 
			examinationService.queryExaminationResultMessageByPar(erm);
		String path = session.getServletContext().getRealPath("/upload");
		path = path.replaceAll("%20", " ");
		
		String fileName = 
			"studentExaminationResultMessage"+
				(new Date().getTime())+".xls";
		
		boolean flag = examinationService.createExaminationResultMessageFile(
				erms, path, fileName);
		Map<String,Object> map = new HashMap<String,Object>();
		if(flag){
			map.put("result", "success");
			map.put("fileName", fileName);
			return map;
		}else{
			map.put("result", "error");
			return map;
		}
	}
}
