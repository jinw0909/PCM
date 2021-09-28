package com.jinw0909.portfolio.notice.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jinw0909.portfolio.common.FileManagerService;
import com.jinw0909.portfolio.notice.dao.NoticeDAO;

@Service
public class NoticeBO {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	public int addNotice(String pokemonName, String notice, MultipartFile file ) {
		
		String imagePath = null;
		if (file != null) {
			FileManagerService fileManager = new FileManagerService();
			imagePath = fileManager.saveFile(pokemonName, file);
			
			if (imagePath == null) {
				return -1;
			}
			
		} 
		
		return noticeDAO.insertNotice(pokemonName, notice, imagePath);
		
		
	}
}
