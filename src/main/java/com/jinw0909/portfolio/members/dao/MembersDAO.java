package com.jinw0909.portfolio.members.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jinw0909.portfolio.members.model.Request;

@Repository
public interface MembersDAO {
	
	public int insertRequest(
			@Param("pokemonId") int pokemonId
			, @Param("branchId") int branchId
			, @Param("pokemonName") String pokemonName
			, @Param("patients") String patients
			, @Param("levels") String levels
			, @Param("types") String types
			, @Param("etc") String etc
			, @Param("trainerName") String trainerName
			, @Param("remedy") String remedy
			, @Param("totalRemedy") int totalRemedy
			, @Param("headCount") int headCount
			);
	
	public List<Request> selectRequestListById(@Param("pokemonId") int pokemonId); 
}
