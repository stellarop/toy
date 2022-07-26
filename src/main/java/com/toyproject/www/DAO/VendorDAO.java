package com.toyproject.www.DAO;

import java.util.List;

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
	
	public List<VendorVO> vendorList(VendorVO vendorvo) {
		return sqlsessiontemplate.selectList("vendorDAO.vendorList", vendorvo);
	}
	
	public VendorVO selectVendor(VendorVO vendorvo) {
		return sqlsessiontemplate.selectOne("vendorDAO.selectVendor", vendorvo);
	}
	
	public void deleteVendor(int vendor_seq) {
		sqlsessiontemplate.delete("vendorDAO.deleteVendor", vendor_seq);
	}
	
	public int selectVendorCode(String vendor_code) {
		return sqlsessiontemplate.selectOne("vendorDAO.selectVendorCode", vendor_code);
	}
	
	public int selectUserId(String user_Id) {
		return sqlsessiontemplate.selectOne("vendorDAO.selectUserId", user_Id);
	}
}
