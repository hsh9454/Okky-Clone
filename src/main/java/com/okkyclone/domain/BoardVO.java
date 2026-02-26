package com.okkyclone.domain;

import java.util.Date;

public class BoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcnt;
	private int update;
	private int likecnt;
	private int dislikecnt;
	private int replycnt;
	private String user_img;
	private Integer cat_id;
	private String cat_name;
	private String cat_slug;
	private Integer group_id;
	private String group_name;
	
	public Integer getGroup_id() {
		return group_id;
	}

	public void setGroup_id(Integer group_id) {
		this.group_id = group_id;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	
	public String getTimeGap() {
	    long now = System.currentTimeMillis();
	    long reg = this.regdate.getTime();
	    long diff = (now - reg) / 1000;
	    
	    if (diff < 60) return "방금 전";
	    if (diff < 3600) return (diff / 60) + "분";
	    if (diff < 86400) return "약 " + (diff / 3600) + "시간";
	    if (diff < 604800) return (diff / 86400) + "일";
	    
	    return (diff / 86400) + "일";
	}
	
	public String getCat_slug() {
		return cat_slug;
	}

	public void setCat_slug(String cat_slug) {
		this.cat_slug = cat_slug;
	}

	private boolean isNew;
	

	public boolean isNew() {
		return isNew;
	}

	public void setNew(boolean isNew) {
		this.isNew = isNew;
	}

	public boolean isIsNew() {
		return isNew;
	}

	public void setIsNew(boolean isNew) {
		this.isNew = isNew;
	}

	public boolean checkIsNew() {
		if (regdate == null)
			return false;
		long now = System.currentTimeMillis();
		long reg = regdate.getTime();
		long gap = 24 * 60 * 60 * 1000;
		return (now - reg) < gap;
	}

	public String getCat_name() {
		return cat_name;
	}

	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}

	public Integer getCat_id() {
		return cat_id;
	}

	public void setCat_id(Integer cat_id) {
		this.cat_id = cat_id;
	}

	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	public int getReplycnt() {
		return replycnt;
	}

	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}

	public int getDislikecnt() {
		return dislikecnt;
	}

	public void setDislikecnt(int dislikecnt) {
		this.dislikecnt = dislikecnt;
	}

	public int getUpdate() {
		return update;
	}

	public void setUpdate(int update) {
		this.update = update;
	}

	public int getLikecnt() {
		return likecnt;
	}

	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public Long getBno() {
		return bno;
	}

	public void setBno(Long bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}