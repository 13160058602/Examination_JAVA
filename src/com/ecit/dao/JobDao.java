package com.ecit.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecit.entity.Job;
import com.ecit.entity.UploadFile;

public interface JobDao {
	public int insertJob(Job job);
	public int updateJob(Job job);
	public int insertUploadFile(List<UploadFile> uploadFiles);
	public List<Job> queryJob(Job job);
	public List<UploadFile> queryUploadFile(@Param("jobCode")String jobCode);
}
