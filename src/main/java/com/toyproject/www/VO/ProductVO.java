package com.toyproject.www.VO;

import java.sql.Date;

public class ProductVO {
	// ��ǰ ��ȣ
		private int product_seq;
		// �Ǹ�ó ���� ��ȣ
		private int vendor_seq;
		// �Ǹ�ó ���� �ڵ�
		private String vendor_code;
		// ��ǰ ���� �ڵ� 
		private String product_code;
		// �Ǹ�ó ��ȣ
		private String vendor_name;
		// ��ǰ Ÿ��
		private String product_type;
		// ��ǰ ����
		private int product_price;
		// ��ǰ ����
		private int product_weight;
		// ��ǰ ���� ����
		private String product_process;
		// ��ǰ ����
		private int product_quantity;
		// ��ǰ ��� ��¥
		private Date regData;
		public int getProduct_seq() {
			return product_seq;
		}
		public void setProduct_seq(int product_seq) {
			this.product_seq = product_seq;
		}
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
		public String getProduct_code() {
			return product_code;
		}
		public void setProduct_code(String product_code) {
			this.product_code = product_code;
		}
		public String getVendor_name() {
			return vendor_name;
		}
		public void setVendor_name(String vendor_name) {
			this.vendor_name = vendor_name;
		}
		public String getProduct_type() {
			return product_type;
		}
		public void setProduct_type(String product_type) {
			this.product_type = product_type;
		}
		public int getProduct_price() {
			return product_price;
		}
		public void setProduct_price(int product_price) {
			this.product_price = product_price;
		}
		public int getProduct_weight() {
			return product_weight;
		}
		public void setProduct_weight(int product_weight) {
			this.product_weight = product_weight;
		}
		public String getProduct_process() {
			return product_process;
		}
		public void setProduct_process(String product_process) {
			this.product_process = product_process;
		}
		public int getProduct_quantity() {
			return product_quantity;
		}
		public void setProduct_quantity(int product_quantity) {
			this.product_quantity = product_quantity;
		}
		public Date getRegData() {
			return regData;
		}
		public void setRegData(Date regData) {
			this.regData = regData;
		}
		
	
	
	
	
}
