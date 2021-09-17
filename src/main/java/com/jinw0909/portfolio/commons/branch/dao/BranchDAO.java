package com.jinw0909.portfolio.commons.branch.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jinw0909.portfolio.commons.branch.model.Branch;


@Repository
public interface BranchDAO {
	public Branch selectBranchById(@Param("id") Integer id);
}
