package com.exem.web.backend.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exem.web.backend.dao.UserDao;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao = null;
	
	// 아이디 중복 확인
	@Override
	public int checkId(String userId) throws Exception{
		return this.userDao.checkId(userId);
	}

}
