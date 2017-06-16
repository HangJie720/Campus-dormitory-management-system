package com.pager;

import java.util.List;
/**
 * 分页中一页的信息
 * @author Jack
 *
 */
public class PageBean {
	
	private int currentPage;//当前页
	private int pageSize;//每页显示多少条
	
	private int pageCount;//总页数
	private int recordCount;//总记录数
	
	private int beginPageIndex;//页码列表的开始索引
	private int endPageIndex;//页码列表的结束索引	
	
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

	public int getBeginPageIndex() {
		return beginPageIndex;
	}

	public void setBeginPageIndex(int beginPageIndex) {
		this.beginPageIndex = beginPageIndex;
	}

	public int getEndPageIndex() {
		return endPageIndex;
	}

	public void setEndPageIndex(int endPageIndex) {
		this.endPageIndex = endPageIndex;
	}

	
}
