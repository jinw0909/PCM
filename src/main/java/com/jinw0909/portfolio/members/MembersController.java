package com.jinw0909.portfolio.members;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/members")
@Controller
public class MembersController {

	@GetMapping("/request_view")
	public String requestView() {
		return "members/requestView";
	}
	
	@GetMapping("/request_create_view")
	public String requestCreateView() {
		return "members/requestCreateView";
	}

}
