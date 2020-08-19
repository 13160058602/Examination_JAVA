package com.ecit.service;


import java.io.File;
import java.util.List;

import com.ecit.entity.ExaminationJob;
import com.ecit.entity.ExaminationMessage;
import com.ecit.entity.Job;
import com.ecit.entity.Questions;
import com.ecit.entity.UploadFile;

public interface JobService {
	public int insertJob(Job job);
	public int updateJob(Job job);
	public int insertUploadFile(List<UploadFile> uploadFiles);
	public List<Job> queryJob(Job job);
	public List<UploadFile> queryUploadFile(String jobCode);
	public int insertQuestions(List<Questions> questions);
	
	
	public void createExaminationJob(ExaminationJob job , File file , String fileName);
	public List<ExaminationJob> queryExaminationJobList(ExaminationJob job);
	public int updateExaminationJob(ExaminationJob job);
	
	public void createExaminationJobThreadArray(ExaminationMessage em , int exIndex);
	
	
}
