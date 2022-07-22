package com.toyproject.www.Controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.toyproject.www.Service.ProductService;
import com.toyproject.www.Service.VendorService;
import com.toyproject.www.VO.VendorVO;

@Controller
public class VendorController {
	private static final Logger logger = Logger.getLogger(VendorController.class);
	@Autowired 
	private VendorService vendorService;
	
	@Autowired
	private ProductService productservice;
	
	@ResponseBody
	@RequestMapping(value = "/vendorProductList.do")
	public Map<String, Object> vendorProductList(String vendor_code){
		HashMap<String, Object> result = new HashMap<String, Object>();
		try {
			if(vendor_code != null || StringUtils.isEmpty(vendor_code)) {
				result.put("data", productservice.vendorProductList(vendor_code));
				logger.info("[vendorProductList] 실행");
			}
		} catch (Exception e) {
			logger.info("vendorProductList 오류[" + e.getMessage() + "]");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertVendor.do")
	public boolean insertVendor(VendorVO vendorvo) {
		
		try {
			String vendor_code = "";
			
			for (int i = 1; i <= 15; i++) {
				char ch = (char) ((Math.random() * 26) + 65);	
				vendor_code+=ch;
			}
			int vc = vendorService.selectVendorCode(vendor_code);
			
			if(vc == 1) {
				logger.error("[판매처 코드 생성 실패]");
				return false;
			}else {
				logger.info("[판매처 코드 생성 성공 ]");
				vendorvo.setVendor_code(vendor_code);
				vendorService.insertVendor(vendorvo);
				logger.info("[insertVendor 실행]");
			}
			return true;
			
		} catch (Exception e) {
			logger.error("insertVendor 오류[" + e.getMessage() + "]");
			return false;
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/vendorList.do")
	public Map<String, Object> vendorList(VendorVO vendorvo){
		HashMap<String, Object> list = new HashMap<String, Object>();
		try {
			list.put("data", vendorService.vendorList(vendorvo));
			logger.info("[vendorList] 실행");
		} catch (Exception e) {
			logger.error("vendorList 오류[" + e.getMessage() + "]");
		}
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectVendor.do")
	public Map<String, Object> selectVendor(VendorVO vendorvo){
		HashMap<String, Object> selectVendor = new HashMap<String, Object>();
	
		try {
			selectVendor.put("selectVendor", vendorService.selectVendor(vendorvo));
			logger.info("[selectVendor] 실행");
		} catch (Exception e) {
			logger.error("selectVendor 오류[" + e.getMessage() + "]");
		}
		
		return selectVendor;	
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteVendor.do")
	public boolean deleteVendor(int vendor_seq) {
		try {
			vendorService.deleteVendor(vendor_seq);
			logger.info("[deleteVendor] 실행");
			return true;
		} catch (Exception e) {
			logger.error("deleteVendor 오류[" + e.getMessage() + "]");
			return false;
		}
	}
}
