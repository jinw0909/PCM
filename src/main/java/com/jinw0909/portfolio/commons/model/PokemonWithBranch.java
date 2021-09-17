package com.jinw0909.portfolio.commons.model;

import java.util.Date;

import com.jinw0909.portfolio.commons.branch.model.Branch;

public class PokemonWithBranch {
	private Pokemon pokemon;
	private Branch branch;
	
	public Pokemon getPokemon() {
		return pokemon;
	}
	public void setPokemon(Pokemon pokemon) {
		this.pokemon = pokemon;
	}
	public Branch getBranch() {
		return branch;
	}
	public void setBranch(Branch branch) {
		this.branch = branch;
	}
	
}
