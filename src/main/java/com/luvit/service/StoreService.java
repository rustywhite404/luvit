package com.luvit.service;

import java.util.List;

import com.luvit.domain.CartVO;
import com.luvit.domain.OrderVO;
import com.luvit.domain.StoreVO;

public interface StoreService {

	
	// 상품 등록
    void insertProduct(StoreVO vo) throws Exception;
	
	
	/*
	 * // 상품 리스트 public List storeList(int displayPost, int postNum) throws
	 * Exception;
	 */
	
	// 상품 리스트 + 페이징
    List listPage(int displayPost, int postNum, String keyword, String cate) throws Exception;
	
	// 상품 조회
    StoreVO product(int s_pno) throws Exception;
	
	// 상품 수정
    void modify(StoreVO vo) throws Exception;
	
	// 상품 삭제
    void delete(int s_pno) throws Exception;
	
	// 총 갯수
    int count() throws Exception;
	
	
	// 주문
    void payment(OrderVO vo) throws Exception;
	

	/*
	 * // 카트 목록 public List<OrderVO> payment(String o_oid) throws Exception;
	 */
		
		
}