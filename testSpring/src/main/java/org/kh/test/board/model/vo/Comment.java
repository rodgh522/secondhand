package org.kh.test.board.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Comment {

	private int commentNo;
	private int regBoardNo;
	private String commentTitle;
	private String commentContent;
	private String commentId;
	private int regCommentNo;
	private String reCommentId;
	private String recommentContent;
	private int score;
	private int reCommentNo;
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(int commentNo, int regBoardNo, String commentTitle, String commentContent, String commentId,
			int regCommentNo, String reCommentId, String recommentContent, int score, int reCommentNo) {
		super();
		this.commentNo = commentNo;
		this.regBoardNo = regBoardNo;
		this.commentTitle = commentTitle;
		this.commentContent = commentContent;
		this.commentId = commentId;
		this.regCommentNo = regCommentNo;
		this.reCommentId = reCommentId;
		this.recommentContent = recommentContent;
		this.score = score;
		this.reCommentNo = reCommentNo;
	}
	public int getReCommentNo() {
		return reCommentNo;
	}
	public void setReCommentNo(int reCommentNo) {
		this.reCommentNo = reCommentNo;
	}
	public Comment(int commentNo, int regBoardNo, String commentTitle, String commentContent, String commentId,
			int regCommentNo, String reCommentId, String recommentContent, int score) {
		super();
		this.commentNo = commentNo;
		this.regBoardNo = regBoardNo;
		this.commentTitle = commentTitle;
		this.commentContent = commentContent;
		this.commentId = commentId;
		this.regCommentNo = regCommentNo;
		this.reCommentId = reCommentId;
		this.recommentContent = recommentContent;
		this.score = score;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getRegBoardNo() {
		return regBoardNo;
	}
	public void setRegBoardNo(int regBoardNo) {
		this.regBoardNo = regBoardNo;
	}
	public String getCommentTitle() {
		return commentTitle;
	}
	public void setCommentTitle(String commentTitle) {
		this.commentTitle = commentTitle;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	public int getRegCommentNo() {
		return regCommentNo;
	}
	public void setRegCommentNo(int regCommentNo) {
		this.regCommentNo = regCommentNo;
	}
	public String getReCommentId() {
		return reCommentId;
	}
	public void setReCommentId(String reCommentId) {
		this.reCommentId = reCommentId;
	}
	public String getRecommentContent() {
		return recommentContent;
	}
	public void setRecommentContent(String recommentContent) {
		this.recommentContent = recommentContent;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
}
