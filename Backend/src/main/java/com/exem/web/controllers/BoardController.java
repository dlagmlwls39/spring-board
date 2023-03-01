package com.exem.web.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exem.web.backend.dao.BoardDao;
import com.exem.web.backend.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService boardService = null;
	@Autowired
	private BoardDao boardDao = null;
	
	// 게시판 목록
	@RequestMapping(value = { "boardList.htm" }, method = RequestMethod.GET)
	public String boardList(Model model, Authentication authentication) throws Exception {
	
		List list = this.boardDao.boardList();
	
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		
		model.addAttribute("list", list);
		model.addAttribute("userId", userDetails.getUsername());
		
		return "boardList.jsp";
	}
	
	// 게시판 삭제
	@RequestMapping(value = { "boardDel.htm" }, method = RequestMethod.GET)
	public String boardDel(String boardId) throws Exception {
		
		String[] idArr = boardId.split(",");
		int count = this.boardService.boardDel(idArr);
		
		if(count >= 1) return "redirect:boardList.htm";
		else return "redirect:boardList.htm?error";
	}
	
	// 게시물 목록
	@RequestMapping(value = { "postList.htm" }, method = RequestMethod.GET)
	public String postList(int boardId, Model model, Authentication authentication) throws Exception {
	
		List list = this.boardDao.postList(boardId);
		String boardName = this.boardDao.getBoardName(boardId);
	
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		
		model.addAttribute("list", list);
		model.addAttribute("boardId", boardId);
		model.addAttribute("boardName", boardName);
		model.addAttribute("userId", userDetails.getUsername());
		
		return "postList.jsp";
	}
	
	
}
