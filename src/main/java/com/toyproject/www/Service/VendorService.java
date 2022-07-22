package com.toyproject.www.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.toyproject.www.VO.VendorVO;

@Service
public interface VendorService {
	public void insertVendor(VendorVO vendorvo);
	public List<VendorVO> vendorList(VendorVO vendorvo);
	public VendorVO selectVendor(VendorVO vendorvo);
	public void deleteVendor(int vendor_seq);
	public int selectVendorCode(String vendor_code);
}
