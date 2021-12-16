package com.example.demo.vo;

public class ItemVO {
	String pColor,itemNames,imgUrl,siteLink;

	public String getpColor() {
		return pColor;
	}

	public void setpColor(String pColor) {
		this.pColor = pColor;
	}

	public String getItemNames() {
		return itemNames;
	}

	public void setItemNames(String itemNames) {
		this.itemNames = itemNames;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getSiteLink() {
		return siteLink;
	}

	public void setSiteLink(String siteLink) {
		this.siteLink = siteLink;
	}

	@Override
	public String toString() {
		return "ItemVO [pColor=" + pColor + ", itemNames=" + itemNames + ", imgUrl=" + imgUrl + ", siteLink=" + siteLink
				+ "]";
	}

	public ItemVO(String pColor, String itemNames, String imgUrl, String siteLink) {
		super();
		this.pColor = pColor;
		this.itemNames = itemNames;
		this.imgUrl = imgUrl;
		this.siteLink = siteLink;
	}

	
}
