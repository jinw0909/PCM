package com.jinw0909.portfolio.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/notice")
@Controller
public class NoticeController {
	
	@GetMapping("/timeline_view")
	public String timelineView() {
		return "notice/timelineView";
	}
}
