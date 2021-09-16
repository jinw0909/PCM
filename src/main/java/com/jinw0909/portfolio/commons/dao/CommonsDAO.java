package com.jinw0909.portfolio.commons.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommonsDAO {
	public int insertPokemon(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("permission") String permission
			, @Param("etc") String etc);
	
	public int updatePokemon(
			@Param("id") int id
			, @Param("name") String name
			, @Param("permission") String permission
			, @Param("etc") String etc);
	
	public List<Map<String, Object>> selectBranchInfo();
	
	public int selectCountByIdPwBr(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("branchId") Integer branchId
			);
	
}
