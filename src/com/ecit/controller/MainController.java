package com.ecit.controller;

import java.util.Date;
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
import com.ecit.entity.ExaminationJob;
import com.ecit.entity.ExaminationMessage;
import com.ecit.entity.ExaminationQuestions;
import com.ecit.entity.ExaminationQuestionsAnswer;
import com.ecit.entity.ExaminationQuestionsOption;
import com.ecit.entity.ExaminationResult;
import com.ecit.entity.Page;
import com.ecit.entity.User;
import com.ecit.entity.UserType;
import com.ecit.job.impl.JobSimpleServer;
import com.ecit.service.ClassService;
import com.ecit.service.ExaminationService;
import com.ecit.service.JobService;
import com.ecit.service.UserService;

@Controller("mainController")
@Scope("prototype")
@RequestMapping("/main")
public class MainController {
	
	@Resource
	private JobService jobService;
	@Resource
	private ExaminationService examinationService;
	
	@RequestMapping("/toMainPage")
	public String toMainPage(){
		
		return "main/index";
	}
	
	@RequestMapping("/toStartExaminationPage")
	public String toStartExaminationPage(){
		
		return "main/startExamination";
	}
	
	@RequestMapping("/checkExaminationMessage")
	public String checkExaminationMessage(ExaminationMessage em,ModelMap map){
		
		map.put("em", em);
		
		if(StringUtils.isEmpty(em.getExaminationCode())){
			map.put("message", "考试号不可为空");
			return "main/startExamination";
		}else if(StringUtils.isEmpty(em.getExaminationCard())){
			map.put("message", "准考证号不可为空");
			return "main/startExamination";
		}else if(StringUtils.isEmpty(em.getStudentName())){
			map.put("message", "学生姓名不可为空");
			return "main/startExamination";
		}else if(StringUtils.isEmpty(em.getStudentCard())){
			map.put("message", "学生身份证号不可为空");
			return "main/startExamination";
		}
		
		
		ExaminationJob job = new ExaminationJob();
		job.setCode(em.getExaminationCode());
		List<ExaminationJob> jobs = this.jobService.queryExaminationJobList(job);
		if(jobs.size()!=1){
			map.put("message", "无法参加考试：当前考试不可用");
			return "main/startExamination";
		}
		
		job = jobs.get(0);
		
		Date startTime = job.getStartTime();
		Date endTime = job.getEndTime();
		Date realStartTime = new Date();
		
		if(startTime.getTime() > realStartTime.getTime() || 
				endTime.getTime() < realStartTime.getTime()){
			map.put("message", "无法参加考试：不在考试时间内");
			return "main/startExamination";
		}
		
		List<ExaminationMessage> ems = this.examinationService.queryExaminationMessageByPar(em);
		if(ems.size()!=1){
			map.put("message", "无法参加考试：当前考试信息不存在");
			return "main/startExamination";
		}
		
		em = ems.get(0);
		
		ExaminationResult result = new ExaminationResult();
		result.setEmId(em.getId());
		List<ExaminationResult> results = this.examinationService.queryExaminationResultByPar(result);
		
		//判断当前为第几次考试，是否有资格参加考试
		
		/*
		 * 第二次考试未完成，未超时，继续考试2
		 * 第二次考试未完成，已超时，不得考试
		 * 第二次考试已完成，不得考试
		 * 
		 * 第一次考试未完成，未超时，继续考试1
		 * 第一次考试未完成，已超时，考试2
		 * 第一次考试已完成，考试2
		 * 
		 * 未参加考试，考试1
		 */
		long nowTime = new Date().getTime();
		if(results.size() == 2 ){
			
			result = results.get(1);
			
			if(result.getIsPass() == null){
				long startTimeL = result.getRealStartTime().getTime();
				if(nowTime - startTimeL >= 3600 * 1000){
					map.put("message", "无法参加考试：当前考试已全部完成");
					return "main/startExamination";
				}else{
					map.put("exIndex", 2);
				}
			}else{
				map.put("message", "无法参加考试：当前考试已全部完成");
				return "main/startExamination";
			}
			
		}else if(results.size() == 1 ){
			result = results.get(0);
			
			if(result.getIsPass() == null){
				long startTimeL = result.getRealStartTime().getTime();
				if(nowTime - startTimeL >= 3600 * 1000){
					result = new ExaminationResult();
					result.setEmId(em.getId());
					result.setRealStartTime(new Date());
					result.setIndex(2);
					this.examinationService.insertExaminationResult(result);
					
					map.put("exIndex", 2);
				}else{
					map.put("exIndex", 1);
				}
			}else{
				result = new ExaminationResult();
				result.setEmId(em.getId());
				result.setRealStartTime(new Date());
				result.setIndex(2);
				this.examinationService.insertExaminationResult(result);
				
				map.put("exIndex", 2);
			}
			
		}else if(results.size() == 0 ){
			result = new ExaminationResult();
			result.setEmId(em.getId());
			result.setRealStartTime(new Date());
			result.setIndex(1);
			this.examinationService.insertExaminationResult(result);
			
			map.put("exIndex", 1);
		}
		//......
		this.jobService.createExaminationJobThreadArray(em , (Integer)map.get("exIndex"));
		
		return "main/kaoshi";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("/getTime")
	public Object getTime(@RequestParam("exCard")String exCard , 
			@RequestParam("exIndex")int exIndex){
		Long time = JobSimpleServer.getJobSimpleServer().getExaminationTime(exCard+"-"+exIndex);
		return time == null ? 0 : time;
	}
	
	@ResponseBody
	@RequestMapping("/getExaminationIndex")
	public Object getExaminationIndex(
			@RequestParam("exCode")String exCode , 
				@RequestParam("exCard")String exCard , 
					@RequestParam("exIndex")int exIndex){
		ExaminationQuestions eq = new ExaminationQuestions();
		eq.setExaminationCard(exCard);
		eq.setExaminationCode(exCode);
		eq.setExIndex(exIndex);
		List<ExaminationQuestions> eqs = this.examinationService.queryExaminationQuestions(eq);
		return eqs.size();
	}
	
	
	@ResponseBody
	@RequestMapping("/getExamination")
	public Object getExamination(
			@RequestParam("exCode")String exCode , 
				@RequestParam("exCard")String exCard , 
					@RequestParam("exIndex")int exIndex,
						@RequestParam("index")int index){
		
		ExaminationQuestions eq = new ExaminationQuestions();
		eq.setExaminationCard(exCard);
		eq.setExaminationCode(exCode);
		eq.setExIndex(exIndex);
		eq.setIndex(index);
		List<ExaminationQuestions> eqs = this.examinationService.queryExaminationQuestions(eq);
			
		for(int i = 0 ; i < eqs.size() ;i ++){
			eq = eqs.get(i);
			String uid = eq.getUid();
			ExaminationQuestionsOption eqo = new ExaminationQuestionsOption();
			eqo.setUid(uid);
			List<ExaminationQuestionsOption> eqos = this.examinationService.queryExaminationQuestionsOption(eqo);
			eq.setExaminationQuestionsOptions(eqos);
		}
		
		return eqs;
	}
	
	@ResponseBody
	@RequestMapping("/setExaminationResult")
	public Object setExaminationResult(
				@RequestParam("chose")String chose , 
					@RequestParam("exUid")String exUid,
						@RequestParam("exId")int exId){
		ExaminationQuestionsAnswer eqa = new ExaminationQuestionsAnswer();
		eqa.setUid(exUid);
		List<ExaminationQuestionsAnswer> eqas = 
			this.examinationService.queryExaminationQuestionsAnswer(eqa);
		String aChose = "";
		for(ExaminationQuestionsAnswer qa : eqas ){
			aChose += qa.getQuestionsOptionLable().trim();
		}
		
		ExaminationQuestions eq = new ExaminationQuestions();
		eq.setId(exId);
		eq.setActualChose(chose);
		eq.setIsTrue(aChose.equalsIgnoreCase(chose)?1:0);
		
		int r = this.examinationService.updateExaminationQuestionByPar(eq);
		
		return r;
	}
	
	@ResponseBody
	@RequestMapping("/exitExamination")
	public Object exitExamination(
			@RequestParam("exCode")String exCode , 
				@RequestParam("exCard")String exCard , 
					@RequestParam("exIndex")int exIndex){
		
		ExaminationQuestions eq = new ExaminationQuestions();
		eq.setExaminationCard(exCard);
		eq.setExaminationCode(exCode);
		eq.setExIndex(exIndex);
		List<ExaminationQuestions> eqs = 
			this.examinationService.queryExaminationQuestions(eq);
		int scoreAll = 0;
		
		for(ExaminationQuestions e : eqs){
			if(e.getIsTrue() == 1){
				scoreAll += e.getScore();
			}
		}
		
		ExaminationMessage em = new ExaminationMessage();
		em.setExaminationCard(exCard);
		em.setExaminationCode(exCode);
		em = this.examinationService.queryExaminationMessageByPar(em).get(0);
		
		ExaminationResult result = new ExaminationResult();
		result.setEmId(em.getId());
		result.setIndex(exIndex);
		result.setRealEndTime(new Date());
		result.setScore(scoreAll);
		result.setIsPass(result.getScore()>=60?1:0);
		this.examinationService.updateExaminationResultByPar(result);
		return result.getScore();
	}
	
	@RequestMapping("/toSuccessExaminationPage")
	public String toSuccessExaminationPage(int score , ModelMap map){
		
		map.put("message", score);
		
		return "main/endExamination";
	}
}












