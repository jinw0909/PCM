package com.jinw0909.portfolio.managers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/managers")
@Controller
public class ManagersController {

	@GetMapping("/manage_view")
	public String manageView() {
		return "managers/manageView";
	}
	
	@GetMapping("/employ_manage_view")
	public String employManageView() {
		return "managers/employManageView";
	}
	
	@GetMapping("/request_manage_view")
	public String requestManageView() {
		return "managers/requestManageView";
	}
	
	@GetMapping("/request_manage_detail_view")
	public String requestManageDetailView() {
		return "managers/requestManageDetailView";
	}
	
}
