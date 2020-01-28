package org.kh.test.board.model.vo;


import java.sql.Timestamp;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component
public class WishList {

	private int regBoardNo;
	private String memberId;
	private Timestamp heartDate;
	
	ArrayList<WishList> wishList;
	public WishList(int regBoardNo, String memberId, Timestamp heartDate, ArrayList<WishList> wishList) {
		super();
		this.regBoardNo = regBoardNo;
		this.memberId = memberId;
		this.heartDate = heartDate;
		this.wishList = wishList;
	}
	public int getRegBoardNo() {
		return regBoardNo;
	}
	public void setRegBoardNo(int regBoardNo) {
		this.regBoardNo = regBoardNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Timestamp getheartDate() {
		return heartDate;
	}
	public void setheartDate(Timestamp heartDate) {
		this.heartDate = heartDate;
	}
	public ArrayList<WishList> getWishList() {
		return wishList;
	}
	public void setWishList(ArrayList<WishList> wishList) {
		this.wishList = wishList;
	}
	public WishList() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	}
	
	

