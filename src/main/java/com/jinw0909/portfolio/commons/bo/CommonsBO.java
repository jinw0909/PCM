package com.jinw0909.portfolio.commons.bo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jinw0909.portfolio.commons.branch.bo.BranchBO;
import com.jinw0909.portfolio.commons.branch.model.Branch;
import com.jinw0909.portfolio.commons.dao.CommonsDAO;
import com.jinw0909.portfolio.commons.model.Pokemon;
import com.jinw0909.portfolio.commons.model.PokemonWithBranch;

@Service
public class CommonsBO {
	
	@Autowired
	private CommonsDAO commonsDAO;
	
	@Autowired
	private BranchBO branchBO;
	
	public int addPokemon(String loginId, String password, String permission, String etc) {
		return commonsDAO.insertPokemon(loginId, password, permission, etc);
	}
	
	public int modifyPokemon(int id, String name, String permission, String etc) {
		return commonsDAO.updatePokemon(id, name, permission, etc);
	}
	
	public List<Map<String, Object>> getBranchInfo() {
		return commonsDAO.selectBranchInfo();
	}
	
	public Pokemon signInByInfo(String loginId, String password, Integer branchId) {
		
		return commonsDAO.selectPokemonByLidPwBr(loginId, password, branchId);
	}
	
	public PokemonWithBranch getPokemonWithBranch(int pokemonId, Integer branchId) {
		Pokemon pokemon = commonsDAO.selectPokemonById(pokemonId);
		PokemonWithBranch pokemonWithBranch = new PokemonWithBranch();
		Branch branch = branchBO.getBranchById(branchId);
		pokemonWithBranch.setPokemon(pokemon);
		pokemonWithBranch.setBranch(branch);
		
		return pokemonWithBranch;
	}
}
