package com.jinw0909.portfolio.members.model;

import java.util.Date;

public class Request {

	private int id;
	private int pokemonId;
	public int getPokemonId() {
		return pokemonId;
	}
	public void setPokemonId(int pokemonId) {
		this.pokemonId = pokemonId;
	}
	public void setPokemonName(String pokemonName) {
		this.pokemonName = pokemonName;
	}
	private int branchId;
	private String pokemonName;
	public String getPokemonName() {
		return pokemonName;
	}
	private String patients;
	private String levels;
	private String types;
	private String trainerName;
	private String etc;
	private String remedy;
	private int totalRemedy;
	public int getTotalRemedy() {
		return totalRemedy;
	}
	public void setTotalRemedy(int totalRemedy) {
		this.totalRemedy = totalRemedy;
	}
	private int headCount;
	private Boolean approval;
	private String denial;
	private Date createdAt;
	private Date updatedAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getBranchId() {
		return branchId;
	}
	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}
	public String getPatients() {
		return patients;
	}
	public void setPatients(String patients) {
		this.patients = patients;
	}
	public String getLevels() {
		return levels;
	}
	public void setLevels(String levels) {
		this.levels = levels;
	}
	public String getTypes() {
		return types;
	}
	public void setTypes(String types) {
		this.types = types;
	}
	public String getTrainerName() {
		return trainerName;
	}
	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getRemedy() {
		return remedy;
	}
	public void setRemedy(String remedy) {
		this.remedy = remedy;
	}
	public int getHeadCount() {
		return headCount;
	}
	public void setHeadCount(int headCount) {
		this.headCount = headCount;
	}
	public Boolean getApproval() {
		return approval;
	}
	public void setApproval(Boolean approval) {
		this.approval = approval;
	}
	public String getDenial() {
		return denial;
	}
	public void setDenial(String denial) {
		this.denial = denial;
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
