package com.toyproject.www.DAO;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.toyproject.www.VO.VendorVO;

@Repository
public class VendorDAO {
	
	@Autowired
	SqlSessionTemplate sqlsessiontemplate;
	
	public void insertVendor(VendorVO vendorvo) {
		sqlsessiontemplate.insert("vendorDAO.insertVendor", vendorvo);
	}
}
