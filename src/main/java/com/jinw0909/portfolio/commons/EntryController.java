package com.jinw0909.portfolio.commons;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EntryController {
	
	@GetMapping("/")
	public String enterService() {
		return "redirect:/commons/login_view";
	}
}
