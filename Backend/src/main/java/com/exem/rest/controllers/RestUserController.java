package com.exem.rest.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.exem.web.backend.service.UserService;

@RestController
@RequestMapping("/user/*")
public class RestUserController {
	
	@Autowired
	private UserService userService = null;
	
	public RestUserController() {
	}

	// 아이디 중복 확인
	@RequestMapping(value={ "checkId.json" }, method=RequestMethod.POST)
	public @ResponseBody String checkId(String userId) throws Exception {

		int count = this.userService.checkId(userId);
		
		String result = "";
		if(count == 0) result = "ok";
		else result = "not ok";
		
		return result;
	}
	
}
