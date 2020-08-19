package com.ecit.entity;

import java.util.Date;

public class ExaminationJob {
	private Integer id;
	private String code;
	private Integer classType;
	private Integer classLevel;
	private Integer examinationType;
	private String startTimeStr;
	private String endTimeStr;
	private Date startTime;
	private Date endTime;
	private String examinationFile;
	private String examinationResultFile;
	
	private Integer isDelete = 0;
	
	
	public String getExaminationFile() {
		return examinationFile;
	}
	public void setExaminationFile(String examinationFile) {
		this.examinationFile = examinationFile;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Integer getClassType() {
		return classType;
	}
	public void setClassType(Integer classType) {
		this.classType = classType;
	}
	public Integer getClassLevel() {
		return classLevel;
	}
	public void setClassLevel(Integer classLevel) {
		this.classLevel = classLevel;
	}
	public Integer getExaminationType() {
		return examinationType;
	}
	public void setExaminationType(Integer examinationType) {
		this.examinationType = examinationType;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	public String getStartTimeStr() {
		return startTimeStr;
	}
	public void setStartTimeStr(String startTimeStr) {
		this.startTimeStr = startTimeStr;
	}
	public String getEndTimeStr() {
		return endTimeStr;
	}
	public void setEndTimeStr(String endTimeStr) {
		this.endTimeStr = endTimeStr;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getExaminationResultFile() {
		return examinationResultFile;
	}
	public void setExaminationResultFile(String examinationResultFile) {
		this.examinationResultFile = examinationResultFile;
	}
	
	
}
