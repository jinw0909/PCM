package com.jinw0909.portfolio.commons;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/commons")
@Controller
public class CommonsController {
	
	@GetMapping("/login_view")
	public String loginView() {
		return "commons/loginView";
	}
	
	@GetMapping("/main_view")
	public String mainView() {
		return "commons/mainView";
	}
}
