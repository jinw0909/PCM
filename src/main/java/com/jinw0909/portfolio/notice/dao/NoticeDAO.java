package com.jinw0909.portfolio.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jinw0909.portfolio.notice.model.Notice;

@Repository
public interface NoticeDAO {
	public int insertNotice(
			@Param("pokemonName") String pokemonName
			, @Param("content") String content
			, @Param("imagePath") String imagePath
			);
	public List<Notice> selectNoticeList();
}
