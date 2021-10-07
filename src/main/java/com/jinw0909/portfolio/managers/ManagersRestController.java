package com.jinw0909.portfolio.managers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jinw0909.portfolio.managers.bo.ManagersBO;

@RequestMapping("/managers")
@RestController
public class ManagersRestController {
	
	@Autowired
	private ManagersBO managersBO;
	
	@PostMapping("/deny_request")
	public Map<String, String> addDenial(
			@RequestParam("requestId") int requestId
			, @RequestParam(value="denyInput", required=false) String denial
			) {
		Map<String, String> result = new HashMap<>();
		int count = managersBO.addDenialById(requestId, denial);
		if (count >= 1) {
			result.put("result", "success");
		} else {
			result.put("result", "failure");
		}
		return result;
	}
	
	@PostMapping("/approve_request")
	public Map<String, String> addApproval(
			@RequestParam("requestId") int requestId
			) {
		Map<String, String> result = new HashMap<>();
		int count = managersBO.addApprovalById(requestId);
		if (count >= 1) {
			result.put("result", "success");
		} else {
			result.put("result", "failure");
		}
		return result;
	}
	
}
