package com.example.demo.vo;

public class ColorBoxVO {
	private String id,pColor,top,bottom;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		if(id ==null || id.equals("")) {
//			System.out.println("id 값 없음");
			this.id="error";
		}else {
			this.id = id;	
		}
	}

	public String getPColor() {
		return pColor;
	}

	public void setPColor(String pColor) {
		if(pColor ==null || pColor.equals("")) {
//			System.out.println("pColor 값 없음");
			this.pColor = "error";
		}else {
			this.pColor = pColor;
			
		}
	}

	public String getTop() {
		return top;
	}

	public void setTop(String top) {
		if(top ==null || top.equals("")) {
//			System.out.println("top 값 없음");
			this.top = "error";
		}else {
			
			this.top = top;
		}
	}

	public String getBottom() {
		return bottom;
	}

	public void setBottom(String bottom) {
		if(bottom ==null || bottom.equals("")) {
//			System.out.println("bottom 값 없음");
			this.bottom = "error";
		}else {
			
			this.bottom = bottom;
		}
	}

	@Override
	public String toString() {
		return "ColorBoxVO [id=" + id + ", pColor=" + pColor + ", top="+top+", bottom="+bottom+"]";
	}
	

}
