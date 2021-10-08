package com.jinw0909.portfolio.commons;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@GetMapping("log_out")
	public String logOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("pokemonId");
		session.removeAttribute("branchId");
		session.removeAttribute("branchName");
		session.removeAttribute("pokemonName");
		session.removeAttribute("branchColor");
		session.removeAttribute("branchSlogan");
		session.removeAttribute("loginId");
		session.removeAttribute("permission");
		session.removeAttribute("picture");
		return "redirect:/commons/login_view";
	}
}
