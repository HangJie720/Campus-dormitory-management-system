package com.action;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.pager.PageBean;

import com.bean.*;
import com.dao.*;


public class DomitoryManager extends ActionSupport {

	//下面是Action内用于封装用户请求参数的属性
	private int pageSize = 10;//每页显示多少条记录
	private int currentPage;//当前页
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getRecordCount() {
		return recordCount;
	}
	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

	private int pageCount;//总页数
	private int recordCount;//总记录数
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	private List<DomitoryBean> list;
	public List<DomitoryBean> getList() {
		return list;
	}
	public void setList(List<DomitoryBean> list) {
		this.list = list;
	}
	private String SearchRow;
	private String SearchKey;
	public String getSearchRow() {
		return SearchRow;
	}
	public void setSearchRow(String searchRow) {
		SearchRow = searchRow;
	}
	public String getSearchKey() {
		return SearchKey;
	}
	public void setSearchKey(String searchKey) {
		SearchKey = searchKey;
	}
	private List<BuildingBean> buildinglist;
	public List<BuildingBean> getBuildinglist() {
		return buildinglist;
	}
	public void setBuildinglist(List<BuildingBean> buildinglist) {
		this.buildinglist = buildinglist;
	}
	private String Domitory_BuildingID;
	public String getDomitory_BuildingID() {
		return Domitory_BuildingID;
	}
	public void setDomitory_BuildingID(String domitoryBuildingID) {
		Domitory_BuildingID = domitoryBuildingID;
	}
	private List<DomitoryBean> recordlist;
	public List<DomitoryBean> getRecordlist() {
		return recordlist;
	}
	public void setRecordlist(List<DomitoryBean> recordlist) {
		this.recordlist = recordlist;
	}
	//处理用户请求的execute方法
	public String execute() throws Exception {
		
		//解决乱码，用于页面输出
		HttpServletResponse response=null;
		response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		//创建session对象
		HttpSession session = ServletActionContext.getRequest().getSession();
		//验证是否正常登录
		if(session.getAttribute("id")==null){
			out.print("<script language='javascript'>alert('请重新登录！');window.location='Login.jsp';</script>");
			out.flush();out.close();return null;
		}
		//查询条件
		String strWhere="1=1";
		if(!(isInvalid(SearchKey)))
		{
			
			strWhere+=" and "+SearchRow+" like'"+"%"+SearchKey+"%"+"'";
		}
		if(!(isInvalid(Domitory_BuildingID)))
		{
			strWhere+=" and Domitory_BuildingID='"+Domitory_BuildingID+"'";
		}
		if (currentPage == 0) {
			currentPage =1;
		}
		
		//查询所有楼宇
		buildinglist=new BuildingDao().GetList("","Building_Name");
		//查询所有宿舍
		list=new DomitoryDao().GetList(strWhere,"Domitory_BuildingID");
	    recordCount = list.size();
	    int tp = recordCount/pageSize;
		pageCount = recordCount % pageSize ==0 ? tp : tp+1;
		recordlist = new DomitoryDao().getList1(strWhere,"Domitory_BuildingID",currentPage,pageSize);
		
		return SUCCESS;
		
	}
	
	//判断是否空值
	private boolean isInvalid(String value) {
		return (value == null || value.length() == 0);
	}
	
	//测试
	public static void main(String[] args) {
		System.out.println();
	}
	
}
