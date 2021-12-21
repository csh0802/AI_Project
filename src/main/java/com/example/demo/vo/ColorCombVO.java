package com.example.demo.vo;

public class ColorCombVO {

	String top,bottom,shoes;

	public String getTop() {
		return top;
	}

	public void setTop(String top) {
		this.top = top;
	}

	public String getBottom() {
		return bottom;
	}

	public void setBottom(String bottom) {
		this.bottom = bottom;
	}

	public String getShoes() {
		return shoes;
	}

	public void setShoes(String shoes) {
		this.shoes = shoes;
	}

	@Override
	public String toString() {
		return "ColorCombVO [top=" + top + ", bottom=" + bottom + ", shoes=" + shoes + "]";
	}

	public ColorCombVO(String top, String bottom, String shoes) {
		super();
		setTop(top);
		setBottom(bottom);
		setShoes(shoes);
	}
	
	
}
