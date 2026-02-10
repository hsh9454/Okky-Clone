package com.okkyclone.domain;

import java.util.Date;

public class BoardVO {
    private Long bno;       
    private String title;   
    private String content; 
    private String writer; 
    private Date regdate;   
    private int viewcnt;
    

    public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public Long getBno() { return bno; }
    public void setBno(Long bno) { this.bno = bno; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public String getWriter() { return writer; }
    public void setWriter(String writer) { this.writer = writer; }
    public Date getRegdate() { return regdate; }
    public void setRegdate(Date regdate) { this.regdate = regdate; }
}