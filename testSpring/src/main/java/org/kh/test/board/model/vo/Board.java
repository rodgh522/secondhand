package org.kh.test.board.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Board {

	int boardNo;
	String category;
	String categoryM;
	String title;
	String content;
	String userId;
	Date regDate;
	int price;
	String phone;
	String sellerType;
	String location;
	List<String> files;
	int readCount;
	String possess;
	String grade;
	ArrayList<Options> options;
	List<String> cookieList;
	ArrayList<WishList> wishList;

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int boardNo, String category, String categoryM, String title, String content, String userId,
			Date regDate, int price, String phone, String sellerType, String location, List<String> files,
			int readCount, String possess, String grade, ArrayList<Options> options, List<String> cookieList,
			ArrayList<WishList> wishList) {
		super();
		this.boardNo = boardNo;
		this.category = category;
		this.categoryM = categoryM;
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.regDate = regDate;
		this.price = price;
		this.phone = phone;
		this.sellerType = sellerType;
		this.location = location;
		this.files = files;
		this.readCount = readCount;
		this.possess = possess;
		this.grade = grade;
		this.options = options;
		this.cookieList = cookieList;
		this.wishList = wishList;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCategoryM() {
		return categoryM;
	}

	public void setCategoryM(String categoryM) {
		this.categoryM = categoryM;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSellerType() {
		return sellerType;
	}

	public void setSellerType(String sellerType) {
		this.sellerType = sellerType;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public List<String> getFiles() {
		return files;
	}

	public void setFiles(List<String> files) {
		this.files = files;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getPossess() {
		return possess;
	}

	public void setPossess(String possess) {
		this.possess = possess;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public ArrayList<Options> getOptions() {
		return options;
	}

	public void setOptions(ArrayList<Options> options) {
		this.options = options;
	}

	public List<String> getCookieList() {
		return cookieList;
	}

	public void setCookieList(List<String> cookieList) {
		this.cookieList = cookieList;
	}

	public ArrayList<WishList> getWishList() {
		return wishList;
	}

	public void setWishList(ArrayList<WishList> wishList) {
		this.wishList = wishList;
	}
	
}
