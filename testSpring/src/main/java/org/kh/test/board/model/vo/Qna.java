package org.kh.test.board.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Qna {
	
	private int qNo;
	private String qTitle;
	private String qContent;
	private String memberId;
	private Date regDate;
	private String qPw;
	private String qanswer;
	
	
	public Qna() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Qna(int qNo, String qTitle, String qContent, String memberId, Date regDate, String qPw, String qanswer) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.memberId = memberId;
		this.regDate = regDate;
		this.qPw = qPw;
		this.qanswer = qanswer;
	}


	public int getqNo() {
		return qNo;
	}


	public void setqNo(int qNo) {
		this.qNo = qNo;
	}


	public String getqTitle() {
		return qTitle;
	}


	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}


	public String getqContent() {
		return qContent;
	}


	public void setqContent(String qContent) {
		this.qContent = qContent;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public String getqPw() {
		return qPw;
	}


	public void setqPw(String qPw) {
		this.qPw = qPw;
	}


	public String getQanswer() {
		return qanswer;
	}


	public void setQanswer(String qanswer) {
		this.qanswer = qanswer;
	}

	

}
