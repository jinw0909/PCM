package com.jinw0909.portfolio.managers.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jinw0909.portfolio.managers.dao.ManagersDAO;
import com.jinw0909.portfolio.members.model.Request;

@Service
public class ManagersBO {
	
	@Autowired
	private ManagersDAO managersDAO;
	
	public List<Request> getRequestByBranchId(int branchId) {
		return managersDAO.selectRequestByBranch(branchId);
	}
	
	public Request getRequestById(int requestId) {
		return managersDAO.selectRequestById(requestId);
	}
	
	public int addDenialById(int requestId, String denial) {
		return managersDAO.updateDenialById(requestId, denial);
	}
	
	public int addApprovalById(int requestId) {
		return managersDAO.updateApprovalById(requestId);
	}
}
