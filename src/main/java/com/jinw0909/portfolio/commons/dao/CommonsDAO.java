package com.jinw0909.portfolio.commons.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jinw0909.portfolio.commons.model.Pokemon;

@Repository
public interface CommonsDAO {
	public int insertPokemon(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("permission") String permission
			, @Param("etc") String etc
			, @Param("branchId") int branchId);
	
	public int updatePokemon(
			@Param("id") int id
			, @Param("name") String name
			, @Param("permission") String permission
			, @Param("etc") String etc);
	
	public List<Map<String, Object>> selectBranchInfo();
	
	public Pokemon selectPokemonByLidPwBr(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("branchId") Integer branchId
			);
	
	public Pokemon selectPokemonById(
			@Param("id") int pokemonId
			);
	
	public int updatePokemonById(
			@Param("id") int id
			, @Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("imagePath") String imagePath
			);
	
	public List<Map<String, Object>> selectByBranchId(@Param("branchId") int branchId);
}
