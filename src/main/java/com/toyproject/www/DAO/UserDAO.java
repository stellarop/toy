package com.toyproject.www.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.toyproject.www.VO.UserVO;

@Repository
public class UserDAO {

	@Autowired
	SqlSessionTemplate sqlsessiontemplate;
	
	public void signUp(UserVO uservo) {
		sqlsessiontemplate.insert("userDAO.SignUp",uservo);
	}
	
	public UserVO selectUser(UserVO uservo) {
		return sqlsessiontemplate.selectOne("userDAO.selectUser", uservo);
	}
	
	public int idCheck(UserVO uservo) {
		int idCheck = sqlsessiontemplate.selectOne("userDAO.idCheck",uservo);
		return idCheck;
	}
}
