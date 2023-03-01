package com.exem.web.backend.dao;

import java.util.List;

import com.exem.web.backend.vo.Board;
import com.exem.web.backend.vo.Comment;
import com.exem.web.backend.vo.Post;

public interface BoardDao {

	// 게시판 목록
	public List<Board> boardList() throws Exception;
	
	// 게시판 추가
	public int boardAdd(Board board) throws Exception;
	
	// 게시판 삭제
	public int boardDel(String[] idArr) throws Exception;
	
	// 게시판명 가져오기
	public String getBoardName(int boardId) throws Exception;
	
	// 게시물 목록
	public List<Post> postList(int boardId) throws Exception;
	
	// 게시물 추가
	public int postAdd(Post post) throws Exception;
	
	// 게시물 수정
	public int postEdit(Post post) throws Exception;

	// 게시물 삭제
	public int postDel(int postId) throws Exception;

	// 게시물 가져오기
	public Post getPost(int postId) throws Exception;
	
	// 댓글 등록
	public int commentAdd(Comment comment) throws Exception;
	
	// 댓글 삭제
	public int commentDel(int postId) throws Exception;
		
	// 댓글 가져오기
	public List<Comment> getComment(int postId) throws Exception;
	
}
