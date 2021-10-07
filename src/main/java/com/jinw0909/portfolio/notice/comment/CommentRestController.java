package com.jinw0909.portfolio.notice.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jinw0909.portfolio.notice.comment.bo.CommentBO;

@RestController
@RequestMapping("/comment")
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/create_comment")
	public Map<String, String> createComment(
			@RequestParam("noticeId") int noticeId
			, @RequestParam("comment") String comment
			, HttpServletRequest request
			) {
		HttpSession session = request.getSession();
		String branchName = (String)session.getAttribute("branchName");
		String permission = (String)session.getAttribute("permission");
		String pokemonName = (String)session.getAttribute("pokemonName");
		
		Map<String, String> result = new HashMap<>();
		
		int count = commentBO.addComment(noticeId, comment, pokemonName, branchName, permission);
		if (count >= 1) {
			result.put("result", "success");
		} else {
			result.put("result", "failure");
		}
		
		return result;
	}
}
