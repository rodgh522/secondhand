package org.kh.test.member.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component
public class Member {
	
	String memberId;
	String memberPw;
	String memberName;
	String memberAddr;
	String phone;
	Date regDate;
	String evaluation;
	int mileage;
	ArrayList<Integer> wishList;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String memberId, String memberPw, String memberName, String memberAddr, String phone, Date regDate,
			String evaluation, int mileage, ArrayList<Integer> wishList) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberAddr = memberAddr;
		this.phone = phone;
		this.regDate = regDate;
		this.evaluation = evaluation;
		this.mileage = mileage;
		this.wishList = wishList;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberAddr() {
		return memberAddr;
	}
	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public ArrayList<Integer> getWishList() {
		return wishList;
	}
	public void setWishList(ArrayList<Integer> wishList) {
		this.wishList = wishList;
	}
		
}
