package org.kh.test.board.model.vo;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component
public class PageData {
	
	private ArrayList<Qna>pageList;
	private String pageNavi;
	public PageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PageData(ArrayList<Qna> pageList, String pageNavi) {
		super();
		this.pageList = pageList;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Qna> getPageList() {
		return pageList;
	}
	public void setPageList(ArrayList<Qna> pageList) {
		this.pageList = pageList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
	
	
	
	
	
	
	
	
	

}
