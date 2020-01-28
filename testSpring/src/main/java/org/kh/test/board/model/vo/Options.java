package org.kh.test.board.model.vo;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component
public class Options {

	String optionName;
	String optionValue;
	ArrayList<Options> list;
	int boardNo;
	public Options() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Options(String optionName, String optionValue) {
		super();
		this.optionName = optionName;
		this.optionValue = optionValue;
	}

	public Options(String optionName, String optionValue, ArrayList<Options> list) {
		super();
		this.optionName = optionName;
		this.optionValue = optionValue;
		this.list = list;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public String getOptionValue() {
		return optionValue;
	}
	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}
	public ArrayList<Options> getList() {
		return list;
	}
	public void setList(ArrayList<Options> list) {
		this.list = list;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
		
}
