package org.kh.test.board.model.vo;

import java.util.ArrayList;

public class BoardPageData {
	
	
	public BoardPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardPageData(ArrayList<Board> pageList, String pageNavi) {
		super();
		this.pageList = pageList;
		this.pageNavi = pageNavi;
	}
	private ArrayList<Board>pageList;
	private String pageNavi;
	public ArrayList<Board> getPageList() {
		return pageList;
	}
	public void setPageList(ArrayList<Board> pageList) {
		this.pageList = pageList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	

}
