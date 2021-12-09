package com.example.demo.vo;

import java.util.Date;

public class CommentVO {
 
    private int cno;
    private int bno;
    private String content;
    private String writer;
    private Date reg_date;
    
    
 
    public CommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommentVO(int cno, int bno, String content, String writer, Date reg_date) {
		super();
		this.cno = cno;
		this.bno = bno;
		this.content = content;
		this.writer = writer;
		this.reg_date = reg_date;
	}

	public int getCno() {
        return cno;
    }
 
    public void setCno(int cno) {
        this.cno = cno;
    }
 
    public int getBno() {
        return bno;
    }
 
    public void setBno(int bno) {
        this.bno = bno;
    }
 
    public String getContent() {
        return content;
    }
 
    public void setContent(String content) {
        this.content = content;
    }
 
    public String getWriter() {
        return writer;
    }
 
    public void setWriter(String writer) {
        this.writer = writer;
    }
 
    public Date getReg_date() {
        return reg_date;
    }
 
    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

	@Override
	public String toString() {
		return "CommentVO [cno=" + cno + ", bno=" + bno + ", content=" + content + ", writer=" + writer + ", reg_date="
				+ reg_date + "]";
	}
    
    
 
}
