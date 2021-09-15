package com.jinw0909.portfolio.supply;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/supply")
@Controller
public class SupplyController {
	
	@GetMapping("/supply_view")
	public String supplyView() {
		return "supply/supplyView";
	}
}
