package com.action;

import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

import com.bean.*;
import com.dao.*;


public class AdminLogList extends ActionSupport {

	//下面是Action内用于封装用户请求参数的属性
	private int pageSize = 10;//每页显示多少条记录
	private int currentPage;//当前页
	private int pageCount;//总页数
	private int recordCount;//总记录数
	private List<LogBean> recordlist;
	
	
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
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
	public List<LogBean> getRecordlist() {
		return recordlist;
	}
	public void setRecordlist(List<LogBean> recordlist) {
		this.recordlist = recordlist;
	}

	private List<LogBean> list;
	public List<LogBean> getList() {
		return list;
	}
	public void setList(List<LogBean> list) {
		this.list = list;
	}
	
	private String Building_ID;
	private String Domitory_ID;
	private String Student_Username;
	
	public String getBuilding_ID() {
		return Building_ID;
	}
	public void setBuilding_ID(String buildingID) {
		Building_ID = buildingID;
	}
	public String getDomitory_ID() {
		return Domitory_ID;
	}
	public void setDomitory_ID(String domitoryID) {
		Domitory_ID = domitoryID;
	}
	public String getStudent_Username() {
		return Student_Username;
	}
	public void setStudent_Username(String studentUsername) {
		Student_Username = studentUsername;
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

		if (currentPage == 0) {
			currentPage =1;
		}
		//查询条件
		String strWhere="Student_State='入住'";
		if(!(isInvalid(Building_ID)))
		{
			strWhere+=" and Building_ID='"+Building_ID+"'";
		}
		if(!(isInvalid(Domitory_ID)))
		{
			strWhere+=" and Domitory_ID='"+Domitory_ID+"'";
		}
		if(!(isInvalid(Student_Username)))
		{
			strWhere+=" and Student_Username='"+Student_Username+"'";
		}
		//查询所有
		list=new LogDao().GetList(strWhere,"Log_Date desc");
		recordCount = list.size();
	    int tp = recordCount/pageSize;
		pageCount = recordCount % pageSize ==0 ? tp : tp+1;
		recordlist = new LogDao().getList3(strWhere,"Log_Date desc",currentPage,pageSize);
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
