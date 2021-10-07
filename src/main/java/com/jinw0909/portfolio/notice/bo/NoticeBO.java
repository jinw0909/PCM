package com.jinw0909.portfolio.notice.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jinw0909.portfolio.common.FileManagerService;
import com.jinw0909.portfolio.notice.comment.bo.CommentBO;
import com.jinw0909.portfolio.notice.comment.model.Comment;
import com.jinw0909.portfolio.notice.dao.NoticeDAO;
import com.jinw0909.portfolio.notice.model.Notice;
import com.jinw0909.portfolio.notice.model.NoticeWithComment;

@Service
public class NoticeBO {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private CommentBO commentBO;
	
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
	
	public List<NoticeWithComment> getNoticeList() {
		
		List<Notice> noticeList = noticeDAO.selectNoticeList();
		List<NoticeWithComment> noticeWithCommentList = new ArrayList<>();
		
		for (Notice notice: noticeList) {
			List<Comment> commentList = commentBO.getCommentByNoticeId(notice.getId());
			NoticeWithComment noticeWithComment = new NoticeWithComment();
			noticeWithComment.setNotice(notice);
			noticeWithComment.setCommentList(commentList);
			
			noticeWithCommentList.add(noticeWithComment);
		}
		
		return noticeWithCommentList;
	}
}
