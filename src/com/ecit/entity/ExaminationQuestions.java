package com.ecit.entity;

import java.util.List;

public class ExaminationQuestions {
	private Integer id;
	private String stem;
	private String comment;
	private Integer score;
	private String examinationCode;
	private String examinationCard;
	private Integer isTrue;
	private String actualChose;
	private Integer exIndex;
	private Integer index;
	
	private List<ExaminationQuestionsOption> examinationQuestionsOptions;
	private List<ExaminationQuestionsAnswer> examinationQuestionAnswers;
	
	private String uid;
	
	
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public Integer getExIndex() {
		return exIndex;
	}
	public void setExIndex(Integer exIndex) {
		this.exIndex = exIndex;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStem() {
		return stem;
	}
	public void setStem(String stem) {
		this.stem = stem;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public String getExaminationCode() {
		return examinationCode;
	}
	public void setExaminationCode(String examinationCode) {
		this.examinationCode = examinationCode;
	}
	public String getExaminationCard() {
		return examinationCard;
	}
	public void setExaminationCard(String examinationCard) {
		this.examinationCard = examinationCard;
	}
	public Integer getIsTrue() {
		return isTrue;
	}
	public void setIsTrue(Integer isTrue) {
		this.isTrue = isTrue;
	}
	public String getActualChose() {
		return actualChose;
	}
	public void setActualChose(String actualChose) {
		this.actualChose = actualChose;
	}
	public List<ExaminationQuestionsOption> getExaminationQuestionsOptions() {
		return examinationQuestionsOptions;
	}
	public void setExaminationQuestionsOptions(
			List<ExaminationQuestionsOption> examinationQuestionsOptions) {
		this.examinationQuestionsOptions = examinationQuestionsOptions;
	}
	public List<ExaminationQuestionsAnswer> getExaminationQuestionAnswers() {
		return examinationQuestionAnswers;
	}
	public void setExaminationQuestionAnswers(
			List<ExaminationQuestionsAnswer> examinationQuestionAnswers) {
		this.examinationQuestionAnswers = examinationQuestionAnswers;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
}
