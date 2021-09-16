package com.jinw0909.portfolio.commons;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jinw0909.portfolio.commons.bo.CommonsBO;

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
			) {
		Map<String, String> result = new HashMap<>();
		int count = commonsBO.signInByInfo(loginId, password, branchId);
		if (count >= 1) {
			result.put("result", "success");
		} else {
			result.put("result", "failure");
		}
		return result;
	}
}
