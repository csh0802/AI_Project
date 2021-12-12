package com.example.demo.vo;

import java.util.Date;

public class BoardVO {

	private int no,grp,seq,lvl;
	private String id,title,content,fileName;
	private Date writeDate;
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		if(no <=0) {
//			System.out.println("no 값 오류");
			this.no=-1;
		}else {
			this.no = no;	
		}
	}
	public int getGrp() {
		return grp;
	}
	public void setGrp(int grp) {
		if(grp<0) {
			this.grp = -1;
		}else {
			this.grp=grp;
		}
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		if(seq<0) {
			this.seq = -1;
		}else {
			this.seq=seq;
		}
	}
	public int getLvl() {
		return lvl;
	}
	public void setLvl(int lvl) {
		if(lvl<0) {
			this.lvl = -1;
		}else {
			this.lvl=lvl;
		}
	}
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		if(title ==null || title.equals("")) {
//			System.out.println("title 값 없음");
			this.title="error";
		}else {
			this.title = title;	
		}
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		if(content ==null || content.equals("")) {
//			System.out.println("content 값 없음");
			this.content="error";
		}else {
			this.content = content;	
		}
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", grp=" + grp + ", seq=" + seq + ", lvl=" + lvl + ", id=" + id + ", title="
				+ title + ", content=" + content + ", fileName=" + fileName + ", writeDate=" + writeDate + "]";
	}

	
}
