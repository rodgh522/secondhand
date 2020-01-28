package org.kh.test.member.model.vo;

public class BuyPoint {
	private String memberId;
	private int mileage;
	private int mData;
	private int subData;
	public BuyPoint() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BuyPoint(String memberId, int mileage, int mData, int subData) {
		super();
		this.memberId = memberId;
		this.mileage = mileage;
		this.mData = mData;
		this.subData = subData;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public int getmData() {
		return mData;
	}
	public void setmData(int mData) {
		this.mData = mData;
	}
	public int getSubData() {
		return subData;
	}
	public void setSubData(int subData) {
		this.subData = subData;
	}
	
	
	
	
}
