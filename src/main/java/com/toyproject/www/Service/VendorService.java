package com.toyproject.www.Service;

import org.springframework.stereotype.Service;

import com.toyproject.www.VO.VendorVO;

@Service
public interface VendorService {
	public void insertVendor(VendorVO vendorvo);
}
