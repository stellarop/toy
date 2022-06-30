package com.toyproject.www.Controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.toyproject.www.Service.VendorService;
import com.toyproject.www.VO.VendorVO;

@Controller
public class VendorController {
	private static final Logger logger = Logger.getLogger(VendorController.class);
	@Autowired 
	private VendorService vendorService;

	@ResponseBody
	@RequestMapping(value = "/insertVendor.do")
	public boolean insertVendor(VendorVO vendorvo) {
		 
		try {
			String vendor_code = "";
			
			for (int i = 1; i <= 10; i++) {
				char ch = (char) ((Math.random() * 26) + 65);	
				vendor_code+=ch;
			}
			
			vendorvo.setVendor_code(vendor_code);
			vendorService.insertVendor(vendorvo);
			logger.info("[insertVendor 실행]");
			return true;
		} catch (Exception e) {
			logger.error("insertVendor 오류[" + e.getMessage() + "]");
			return false;
		}
	}
}
