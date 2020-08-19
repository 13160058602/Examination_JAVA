package com.ecit.entity;

public class ExaminationQuestionsAnswer {
	private Integer id;
	private String uid;
	private String questionsOptionLable;
	
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getQuestionsOptionLable() {
		return questionsOptionLable;
	}
	public void setQuestionsOptionLable(String questionsOptionLable) {
		this.questionsOptionLable = questionsOptionLable;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "´ð°¸£º"+questionsOptionLable;
	}
	
}
