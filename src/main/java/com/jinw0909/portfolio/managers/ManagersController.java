package com.jinw0909.portfolio.managers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jinw0909.portfolio.managers.bo.ManagersBO;
import com.jinw0909.portfolio.members.model.Request;

@RequestMapping("/managers")
@Controller
public class ManagersController {
	
	@Autowired
	private ManagersBO managersBO;
	
	@GetMapping("/manage_view")
	public String manageView() {
		return "managers/manageView";
	}
	
	@GetMapping("/employ_manage_view")
	public String employManageView(
			Model model
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int branchId = (Integer)session.getAttribute("branchId");
		model.addAttribute("branchId", branchId);
		return "managers/employManageView";
	}
	
	@GetMapping("/request_manage_view")
	public String requestManageView(
			HttpServletRequest request
			, Model model) {
		HttpSession session = request.getSession();
		int branchId = (Integer)session.getAttribute("branchId");
		List<Request> requestList = managersBO.getRequestByBranchId(branchId);
		model.addAttribute("requestList", requestList);
		return "managers/requestManageView";
	}
	
	@GetMapping("/request_detail_view")
	public String requestDetailView(
			@RequestParam("requestId") int requestId
			, Model model) {
		
		Request request = managersBO.getRequestById(requestId);
		model.addAttribute("request", request);
		return "managers/requestDetailView";
	}
	
}
