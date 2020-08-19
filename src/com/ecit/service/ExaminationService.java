package com.ecit.service;

import java.util.List;


import com.ecit.entity.ExaminationMessage;
import com.ecit.entity.ExaminationQuestions;
import com.ecit.entity.ExaminationQuestionsAnswer;
import com.ecit.entity.ExaminationQuestionsOption;
import com.ecit.entity.ExaminationResult;
import com.ecit.entity.vo.ExaminationResultMessage;


public interface ExaminationService {
	
	public List<ExaminationMessage> queryExaminationMessageByPar(
			ExaminationMessage em);
	public List<ExaminationResult> queryExaminationResultByPar(
			ExaminationResult er);
	public int updateExaminationResultByPar(
			ExaminationResult er);
	public int insertExaminationResult(ExaminationResult er);
	
	public List<ExaminationQuestions> queryExaminationQuestions(ExaminationQuestions eq);

	public List<ExaminationQuestionsOption> queryExaminationQuestionsOption(ExaminationQuestionsOption eqo);

	public int updateExaminationQuestionByPar(
			ExaminationQuestions eq);
	
	public List<ExaminationQuestionsAnswer> queryExaminationQuestionsAnswer(
			ExaminationQuestionsAnswer eqa);
	public List<ExaminationResultMessage> queryExaminationResultMessageByPar(
			ExaminationResultMessage erm);
	
	public boolean createExaminationResultMessageFile(
			List<ExaminationResultMessage> erms ,
				String path ,
					String fileName);
	
	
}
