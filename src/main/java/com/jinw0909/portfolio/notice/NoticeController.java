package com.jinw0909.portfolio.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jinw0909.portfolio.notice.bo.NoticeBO;
import com.jinw0909.portfolio.notice.model.NoticeWithComment;

@RequestMapping("/notice")
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeBO noticeBO;
	
	@GetMapping("/timeline_view")
	public String timelineView(Model model) {
		
		List<NoticeWithComment> noticeList = noticeBO.getNoticeList();
		model.addAttribute("noticeList", noticeList);
		
		return "notice/timelineView";
	}
	
	
}
