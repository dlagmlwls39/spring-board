package com.exem.rest.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.exem.web.backend.dao.BoardDao;
import com.exem.web.backend.service.BoardService;
import com.exem.web.backend.vo.Board;
import com.exem.web.backend.vo.Comment;
import com.exem.web.backend.vo.Post;

@RestController
@RequestMapping("/board/*")
public class RestBoardController {
	
	@Autowired
	private BoardService boardService = null;
	@Autowired
	private BoardDao boardDao = null;
	
	public RestBoardController() {
	}
	
	// 게시판 추가
	@RequestMapping(value={ "boardAdd.json" }, method=RequestMethod.POST)
	public @ResponseBody String boardAdd(Board board) throws Exception {
		int count = this.boardDao.boardAdd(board);
		if(count == 1) return "success";
		else return "fail";
	}
	
	// 게시물 상세보기
	@RequestMapping(value={ "/{postId}/postDetail.json" }, method=RequestMethod.POST)
	public @ResponseBody Post noticeDetail(@PathVariable("postId") int postId) throws Exception {
		Post post = this.boardDao.getPost(postId);
		return post;   
	}

	// 게시물 추가
	@RequestMapping(value={ "postAdd.json" }, method=RequestMethod.POST)
	public @ResponseBody String postAdd(Post post) throws Exception {
		int count = this.boardDao.postAdd(post);
		if(count == 1) return "success";
		else return "fail";
	}
	
	// 수정할 게시물 정보 가져오기
	@RequestMapping(value={ "/{postId}/postEdit.json" }, method=RequestMethod.GET)
	public @ResponseBody Post postEdit(@PathVariable("postId") int postId) throws Exception {
		Post post = this.boardDao.getPost(postId);
		return post;   
	}

	// 게시물 수정
	@RequestMapping(value={ "postEdit.json" }, method=RequestMethod.POST)
	public @ResponseBody String postEdit(Post post) throws Exception {
		int count = this.boardDao.postEdit(post);
		if(count == 1) return "success";
		else return "fail";
	}

	// 게시물 삭제
	@RequestMapping(value={ "postDel.json" }, method=RequestMethod.POST)
	public @ResponseBody String postDel(int postId) throws Exception {
		int count = this.boardService.postDel(postId);
		if(count >= 1) return "success";
		else return "fail";
	}

	// 댓글 등록
	@RequestMapping(value={ "commentAdd.json" }, method=RequestMethod.POST)
	public @ResponseBody String commentAdd(Comment comment) throws Exception {
		int count = this.boardDao.commentAdd(comment);
		if(count == 1) return "success";
		else return "fail";
	}

	// 댓글 가져오기
	@RequestMapping(value={ "getComment.json" }, method=RequestMethod.POST)
	public @ResponseBody List<Comment> getComment(int postId) throws Exception {
		List<Comment> list = this.boardDao.getComment(postId);
		return list;
	}

}
