package org.kh.test.board.model.vo;

import org.springframework.stereotype.Component;

@Component
public class SearchOption {

	String category;
	String categoryM;
	String text;
	String location;
	String distance;
	String min;
	String max;
	int minP =0;
	int maxP =0;
	public SearchOption() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchOption(String category, String categoryM, String text, String location, String distance, String min,
			String max, int minP, int maxP) {
		super();
		this.category = category;
		this.categoryM = categoryM;
		this.text = text;
		this.location = location;
		this.distance = distance;
		this.min = min;
		this.max = max;
		this.minP = minP;
		this.maxP = maxP;
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
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public String getMin() {
		return min;
	}
	public void setMin(String min) {
		this.min = min;
	}
	public String getMax() {
		return max;
	}
	public void setMax(String max) {
		this.max = max;
	}
	public int getMinP() {
		return minP;
	}
	public void setMinP(int minP) {
		this.minP = minP;
	}
	public int getMaxP() {
		return maxP;
	}
	public void setMaxP(int maxP) {
		this.maxP = maxP;
	}
	
}
