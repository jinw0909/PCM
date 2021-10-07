package com.jinw0909.portfolio.notice.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jinw0909.portfolio.notice.comment.model.Comment;

@Repository
public interface CommentDAO {
	public List<Comment> selectCommentListByNoticeId(@Param("noticeId") int noticeId);
	
	public int insertComment(
			@Param("noticeId") int noticeId
			, @Param("comment") String comment
			, @Param("pokemonName") String pokemonName
			, @Param("branchName") String branchName
			, @Param("permission") String permission);
}
