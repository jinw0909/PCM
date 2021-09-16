package com.jinw0909.portfolio.commons;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jinw0909.portfolio.commons.bo.CommonsBO;

@RequestMapping("/commons")
@Controller
public class CommonsController {
	
	@Autowired
	private CommonsBO commonsBO;
	
	@GetMapping("/login_view")
	public String loginView(Model model) {
		List<Map<String, Object>> branchInfo = commonsBO.getBranchInfo();
		model.addAttribute("branchInfo", branchInfo);
		return "commons/loginView";
	}
	
	@GetMapping("/main_view")
	public String mainView() {
		return "commons/mainView";
	}
}
