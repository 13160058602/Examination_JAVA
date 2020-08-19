package com.ecit.entity.vo;

import java.util.Date;

public class ExaminationResultMessage {
	private String examinationCode;
	private String examinationCard;
	private String studentName;
	private String studentCard;
	private Date realStartTime;
	private Date realEndTime;
	private Integer score;
	private Integer isPass;
	private Integer index;
	
	public String getExaminationCode() {
		return examinationCode;
	}
	public void setExaminationCode(String examinationCode) {
		this.examinationCode = examinationCode;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentCard() {
		return studentCard;
	}
	public void setStudentCard(String studentCard) {
		this.studentCard = studentCard;
	}
	public String getExaminationCard() {
		return examinationCard;
	}
	public void setExaminationCard(String examinationCard) {
		this.examinationCard = examinationCard;
	}
	public Date getRealStartTime() {
		return realStartTime;
	}
	public void setRealStartTime(Date realStartTime) {
		this.realStartTime = realStartTime;
	}
	public Date getRealEndTime() {
		return realEndTime;
	}
	public void setRealEndTime(Date realEndTime) {
		this.realEndTime = realEndTime;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Integer getIsPass() {
		return isPass;
	}
	public void setIsPass(Integer isPass) {
		this.isPass = isPass;
	}
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	
}
