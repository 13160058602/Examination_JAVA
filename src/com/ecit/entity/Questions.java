package com.ecit.entity;

import java.util.List;

public class Questions {
	private Integer id;
	private String stem;
	private String comment;
	private Integer score;
	private Integer classLevel;
	private Integer classType;
	private List<QuestionsOption> questionsOptions;
	private List<QuestionsAnswer> questionAnswers;
	private String uid;
	
	public Questions() {
		super();
	}
	
	
	
	public Questions(Integer classLevel, Integer classType) {
		super();
		this.classLevel = classLevel;
		this.classType = classType;
	}



	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
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
	public List<QuestionsOption> getQuestionsOptions() {
		return questionsOptions;
	}
	public void setQuestionsOptions(List<QuestionsOption> questionsOptions) {
		this.questionsOptions = questionsOptions;
	}
	public List<QuestionsAnswer> getQuestionAnswers() {
		return questionAnswers;
	}
	public void setQuestionAnswers(List<QuestionsAnswer> questionAnswers) {
		this.questionAnswers = questionAnswers;
	}
	public Integer getClassLevel() {
		return classLevel;
	}
	public void setClassLevel(Integer classLevel) {
		this.classLevel = classLevel;
	}
	public Integer getClassType() {
		return classType;
	}
	public void setClassType(Integer classType) {
		this.classType = classType;
	}
	@Override
	public String toString() {
		return "Ã‚∏…:"+stem+"\n"+"Ω‚∂¡:"+this.comment;
	}
	
}
