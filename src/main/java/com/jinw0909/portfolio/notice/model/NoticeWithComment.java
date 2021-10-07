package com.jinw0909.portfolio.notice.model;

import java.util.List;

import com.jinw0909.portfolio.notice.comment.model.Comment;

public class NoticeWithComment {
	private Notice notice;
	private List<Comment> commentList;
	
	public Notice getNotice() {
		return notice;
	}
	public void setNotice(Notice notice) {
		this.notice = notice;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	
	
	
	
}
