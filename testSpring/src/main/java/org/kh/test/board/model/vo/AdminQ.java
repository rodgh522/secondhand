package org.kh.test.board.model.vo;

import org.springframework.stereotype.Component;

@Component
public class AdminQ {
	private int adNo;
	private String question;
	private String answer;
	public AdminQ() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public AdminQ(int adNo, String question, String answer) {
		super();
		this.adNo = adNo;
		this.question = question;
		this.answer = answer;
	}


	public int getAdNo() {
		return adNo;
	}
	public void setAdNo(int adNo) {
		this.adNo = adNo;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	

	

}
