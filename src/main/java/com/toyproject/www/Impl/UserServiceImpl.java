package com.toyproject.www.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toyproject.www.DAO.UserDAO;
import com.toyproject.www.Service.UserService;
import com.toyproject.www.VO.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	
	@Override
	public void signUp(UserVO uservo) {
		userDAO.signUp(uservo);
	}

	@Override
	public int idCheck(UserVO uservo) {
		int idCheck = userDAO.idCheck(uservo);
		return idCheck;
	}

	@Override
	public UserVO selectUser(UserVO uservo) {
		return userDAO.selectUser(uservo);
		
	}

}
