package com.ecit.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.ecit.dao.ExaminationDao;
import com.ecit.entity.ExaminationJob;
import com.ecit.entity.ExaminationMessage;
import com.ecit.entity.ExaminationQuestions;
import com.ecit.entity.ExaminationQuestionsAnswer;
import com.ecit.entity.ExaminationQuestionsOption;
import com.ecit.entity.ExaminationResult;
import com.ecit.entity.vo.ExaminationResultMessage;
import com.ecit.service.ExaminationService;

@Service("examinationService")
@Scope("prototype")
public class ExaminationServiceImpl implements ExaminationService{
	
	@Resource
	private ExaminationDao examinationDao;
	
	@Override
	public List<ExaminationMessage> queryExaminationMessageByPar(
			ExaminationMessage em) {
		// TODO Auto-generated method stub
		return examinationDao.queryExaminationMessageByPar(em);
	}

	@Override
	public List<ExaminationResult> queryExaminationResultByPar(
			ExaminationResult er) {
		// TODO Auto-generated method stub
		return examinationDao.queryExaminationResultByPar(er);
	}

	@Override
	public int updateExaminationResultByPar(ExaminationResult er) {
		// TODO Auto-generated method stub
		return examinationDao.updateExaminationResultByPar(er);
	}

	@Override
	public int insertExaminationResult(ExaminationResult er) {
		// TODO Auto-generated method stub
		return examinationDao.insertExaminationResult(er);
	}

	@Override
	public List<ExaminationQuestions> queryExaminationQuestions(
			ExaminationQuestions eq) {
		// TODO Auto-generated method stub
		return examinationDao.queryExaminationQuestions(eq);
	}

	@Override
	public List<ExaminationQuestionsOption> queryExaminationQuestionsOption(
			ExaminationQuestionsOption eqo) {
		// TODO Auto-generated method stub
		return examinationDao.queryExaminationQuestionsOption(eqo);
	}

	@Override
	public int updateExaminationQuestionByPar(ExaminationQuestions eq) {
		// TODO Auto-generated method stub
		return examinationDao.updateExaminationQuestionByPar(eq);
	}

	@Override
	public List<ExaminationQuestionsAnswer> queryExaminationQuestionsAnswer(
			ExaminationQuestionsAnswer eqa) {
		// TODO Auto-generated method stub
		return examinationDao.queryExaminationQuestionsAnswer(eqa);
	}

	@Override
	public List<ExaminationResultMessage> queryExaminationResultMessageByPar(
			ExaminationResultMessage erm) {
		// TODO Auto-generated method stub
		return examinationDao.queryExaminationResultMessageByPar(erm);
	}

	@Override
	public boolean createExaminationResultMessageFile(
			List<ExaminationResultMessage> erms, String path, String fileName) {
		// TODO Auto-generated method stub
		try {
			
			HSSFWorkbook wb = new HSSFWorkbook();//创建Excel工作簿对象
			HSSFSheet sheet = wb.createSheet("考试成绩单");//创建Excel工作表对象   
			
			HSSFRow row = sheet.createRow(0); //创建Excel工作表的行   
			
			HSSFCell cell0_0 = row.createCell(0); //创建Excel工作表指定行的单元格   
			cell0_0.setCellValue("序号"); //设置Excel工作表的值
			
			HSSFCell cell0_1 = row.createCell(1); //创建Excel工作表指定行的单元格   
			cell0_1.setCellValue("考试号"); //设置Excel工作表的值
			
			HSSFCell cell0_2 = row.createCell(2); //创建Excel工作表指定行的单元格   
			cell0_2.setCellValue("准考证号"); //设置Excel工作表的值
			
			HSSFCell cell0_3 = row.createCell(3); //创建Excel工作表指定行的单元格   
			cell0_3.setCellValue("学生姓名"); //设置Excel工作表的值
			
			HSSFCell cell0_4 = row.createCell(4); //创建Excel工作表指定行的单元格   
			cell0_4.setCellValue("学生身份证"); //设置Excel工作表的值
			
			HSSFCell cell0_5 = row.createCell(5); //创建Excel工作表指定行的单元格   
			cell0_5.setCellValue("考试成绩"); //设置Excel工作表的值
			
			HSSFCell cell0_6 = row.createCell(6); //创建Excel工作表指定行的单元格   
			cell0_6.setCellValue("考试通过情况"); //设置Excel工作表的值
			
			HSSFCell cell0_7 = row.createCell(7); //创建Excel工作表指定行的单元格   
			cell0_7.setCellValue("考试开始时间"); //设置Excel工作表的值
			
			HSSFCell cell0_8 = row.createCell(8); //创建Excel工作表指定行的单元格   
			cell0_8.setCellValue("考试开始时间"); //设置Excel工作表的值
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			for(int i= 0 ; i < erms.size() ; i ++){
				
				
				HSSFRow rows = sheet.createRow(i+1);
				
				rows.createCell(0).setCellValue(i+1); 
				rows.createCell(1).setCellValue(erms.get(i).getExaminationCode()); 
				rows.createCell(2).setCellValue(erms.get(i).getExaminationCard()); 
				rows.createCell(3).setCellValue(erms.get(i).getStudentName()); 
				rows.createCell(4).setCellValue(erms.get(i).getStudentCard()); 
				rows.createCell(5).setCellValue(erms.get(i).getScore()); 
				rows.createCell(6).setCellValue(erms.get(i).getIsPass() == 0 ? "不及格" : "通过"); 
				rows.createCell(7).setCellValue(sdf.format(erms.get(i).getRealStartTime())); 
				rows.createCell(8).setCellValue(sdf.format(erms.get(i).getRealEndTime())); 
			
			}
			
			FileOutputStream fileOut = new FileOutputStream(new File(path,fileName));   
			wb.write(fileOut);  
			
			ExaminationJob job = new ExaminationJob();
			job.setCode(erms.get(0).getExaminationCode());
			job.setExaminationResultFile(fileName);
			
			examinationDao.updateExaminationJob(job);
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
