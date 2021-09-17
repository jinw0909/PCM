package com.jinw0909.portfolio.commons.branch.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jinw0909.portfolio.commons.branch.dao.BranchDAO;
import com.jinw0909.portfolio.commons.branch.model.Branch;

@Service
public class BranchBO {
	
	@Autowired
	private BranchDAO branchDAO;

	public Branch getBranchById(Integer id) {
		return branchDAO.selectBranchById(id);
	}
}
