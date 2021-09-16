package com.jinw0909.portfolio.commons.bo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jinw0909.portfolio.commons.dao.CommonsDAO;

@Service
public class CommonsBO {
	
	@Autowired
	private CommonsDAO commonsDAO;
	
	public int addPokemon(String loginId, String password, String permission, String etc) {
		return commonsDAO.insertPokemon(loginId, password, permission, etc);
	}
	
	public int modifyPokemon(int id, String name, String permission, String etc) {
		return commonsDAO.updatePokemon(id, name, permission, etc);
	}
	
	public List<Map<String, Object>> getBranchInfo() {
		return commonsDAO.selectBranchInfo();
	}
	
	public int signInByInfo(String loginId, String password, Integer branchId) {
		return commonsDAO.selectCountByIdPwBr(loginId, password, branchId);
	}
}
