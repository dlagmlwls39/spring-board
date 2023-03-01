package com.exem.web.backend.service;

import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public interface BoardService {

	// 게시판 삭제
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
	public int boardDel(String[] idArr) throws Exception;
		
	// 게시물 삭제
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
	public int postDel(int postId) throws Exception;
	
}
