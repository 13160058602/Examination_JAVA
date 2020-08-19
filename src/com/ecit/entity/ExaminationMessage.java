package com.ecit.entity;

import java.util.Date;

public class ExaminationMessage {
	private Integer id;
	private String examinationCode;
	private String examinationCard;
	private String studentName;
	private String studentCard;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
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
}
