package org.kh.test.member.model.vo;

import java.sql.Date;

public class Message {
	private int messageNo;
	private String sender;
	private String receiver;
	private String content;
	private Date senderDate;
	private String read;
	
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Message(int messageNo, String sender, String receiver, String content, Date senderDate, String read) {
		super();
		this.messageNo = messageNo;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.senderDate = senderDate;
		this.read = read;
	}
	
	public int getMessageNo() {
		return messageNo;
	}
	
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSenderDate() {
		return senderDate;
	}
	public void setSenderDate(Date senderDate) {
		this.senderDate = senderDate;
	}
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
	
	
	
}
