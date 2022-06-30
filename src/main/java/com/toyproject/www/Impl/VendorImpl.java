package com.toyproject.www.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toyproject.www.DAO.VendorDAO;
import com.toyproject.www.Service.VendorService;
import com.toyproject.www.VO.VendorVO;

@Service
public class VendorImpl implements VendorService{

	@Autowired
	VendorDAO vendorDAO;
	
	@Override
	public void insertVendor(VendorVO vendorvo) {
		vendorDAO.insertVendor(vendorvo);
	}

}
