package com.ecit.job.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ecit.entity.ExaminationMessage;
import com.ecit.entity.ExaminationQuestions;
import com.ecit.entity.ExaminationResult;
import com.ecit.service.ExaminationService;

public class JobSimpleServer {
	private static JobSimpleServer jss = null;
	private JobSimpleServer(){}
	public static JobSimpleServer getJobSimpleServer(){
		if(jss == null){
			jss = new JobSimpleServer();
		}
		return jss;
	}
	
	private final Map<String , ExaminationMessage> list = 
		new HashMap<String , ExaminationMessage>();
	private final Map<String , Long> porTime = 
		new HashMap<String , Long>();
	
	public synchronized void addExaminationMessageThread(ExaminationMessage em , int exIndex){
		String threadIndex = em.getExaminationCard()+"-"+exIndex;
		ExaminationMessage emo = list.get(threadIndex);
		if(emo == null){
			list.put(threadIndex, em);
			this.createExaminationMessageThread(threadIndex, exIndex);
		}
	}
	
	public synchronized Long getExaminationTime(String threadIndex){
		return porTime.get(threadIndex);
	}
	
	private void createExaminationMessageThread(final String threadIndex , final int index){
		Thread t = new Thread(new Runnable() {
			@Override
			public void run() {
				// TODO Auto-generated method stub
				ExaminationMessage em = list.get(threadIndex);
				ApplicationContext ac = new ClassPathXmlApplicationContext(
				"spring-mybatis.xml");
				ExaminationService es = (ExaminationService) ac.getBean("examinationService");
				ExaminationResult result = new ExaminationResult();
				result.setEmId(em.getId());
				List<ExaminationResult> results = es.queryExaminationResultByPar(result);
				ExaminationResult r = results.get(index-1);
				
				Long startTime = r.getRealStartTime().getTime();
				Long endTime = startTime + 3600 * 1000;
				
				while(true){
					try {
						Long nowTime = new Date().getTime();
						Long time = endTime - nowTime;
						
						porTime.put(threadIndex, time/1000/60);
						
						Thread.sleep(1000);
						
						if(time <= 0){
							//这里算考试结果，需要再次确认是否已经交卷
							System.out.println("开始计算"+em.getExaminationCard()+"的考试结果！");
							
							results = es.queryExaminationResultByPar(result);
							r = results.get(index-1);
							
							if(r.getRealEndTime() == null){
								ExaminationQuestions eq = new ExaminationQuestions();
								eq.setExaminationCard(em.getExaminationCard());
								eq.setExaminationCode(em.getExaminationCode());
								List<ExaminationQuestions> eqs = es.queryExaminationQuestions(eq);
								
								int scoreAll = 0;
								
								for(ExaminationQuestions e : eqs){
									if(e.getIsTrue() == 1){
										scoreAll += e.getScore();
									}
								}
								
								r.setEmId(em.getId());
								r.setIndex(index);
								r.setRealEndTime(new Date());
								r.setScore(scoreAll);
								r.setIsPass(r.getScore()>=60?1:0);
								
								es.updateExaminationResultByPar(r);
								
								list.remove(threadIndex);
								porTime.remove(threadIndex);
							}
							
							break;
						}
						
						
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
			}
		});
		t.start();
	}
	
	
	
	
	
	
}
