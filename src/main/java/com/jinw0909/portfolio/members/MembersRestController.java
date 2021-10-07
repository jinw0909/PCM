package com.jinw0909.portfolio.members;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jinw0909.portfolio.managers.bo.ManagersBO;
import com.jinw0909.portfolio.members.bo.MembersBO;
import com.jinw0909.portfolio.members.model.Request;

@RestController
@RequestMapping("/members")
public class MembersRestController {
	
	@Autowired
	private MembersBO membersBO;
	
	@Autowired
	private ManagersBO managersBO;
	
	@PostMapping("/create_request")
	public Map<String, String> createRequest(
			@RequestBody Request request
			, HttpServletRequest servletRequest
			) {
		HttpSession session = servletRequest.getSession();
		int pokemonId = (Integer)session.getAttribute("pokemonId");
		int branchId = (Integer)session.getAttribute("branchId");
		String pokemonName = (String)session.getAttribute("pokemonName");
		
		
		Map<String, String> result = new HashMap<>();
		
		int count = membersBO.addRequest(pokemonId, branchId, pokemonName, request);
		if (count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "failure");
		}
		return result;
	}
	
	@GetMapping("/check_request")
	public Request checkRequest(@RequestParam("requestId") int requestId) {
		Request request = managersBO.getRequestById(requestId);
		return request;
	}
}
