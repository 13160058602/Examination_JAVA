package com.ecit.dao;

import java.util.List;

import com.ecit.entity.Questions;
import com.ecit.entity.QuestionsAnswer;
import com.ecit.entity.QuestionsOption;

public interface QuestionsDao {
	public int insertQuestions(Questions questions);
	public int insertQuestionsAnswer(List<QuestionsAnswer> questionsAnswers);
	public int insertQuestionsOption(List<QuestionsOption> questionsOptions);
	
	public List<Questions> quertyQuestions(Questions questions);
	public List<QuestionsAnswer> quertyQuestionsAnswer(QuestionsAnswer questionsAnswer);
	public List<QuestionsOption> quertyQuestionsOption(QuestionsOption questionsOption);
	
	
}
