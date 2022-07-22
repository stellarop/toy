package com.toyproject.www.Impl;

import java.util.List;

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

	@Override
	public List<VendorVO> vendorList(VendorVO vendorvo) {
		return vendorDAO.vendorList(vendorvo);
	}

	@Override
	public VendorVO selectVendor(VendorVO vendorvo) {
		return vendorDAO.selectVendor(vendorvo);
	}

	@Override
	public void deleteVendor(int vendor_seq) {
		vendorDAO.deleteVendor(vendor_seq);
	}

	@Override
	public int selectVendorCode(String vendor_code) {
		return vendorDAO.selectVendorCode(vendor_code);
	}

}
