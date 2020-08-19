package com.ecit.job.impl;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.StringUtils;

import com.ecit.entity.Job;
import com.ecit.entity.Questions;
import com.ecit.entity.QuestionsAnswer;
import com.ecit.entity.QuestionsOption;
import com.ecit.entity.UploadFile;
import com.ecit.service.JobService;

public class JobServer {
	protected Logger log = Logger.getLogger(JobServer.class);
	public void buildQuestion() {
		// TODO Auto-generated method stub
			JobService jobService = (JobService) this
					.getSpringApplicationContextBean("jobService");
			Job jobObj = new Job();
			jobObj.setStuts(0);
			List<Job> jobs = jobService.queryJob(jobObj);

			for (Job job : jobs) {
				try {
					String code = job.getCode();
					List<UploadFile> ufs = jobService.queryUploadFile(code);
					for (UploadFile uf : ufs) {
						String path = uf.getFilePath();
						String name = uf.getFileName();
						int type = uf.getClassType();
						int level = uf.getClassLevel();
	
						File f = new File(path, name);
						if (f.exists()) {
	
//							Workbook work = Workbook
//									.getWorkbook(new FileInputStream(f));
							HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(f));
							
							// 获取文件的指定工作表 默认的第一个
//							Sheet sheet = work.getSheet(level - 1);
							HSSFSheet sheet = wb.getSheetAt(level - 1);  
							
							int index = 0;
							int maxIndex = 6;
							String uid = UUID.randomUUID().toString().replaceAll("-", "");
							List<Questions> qs = new ArrayList<Questions>();
							Questions questions = new Questions();
							List<QuestionsOption> options = new ArrayList<QuestionsOption>();
							List<QuestionsAnswer> answers = new ArrayList<QuestionsAnswer>();
							// 行数(表头的目录不需要，从1开始)
							for (int i = 0; i <= sheet.getLastRowNum(); i++) {
								
								HSSFRow row = sheet.getRow(i);
								if(row == null){
									continue;
								}
								
								HSSFCell cell0 = row.getCell(0);
								HSSFCell cell1 = row.getCell(1);
								
								String cellStr0 = "";
								String cellStr1 = "";
								if(cell0!=null){
									cellStr0 = cell0.getCellType() == HSSFCell.CELL_TYPE_NUMERIC ? 
											String.valueOf(cell0.getNumericCellValue()):cell0.getStringCellValue();
								}
								if(cell1!=null){
									cellStr1 = cell1.getCellType() == HSSFCell.CELL_TYPE_NUMERIC ? 
											String.valueOf(cell1.getNumericCellValue()):cell1.getStringCellValue();
								}
								
								if(
										cell0!=null && StringUtils.isEmpty(cellStr0)
											&&
											cell1!=null && StringUtils.isEmpty(cellStr1)
										||
										cell0==null
											&&
											cell1!=null && StringUtils.isEmpty(cellStr1)
										||
										cell1==null
											&&
											cell0!=null && StringUtils.isEmpty(cellStr0)
										||
											cell1==null
											&&
											cell0==null
								){
									continue;
								}
								
								
								// 列数
								if(index == 0){
									String stem = cellStr1;//题干
									questions.setStem(stem);
									questions.setUid(uid);
									questions.setClassLevel(level);
									questions.setClassType(type);
								}else if(index > 0 && index < 5){
									QuestionsOption opt = new QuestionsOption();
									opt.setUid(uid);
									opt.setContext(cellStr1);
									opt.setLable(cellStr0);
									options.add(opt);
									
								}else if(index == 5){
									String answerStrs = cellStr1.trim();//答案
									char[] as = answerStrs.toCharArray();
									if(as.length>1){
										questions.setScore(2);
									}else{
										questions.setScore(1);
									}
									for(char a : as){
										if(StringUtils.isEmpty(String.valueOf(a))){
											continue;
										}
										QuestionsAnswer qa = new QuestionsAnswer();
										qa.setUid(uid);
										qa.setQuestionsOptionLable(String.valueOf(a));
										answers.add(qa);
									}
									
								}else if(index == 6){
									String comment = cellStr1;//点评
									questions.setComment(comment);
								}
								
								index ++;
								
								if(index > maxIndex){
									index = 0;
									questions.setQuestionAnswers(answers);
									questions.setQuestionsOptions(options);
									qs.add(questions);
									if(options.size()>4){
										throw new Exception("格式错误！");
									}
//									System.out.println("试题入库：" + questions);
//									System.out.println("选项入库：" + Arrays.toString(options.toArray()));
//									System.out.println("答案入库：" + Arrays.toString(answers.toArray()));
									questions = new Questions();
									options = new ArrayList<QuestionsOption>();
									answers = new ArrayList<QuestionsAnswer>();
									uid = UUID.randomUUID().toString().replaceAll("-", "");
//									System.out.println("-----------------------------------------");
								}
							}
							jobService.insertQuestions(qs);
						}
					}
					job.setStuts(1);
					jobService.updateJob(job);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					job.setStuts(2);
					jobService.updateJob(job);
					e.printStackTrace();
					log.error(e);
				}
			}


	}

	private ApplicationContext ac = new ClassPathXmlApplicationContext(
			"spring-mybatis.xml");

	private Object getSpringApplicationContextBean(String beanName) {
		return ac.getBean(beanName);
	}

}
