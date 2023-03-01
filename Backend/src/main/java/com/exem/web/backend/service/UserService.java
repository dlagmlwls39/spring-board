package com.exem.web.backend.service;

public interface UserService {

	// 아이디 중복 확인
	public int checkId(String userId) throws Exception;

}
