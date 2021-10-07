package com.jinw0909.portfolio.managers.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jinw0909.portfolio.members.model.Request;

@Repository
public interface ManagersDAO {
	public List<Request> selectRequestByBranch(@Param("branchId") int branchId);
	
	public Request selectRequestById(@Param("requestId") int requestId);
	
	public int updateDenialById(
			@Param("requestId") int requestId
			, @Param("denial") String denial
			);
	
	public int updateApprovalById(
			@Param("requestId") int requestId
			);
}
