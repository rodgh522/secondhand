package org.kh.test.board.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Search {
	
	private String select,keyword;
	private int start, end;
	private String text;
	public Search() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Search(String select, String keyword, int start, int end, String text) {
		super();
		this.select = select;
		this.keyword = keyword;
		this.start = start;
		this.end = end;
		this.text = text;
	}
	public String getSelect() {
		return select;
	}
	public void setSelect(String select) {
		this.select = select;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
		

}
