package org.kh.test.report.model.vo;

import java.sql.Date;

public class Report {
	//신고글 번호
	private int reportNo;
	//신고한 게시물번호
	private int reportBoardNo;
	private String categorie;
	//신고자
	private String memberId;
	private String reason;
	//신고당한사람
	private String reportTaget;
	private String onGoing;
	private String title;
	private Date reportDate;
	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Report(int reportNo, int reportBoardNo, String categorie, String memberId, String reason, String reportTaget,
			String onGoing, String title, Date reportDate) {
		super();
		this.reportNo = reportNo;
		this.reportBoardNo = reportBoardNo;
		this.categorie = categorie;
		this.memberId = memberId;
		this.reason = reason;
		this.reportTaget = reportTaget;
		this.onGoing = onGoing;
		this.title = title;
		this.reportDate = reportDate;
	}
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public int getReportBoardNo() {
		return reportBoardNo;
	}
	public void setReportBoardNo(int reportBoardNo) {
		this.reportBoardNo = reportBoardNo;
	}
	public String getCategorie() {
		return categorie;
	}
	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getReportTaget() {
		return reportTaget;
	}
	public void setReportTaget(String reportTaget) {
		this.reportTaget = reportTaget;
	}
	public String getOnGoing() {
		return onGoing;
	}
	public void setOnGoing(String onGoing) {
		this.onGoing = onGoing;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	
	
}
