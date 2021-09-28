package com.jinw0909.portfolio.notice;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jinw0909.portfolio.notice.bo.NoticeBO;

@RestController
@RequestMapping("/notice")
public class NoticeRestController {

	@Autowired
	private NoticeBO noticeBO; 
	
	@PostMapping("/create_notice")
	public Map<String, String> createNotice(
			@RequestParam("pokemonName") String pokemonName
			, @RequestParam("notice") String notice
			, @RequestParam(value = "file", required = false) MultipartFile file
			) {
		Map<String, String> result = new HashMap<>();
		int count = noticeBO.addNotice(pokemonName, notice, file);
		if (count >= 0) {
			result.put("result", "success");
		} else {
			result.put("result", "failure");
		}
		return result;
	}
}
