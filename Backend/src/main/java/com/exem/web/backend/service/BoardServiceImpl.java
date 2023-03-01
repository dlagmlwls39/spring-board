package com.exem.web.backend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exem.web.backend.dao.BoardDao;
import com.exem.web.backend.vo.Post;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDao = null;

	// 게시판 삭제
	@Override
	public int boardDel(String[] idArr) throws Exception {

		// 댓글 및 게시물 삭제
		int count = 0;
		for (int i = 0; i < idArr.length; i++) {
			List<Post> postList = this.boardDao.postList(Integer.parseInt(idArr[i]));
			for (int j = 0; i < postList.size(); i++) {
				count += this.postDel(postList.get(j).getPostId());
			}
		}
		// 게시판 삭제
		int count2 = this.boardDao.boardDel(idArr);
				
		return count + count2;
	}
	
	// 게시물 삭제
	@Override
	public int postDel(int postId) throws Exception {
		
		// 댓글 및 게시물 삭제
		int count = this.boardDao.commentDel(postId);
		int count2 = this.boardDao.postDel(postId);
		
		return count + count2;
	}


}
