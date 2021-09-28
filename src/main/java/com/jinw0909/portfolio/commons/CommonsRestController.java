package com.jinw0909.portfolio.commons;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jinw0909.portfolio.commons.bo.CommonsBO;
import com.jinw0909.portfolio.commons.model.Pokemon;
import com.jinw0909.portfolio.commons.model.PokemonWithBranch;

@RestController
@RequestMapping("/commons")
public class CommonsRestController {
	
	@Autowired
	private CommonsBO commonsBO;

	@PostMapping("/sign_up")
	public Map<String, String> signUp(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("permission") String permission
			, @RequestParam(value = "etc", required = false) String etc
			) {
		
		
		
		Map<String, String> result = new HashMap<>();
		int count = commonsBO.addPokemon(loginId, password, permission, etc);
		if (count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "failure");
		}
		return result;
	}
	
	@PostMapping("/modify")
	public Map<String, String> modify(
			@RequestParam("id") int id
			, @RequestParam("name") String name
			, @RequestParam("permission") String permission
			, @RequestParam(value = "etc", required = false) String etc
			) {
		Map<String, String> result = new HashMap<>();
		int count = commonsBO.modifyPokemon(id, name, permission, etc);
		if (count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "failure");
		}
		return result;
	}
	
	@PostMapping("/sign_in")
	public Map<String, String> signIn(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("branchId") Integer branchId
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Map<String, String> result = new HashMap<>();
		Pokemon pokemon = commonsBO.signInByInfo(loginId, password, branchId);
		if (pokemon != null) {
			PokemonWithBranch pwb = commonsBO.getPokemonWithBranch(pokemon.getId(), pokemon.getBranchId());
			session.setAttribute("permission", pwb.getPokemon().getPermission());
			session.setAttribute("loginId", pwb.getPokemon().getLoginId());
			session.setAttribute("pokemonId", pwb.getPokemon().getId());
			session.setAttribute("pokemonName", pwb.getPokemon().getPokemonName());
			session.setAttribute("picture", pwb.getPokemon().getProfileImage());
			session.setAttribute("branchName", pwb.getBranch().getBranchName());
			session.setAttribute("branchColor", pwb.getBranch().getBranchColor());
			session.setAttribute("branchSlogan", pwb.getBranch().getBranchSlogan());
			
			
			
			result.put("result", "success");
		} else {
			result.put("result", "failure");
		}
		return result;
	}
	
	@PostMapping("/modify_pokemon")
	public Map<String, String> modifyPokemon(HttpServletRequest request
			,@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam(value = "picture", required = false) MultipartFile picture) {
		HttpSession session = request.getSession();
		int id = (Integer)session.getAttribute("pokemonId");
		
		Map<String, String> result = new HashMap<>();
		int count = commonsBO.modifyPokemonById(id, loginId, password, name, picture);
		if (count == 1) {
			result.put("result", "success");
			
			
		} else {
			result.put("result", "failure");
		}
		return result;
	}
	
}
