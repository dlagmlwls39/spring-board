package com.exem.web.backend.dao;

import com.exem.web.backend.vo.User;

public interface UserDao {

	// 회원정보 가져오기 
	public User getUser(String userId) throws Exception;

	// 회원가입 
	public int join(User user) throws Exception;
	
	// 아이디 중복확인
	public int checkId(String userId) throws Exception;
	
	// 회원정보수정
	public int editUser(User user) throws Exception;
	
	// 회원탈퇴
	public int delUser(String userId) throws Exception;

}