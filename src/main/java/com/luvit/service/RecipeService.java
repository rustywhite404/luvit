package com.luvit.service;

import java.util.List;

import com.luvit.domain.RecipeVO;

public interface RecipeService {
	
	// 게시판 글쓰기
    void create(RecipeVO vo) throws Exception;
	
	// 게시판 글목록 보기
    List<RecipeVO> listAll() throws Exception;
	
	// 게시판 글 상세보기
    RecipeVO read(int r_bno) throws Exception;
	
	// 게시판 글 상세보기(tag만 읽어오는 용도, 카운트 처리 안 하려고 따로 뺌)
    RecipeVO readTag(int r_bno) throws Exception;
	
	// 게시판 글 삭제
    void delete(int r_bno) throws Exception;
	
	// 게시판 글 수정
    void update(RecipeVO vo) throws Exception;
	
	// 게시물 총 갯수
    int count() throws Exception;
	
	// 게시물 총 갯수 + 검색 적용
    int searchCount(String searchType, String keyword) throws Exception;
	
	// 게시물 목록 + 페이징
    List<RecipeVO> listPage(int displayPost, int postNum) throws Exception;
	
	// 게시물 목록 + 페이징 + 검색
    List<RecipeVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	// 선택한 태그 게시물 총 갯수
    int tagCount(String tag) throws Exception;
	
	// 선택한 태그에 해당하는 글목록 조회 + 페이징
    List<RecipeVO> tagResult(String tag, int displayPost, int postNum) throws Exception;
	
	// 요청한 갯수의 게시물 조회수 순으로 조회
    List<RecipeVO> readRecipeAmount(int hopeAmount) throws Exception;
	
	// 컬럼 r_tag2 중 선택률이 가장 높은 태그 값 받아오기 
    String bestTag2() throws Exception;
	
	// 컬럼 r_tag3 중 선택률이 가장 높은 태그 값 받아오기 
    String bestTag3() throws Exception;
	
	// 컬럼 r_tag4 중 선택률이 가장 높은 태그 값 받아오기 
    String bestTag4() throws Exception;
    
    // ********** 마이페이지에서 필요한 기능 ***************
    
    // 해당 유저가 작성한 레시피 보기
    List<RecipeVO> myBoardList(String r_id) throws Exception;
	
    // 해당 유저가 작성한 글 모두보기
    List myBoardAll(String r_id, int displayPost, int postNum) throws Exception;
    
    // 해당 유저가 작성한 글 수 계산
    int myBoardAllCount(String r_id) throws Exception;
    
    
}
