package com.okkyclone.domain;

public class Criteria {
	private int pageNum;
	private int amount;
	private String type;
	private String keyword;
	private String sort;
	
	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public int getPageStart() {
		return (this.pageNum - 1) * this.amount;
	}

	public int getPageEnd() {
		return this.pageNum * this.amount;
	}

	public int getSkip() {
		return (this.pageNum - 1) * this.amount;
	}

	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Criteria() {
		this(1, 10, "newest"); 
	}

	public Criteria(int pageNum, int amount) {
		this(pageNum, amount, "newest");
	}

	public Criteria(int pageNum, int amount, String sort) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.sort = sort;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
}