package com.toyproject.www.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.toyproject.www.VO.ProductVO;

@Repository
public class ProductDAO {
	
	@Autowired
	SqlSessionTemplate sqlsessiontemplate;
	
	public List<ProductVO> vendorProductList(String vendor_code){
		return sqlsessiontemplate.selectList("productDAO.vendorProductList", vendor_code);
	}
}
