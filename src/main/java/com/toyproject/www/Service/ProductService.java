package com.toyproject.www.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.toyproject.www.VO.ProductVO;

@Service
public interface ProductService {
	public List<ProductVO> vendorProductList(String vendor_code);
}
