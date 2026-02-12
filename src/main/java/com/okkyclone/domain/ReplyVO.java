package com.okkyclone.domain;

import java.util.Date;

public class ReplyVO {
	
    private Long rno;     
    private Long bno;    
    private String reply;  
    private String replyer;
    private Date replyDate; 
    private Date updateDate;
    private Long parentRno;
    private String delYn;
    
		
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public Long getRno() {
		return rno;
	}
	public void setRno(Long rno) {
		this.rno = rno;
	}
	public Long getBno() {
		return bno;
	}
	public void setBno(Long bno) {
		this.bno = bno;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Long getParentRno() {
		return parentRno;
	}
	public void setParentRno(Long parentRno) {
		this.parentRno = parentRno;
	}
    
}