package edu.iot.common.model;

import java.util.HashMap;
import java.util.Map;

import lombok.Data;

/** pagination */
@Data
public class Pagination {
	public static final int PER_PAGE = 10;
	public static final int PER_BLOCK = 10;

	private int total; // 전체 데이터 건수
	private int page; // 현재 페이지
	private int start; // 현재 페이지 시작 번호
	private int end; // 현재 페이지 끝 번호

	private int totalPage; // 전체 페이지 수
	private int startPage; // 현재 페이니 블럭에서 시작 페이지 번호
	private int endPage; // 현제 페이지 블럭에서 마지막 페이지 번호

	private int currentBlock; // 현재페이지 블럭
	private int totalBlock; // 전체 페이지 블럭 수
	private int prevBlockPage; // 이전 페이지 블록 시작 페이지
	private int nextBlockPage; // 다음 페이지 블록 시작 페이지

	
	
	public Pagination() {}
	
	public Pagination(int currentPage, int total) {
		page = currentPage;
		this.total = total;
		
		start = (page-1)*PER_PAGE+1;
		end = start + PER_PAGE -1;
		totalPage = (int)Math.ceil((float)total/PER_PAGE);
		
		currentBlock = (int) Math.ceil((float)currentPage/PER_BLOCK);
		totalBlock = (int) Math.ceil((float)totalPage/PER_BLOCK);
		
		startPage = (currentBlock-1)*PER_BLOCK +1; // 블록 시작 페이지
		endPage = startPage + PER_BLOCK -1; 		// 블록 마지막 페이지
		
		if(endPage > totalPage) endPage = totalPage;
		
		
//		prevBlockPage = startPage-1;
//		nextBlockPage = endPage+1;
		prevBlockPage = page - PER_BLOCK;
		nextBlockPage = page + PER_BLOCK;
	}
	
	public Map<String, Object> getPageMap() {
		Map<String, Object> pageMap = new HashMap<>();
		
		pageMap.put("start", start);
		pageMap.put("end", end);
		return pageMap;
	}
}
