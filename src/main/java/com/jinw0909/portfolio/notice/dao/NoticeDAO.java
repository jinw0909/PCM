package com.jinw0909.portfolio.notice.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface NoticeDAO {
	public int insertNotice(
			@Param("pokemonName") String pokemonName
			, @Param("content") String content
			, @Param("imagePath") String imagePath
			);
}
