package com.toyproject.www.VO;

import java.sql.Date;

public class VendorVO {
	// �Ǹ�ó ���� ��ȣ
		private int vendor_seq;
		// �Ǹ�ó ���� �ڵ�
		private String vendor_code;
		// �Ǹ�ó ��ȣ
		private String vendor_name;
		// �Ǹ� ����� ��ȣ
		private String vendor_number;
		// �Ǹ�ó ��ǰ Ÿ��
		private String vendor_type;
		// ��ϳ�¥
		private Date regData;
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
	
	
	
}