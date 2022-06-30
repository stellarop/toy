package com.toyproject.www.VO;

import java.sql.Date;

public class VendorVO {
		// 판매처 번호
		private int vendor_seq;
		// 판매처 고유 코드
		private String vendor_code; //비즈니스 로직단에서 랜덤String으로 추가해줘야함
		// 판매처 상호
		private String vendor_name; // 사용자가 입력
		// 판매처 담당자 번호
		private String vendor_number; // user테이블에서 가져와야함
		// 판매 상품 타입
		private String vendor_type; // 사용자가 입력
		// 판매처 등록 날짜
		private Date regData;
		// 판매처 담당자 주소
		private String vendor_address; // user테이블에서 가져와야함
		// 판매처 담당자 이름
		private String vendor_username; // user테이블에서 가져와야함
		public int getVendor_seq() {
			return vendor_seq;
		}
		public void setVendor_seq(int vendor_seq) {
			this.vendor_seq = vendor_seq;
		}
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
		public String getVendor_address() {
			return vendor_address;
		}
		public void setVendor_address(String vendor_address) {
			this.vendor_address = vendor_address;
		}
		public String getVendor_username() {
			return vendor_username;
		}
		public void setVendor_username(String vendor_username) {
			this.vendor_username = vendor_username;
		}
		
		
	
	
}