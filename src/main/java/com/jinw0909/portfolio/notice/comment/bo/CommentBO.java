package com.jinw0909.portfolio.notice.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jinw0909.portfolio.notice.comment.dao.CommentDAO;
import com.jinw0909.portfolio.notice.comment.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public List<Comment> getCommentByNoticeId(int noticeId) {
		return commentDAO.selectCommentListByNoticeId(noticeId);
	}
	
	public int addComment(int noticeId, String comment, String pokemonName, String branchName, String permission) {
		return commentDAO.insertComment(noticeId, comment, pokemonName, branchName, permission);
	}
}
