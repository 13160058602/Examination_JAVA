package com.ecit.dao;

import java.util.List;

import com.ecit.entity.ExaminationJob;
import com.ecit.entity.ExaminationMessage;
import com.ecit.entity.ExaminationQuestions;
import com.ecit.entity.ExaminationQuestionsAnswer;
import com.ecit.entity.ExaminationQuestionsOption;
import com.ecit.entity.ExaminationResult;
import com.ecit.entity.Questions;
import com.ecit.entity.QuestionsAnswer;
import com.ecit.entity.QuestionsOption;
import com.ecit.entity.vo.ExaminationResultMessage;

public interface ExaminationDao {
	public int insertExaminationJob(ExaminationJob job);
	public int insertExaminationMessages(List<ExaminationMessage> messages);
	public int insertExaminationQuestions(ExaminationQuestions eq);
	public int insertExaminationQuestionsOptions(List<ExaminationQuestionsOption> eqos);
	public int insertExaminationQuestionsAnswers(List<ExaminationQuestionsAnswer> eqas);
	public int insertExaminationResult(ExaminationResult er);
	
	public int updateExaminationJob(ExaminationJob job);
	public int updateExaminationResultByPar(
			ExaminationResult er);
	public int updateExaminationQuestionByPar(
			ExaminationQuestions eq);
	
	public List<ExaminationJob> queryExaminationJobList(
			ExaminationJob job);
	public List<ExaminationMessage> queryExaminationMessageByPar(
			ExaminationMessage em);
	public List<ExaminationResult> queryExaminationResultByPar(
			ExaminationResult er);
	public List<ExaminationQuestions> queryExaminationQuestions(
			ExaminationQuestions eq);
	public List<ExaminationQuestionsOption> queryExaminationQuestionsOption(
			ExaminationQuestionsOption eqo);
	public List<ExaminationQuestionsAnswer> queryExaminationQuestionsAnswer(
			ExaminationQuestionsAnswer eqa);
	public List<ExaminationResultMessage> queryExaminationResultMessageByPar(
			ExaminationResultMessage erm);
}
