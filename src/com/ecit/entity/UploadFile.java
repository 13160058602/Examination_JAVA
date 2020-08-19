package com.ecit.entity;

public class UploadFile {
	private Integer id;
	private String fileName;
	private String filePath;
	private String jobCode;
	private Integer classType;
	private Integer classLevel;
	private Integer userId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
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
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}
