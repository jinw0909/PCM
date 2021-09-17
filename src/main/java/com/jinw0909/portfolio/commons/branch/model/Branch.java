package com.jinw0909.portfolio.commons.branch.model;

import java.util.Date;

public class Branch {
	private int id;
	private String branchName;
	private String branchColor;
	private String branchSlogan;
	private int remedy;
	private Date createdAt;
	private Date updatedAt;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getBranchColor() {
		return branchColor;
	}
	public void setBranchColor(String branchColor) {
		this.branchColor = branchColor;
	}
	public String getBranchSlogan() {
		return branchSlogan;
	}
	public void setBranchSlogan(String branchSlogan) {
		this.branchSlogan = branchSlogan;
	}
	public int getRemedy() {
		return remedy;
	}
	public void setRemedy(int remedy) {
		this.remedy = remedy;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
}
