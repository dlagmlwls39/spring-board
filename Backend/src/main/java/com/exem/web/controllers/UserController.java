package com.exem.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exem.web.backend.dao.UserDao;
import com.exem.web.backend.vo.User;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private UserDao userDao = null;
	
	// 로그인 페이지
	@RequestMapping(value = { "login.htm" }, method = RequestMethod.GET)
	public String login() throws Exception {
		return "login.jsp";
	}
	
	// 회원가입 페이지
	@RequestMapping(value = { "join.htm" }, method = RequestMethod.GET)
	public String join() throws Exception {
		return "join.jsp";
	}
	
	// 회원가입
	@RequestMapping(value = { "join.htm" }, method = RequestMethod.POST)
	public String join(User user) throws Exception {
		this.userDao.join(user);
		return "redirect:../index.htm";  
	}
	
	// 회원정보수정 페이지
	@RequestMapping(value = { "userInfo.htm" }, method = RequestMethod.GET)
	public String userInfo(Model model, Authentication authentication) throws Exception {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		User user = this.userDao.getUser(userDetails.getUsername());
		model.addAttribute("user", user);
		
		return "userInfo.jsp";  
	}

	// 회원정보수정
	@RequestMapping(value = { "userInfo.htm" }, method = RequestMethod.POST)
	public String editUser(User user, Authentication authentication) throws Exception {

		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		user.setUserId(userDetails.getUsername());
		this.userDao.editUser(user);

		return "redirect:userInfo.htm";  
	}
	
	// 회원탈퇴
	@RequestMapping(value = { "userDel.htm" }, method = RequestMethod.GET)
	public String delUser(Authentication authentication) throws Exception {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		this.userDao.delUser(userDetails.getUsername());
		
		return "redirect:../index.htm";  
	}

}
