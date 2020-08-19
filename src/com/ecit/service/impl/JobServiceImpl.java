package com.ecit.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecit.dao.ExaminationDao;
import com.ecit.dao.JobDao;
import com.ecit.dao.QuestionsDao;
import com.ecit.entity.ExaminationJob;
import com.ecit.entity.ExaminationMessage;
import com.ecit.entity.ExaminationQuestions;
import com.ecit.entity.ExaminationQuestionsAnswer;
import com.ecit.entity.ExaminationQuestionsOption;
import com.ecit.entity.Job;
import com.ecit.entity.Questions;
import com.ecit.entity.QuestionsAnswer;
import com.ecit.entity.QuestionsOption;
import com.ecit.entity.UploadFile;
import com.ecit.job.impl.JobSimpleServer;
import com.ecit.service.JobService;
import com.ecit.util.BaseUtil;

@Service("jobService")
@Scope("prototype")
public class JobServiceImpl implements JobService{
	
	@Resource
	private JobDao jobDao;
	@Resource
	private QuestionsDao questionsDao;
	@Resource
	private ExaminationDao examinationDao;
	
	public int insertJob(Job job) {
		// TODO Auto-generated method stub
		return jobDao.insertJob(job);
	}

	public int insertUploadFile(List<UploadFile> uploadFiles) {
		// TODO Auto-generated method stub
		return jobDao.insertUploadFile(uploadFiles);
	}

	public List<Job> queryJob(Job job) {
		// TODO Auto-generated method stub
		return jobDao.queryJob(job);
	}

	public List<UploadFile> queryUploadFile(String jobCode) {
		// TODO Auto-generated method stub
		return jobDao.queryUploadFile(jobCode);
	}

	public int updateJob(Job job) {
		// TODO Auto-generated method stub
		return jobDao.updateJob(job);
	}
	
	@Transactional("transactionManager")
	public int insertQuestions(List<Questions> questions) {
		int i = 0;
		for(Questions question : questions){
			// TODO Auto-generated method stub
			List<QuestionsOption> qos = question.getQuestionsOptions();
			
			int r = this.questionsDao.insertQuestionsOption(qos);
			
			List<QuestionsAnswer> qas = question.getQuestionAnswers();
			
			r = this.questionsDao.insertQuestionsAnswer(qas);
			
			i += this.questionsDao.insertQuestions(question);
			
		}
		return i;
	}

	@Override
	@Transactional("transactionManager")
	public void createExaminationJob(ExaminationJob job , File file , String fileName) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		
		try {
			
			job.setStartTime(sdf.parse(job.getStartTimeStr()));
			job.setEndTime(sdf.parse(job.getEndTimeStr()));
			
			SimpleDateFormat codeSdf = new SimpleDateFormat("yyyyMMddhhmmss");
			String examinationCode = codeSdf.format(new Date())+job.getClassType()+job.getClassLevel();
			
			job.setCode(examinationCode);
			job.setExaminationType(1);
			
		
			List<ExaminationMessage> ems = this.buildExaminationMessageForFile(file,examinationCode);
			
			int messageResultSize = examinationDao.insertExaminationMessages(ems);
			
			for(ExaminationMessage em : ems){
				List<ExaminationQuestions> eqs = this.getExaminationQuestionsList(job.getClassType(), job.getClassLevel(), em , 1);
				this.insertExaminationQuestions(eqs);
				eqs = this.getExaminationQuestionsList(job.getClassType(), job.getClassLevel(), em , 2);
				this.insertExaminationQuestions(eqs);
			}
			
			this.createExaminationMessageFile(ems,file);
			
			job.setExaminationFile(fileName);
			
			int jobResultSize = examinationDao.insertExaminationJob(job);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	private void createExaminationMessageFile(List<ExaminationMessage> ems,File file){
		try {
			HSSFWorkbook wb = new HSSFWorkbook();	
			HSSFSheet sheet = wb.createSheet("考试资料");//创建Excel工作表对象     
			
			HSSFRow firstRow = sheet.createRow(0);
			
			firstRow.createCell(0).setCellValue("姓名");
			firstRow.createCell(1).setCellValue("身份证");
			firstRow.createCell(2).setCellValue("考试号");
			firstRow.createCell(3).setCellValue("考试证号");
			
			for(int i = 0 ;i < ems.size() ; i ++){
				ExaminationMessage em = ems.get(i);
				HSSFRow row = sheet.createRow(i+1); //创建Excel工作表的行 
				row.createCell(0).setCellValue(em.getStudentName());
				row.createCell(1).setCellValue(em.getStudentCard());
				row.createCell(2).setCellValue(em.getExaminationCode());
				row.createCell(3).setCellValue(em.getExaminationCard());
			}
			
			OutputStream fileOut = new FileOutputStream(file);   
			wb.write(fileOut);  
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@Transactional("transactionManager")
	private int insertExaminationQuestions(List<ExaminationQuestions> eqs){
		int result = 0;
		for(ExaminationQuestions eq : eqs){
			this.examinationDao.insertExaminationQuestionsOptions(eq.getExaminationQuestionsOptions());
			this.examinationDao.insertExaminationQuestionsAnswers(eq.getExaminationQuestionAnswers());
			result += this.examinationDao.insertExaminationQuestions(eq);
		}
		return result;
	}
	
	private List<ExaminationQuestions> getExaminationQuestionsList(
			int classType , int classLevel , ExaminationMessage em , int exIndex
	){
		int maxScore = 100;
		
		List<ExaminationQuestions> eqs = new ArrayList<ExaminationQuestions>();
		
		List<Questions> qs = this.questionsDao.quertyQuestions(new Questions(classLevel, classType));
		
		while(true){
			
			String uid = UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
			
			ExaminationQuestions eq = new ExaminationQuestions();
			
			int size = qs.size();
			Random random = new Random();
			int index = random.nextInt(size);
			
			Questions question = qs.get(index);
			
			if(maxScore - question.getScore() < 0){
				continue;
			}
			
			eq.setStem(question.getStem());
			eq.setComment(question.getComment());
			eq.setScore(question.getScore());
			eq.setExaminationCard(em.getExaminationCard());
			eq.setExaminationCode(em.getExaminationCode());
			eq.setExIndex(exIndex);
			eq.setUid(uid);
			
			List<QuestionsOption> qos = 
				this.questionsDao.quertyQuestionsOption(new QuestionsOption(question.getUid()));
			List<ExaminationQuestionsOption> eqos = new ArrayList<ExaminationQuestionsOption>();
			for(QuestionsOption qo : qos){
				ExaminationQuestionsOption eqo = new ExaminationQuestionsOption();
				eqo.setLable(qo.getLable());
				eqo.setContext(qo.getContext());
				eqo.setUid(uid);
				eqos.add(eqo);
			}
			eq.setExaminationQuestionsOptions(eqos);
			
			List<QuestionsAnswer> qas = 
				this.questionsDao.quertyQuestionsAnswer(new QuestionsAnswer(question.getUid()));
			List<ExaminationQuestionsAnswer> eqas = new ArrayList<ExaminationQuestionsAnswer>();
			for(QuestionsAnswer qa : qas){
				ExaminationQuestionsAnswer eqa = new ExaminationQuestionsAnswer();
				eqa.setQuestionsOptionLable(qa.getQuestionsOptionLable());
				eqa.setUid(uid);
				eqas.add(eqa);
			}
			eq.setExaminationQuestionAnswers(eqas);
			
			eqs.add(eq);
			
			maxScore -= eq.getScore();
			
			qs.remove(index);
			
			if(maxScore <= 0){
				break;
			}
		}
		return eqs;
	}
	
	private List<ExaminationMessage> buildExaminationMessageForFile(File f,String code){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmsssss");
		List<ExaminationMessage> list = null;
		if (f.exists()) {
			try {
				HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(f));
				HSSFSheet sheet = wb.getSheetAt(0); 
				
				list = new ArrayList<ExaminationMessage>();
				
				for (int i = 1; i <= sheet.getLastRowNum(); i++) {
					ExaminationMessage em = new ExaminationMessage();
					em.setExaminationCode(code);
					//准考证生产
					StringBuilder examinationCard = new StringBuilder("JD");
					examinationCard.append(sdf.format(new Date()));
					examinationCard.append(BaseUtil.addZeroForNum(String.valueOf(i), 3));
					
					em.setExaminationCard(examinationCard.toString());
					
					HSSFRow row = sheet.getRow(i);
					em.setStudentName(row.getCell(0).getStringCellValue());
					em.setStudentCard(row.getCell(1).getStringCellValue());
					list.add(em);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public List<ExaminationJob> queryExaminationJobList(ExaminationJob job) {
		// TODO Auto-generated method stub
		return this.examinationDao.queryExaminationJobList(job);
	}

	@Override
	public void createExaminationJobThreadArray( ExaminationMessage em , int exIndex) {
		// TODO Auto-generated method stub
		JobSimpleServer.getJobSimpleServer().addExaminationMessageThread(em, exIndex);
	}

	@Override
	public int updateExaminationJob(ExaminationJob job) {
		// TODO Auto-generated method stub
		return examinationDao.updateExaminationJob(job);
	}

}
