package com.toyproject.www.VO;

import java.sql.Date;

public class VendorVO {
	private String vendor_code;
	private String vendor_name;
	private String vendor_number;
	private String vendor_type;
	private Date regData;
	public String getVendor_code() {
		return vendor_code;
	}
	public void setVendor_code(String vendor_code) {
		this.vendor_code = vendor_code;
	}
	public String getVendor_name() {
		return vendor_name;
	}
	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}
	public String getVendor_number() {
		return vendor_number;
	}
	public void setVendor_number(String vendor_number) {
		this.vendor_number = vendor_number;
	}
	public String getVendor_type() {
		return vendor_type;
	}
	public void setVendor_type(String vendor_type) {
		this.vendor_type = vendor_type;
	}
	public Date getRegData() {
		return regData;
	}
	public void setRegData(Date regData) {
		this.regData = regData;
	}
	
	
}