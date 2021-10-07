package com.jinw0909.portfolio.members.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jinw0909.portfolio.members.dao.MembersDAO;
import com.jinw0909.portfolio.members.model.Request;

@Service
public class MembersBO {
	
	@Autowired
	private MembersDAO membersDAO;
	
	public int addRequest(int pokemonId, int branchId, String pokemonName, Request request) {
		
		String patients = request.getPatients();
		String levels = request.getLevels();
		String types = request.getTypes();
		String etc = request.getEtc();
		String trainerName = request.getTrainerName();
		String remedy = request.getRemedy();
		int totalRemedy = request.getTotalRemedy();
		int headCount = request.getHeadCount();
		
		return membersDAO.insertRequest(pokemonId, branchId, pokemonName, patients, levels, types, etc, trainerName, remedy, totalRemedy, headCount);
		
	}
	
	public List<Request> getRequestById(int pokemonId) {
		return membersDAO.selectRequestListById(pokemonId);
	}
	
}
