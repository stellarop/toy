package com.toyproject.www.Service;

import org.springframework.stereotype.Service;

import com.toyproject.www.VO.UserVO;

@Service
public interface UserService {
	public void signUp(UserVO uservo);
	public int idCheck(UserVO uservo);
	public UserVO selectUser(UserVO uservo);
}
