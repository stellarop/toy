package com.toyproject.www.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toyproject.www.DAO.ProductDAO;
import com.toyproject.www.Service.ProductService;
import com.toyproject.www.VO.ProductVO;

@Service
public class ProductImpl implements ProductService{

	@Autowired
	ProductDAO productDAO;
	
	@Override
	public List<ProductVO> vendorProductList(String vendor_code) {
		return productDAO.vendorProductList(vendor_code);
	}


}
