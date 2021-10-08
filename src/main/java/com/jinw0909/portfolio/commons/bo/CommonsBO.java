package com.jinw0909.portfolio.commons.bo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jinw0909.portfolio.common.EncryptUtils;
import com.jinw0909.portfolio.common.FileManagerService;
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
	
	public int addPokemon(String loginId, String password, String permission, String etc, int branchId) {
		String encryptPassword = EncryptUtils.md5(password);
		return commonsDAO.insertPokemon(loginId, encryptPassword, permission, etc, branchId);
	}
	
	public int modifyPokemon(int id, String name, String permission, String etc) {
		return commonsDAO.updatePokemon(id, name, permission, etc);
	}
	
	public List<Map<String, Object>> getBranchInfo() {
		return commonsDAO.selectBranchInfo();
	}
	
	public Pokemon signInByInfo(String loginId, String password, Integer branchId) {
		String encryptPassword = EncryptUtils.md5(password);
		return commonsDAO.selectPokemonByLidPwBr(loginId, encryptPassword, branchId);
	}
	
	public PokemonWithBranch getPokemonWithBranch(int pokemonId, Integer branchId) {
		Pokemon pokemon = commonsDAO.selectPokemonById(pokemonId);
		PokemonWithBranch pokemonWithBranch = new PokemonWithBranch();
		Branch branch = branchBO.getBranchById(branchId);
		pokemonWithBranch.setPokemon(pokemon);
		pokemonWithBranch.setBranch(branch);
		
		return pokemonWithBranch;
	}
	
	public int modifyPokemonById(int pokemonId, String loginId, String password, String name, MultipartFile file) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		String filePath = null;
		if (file != null) {
			FileManagerService fileManager = new FileManagerService();
			filePath = fileManager.saveFile(loginId, file);
			
			if (filePath == null) {
				return -1;
			}
		}
		
		return commonsDAO.updatePokemonById(pokemonId, loginId, encryptPassword, name, filePath);
	}
	
	public List<Map<String, Object>> getByParams(Integer branchId, Integer pokemonId) {
		return commonsDAO.selectByParams(branchId, pokemonId);
	}
}
