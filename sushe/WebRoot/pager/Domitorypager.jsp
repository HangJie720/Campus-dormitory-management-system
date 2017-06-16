<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript">
	function _go() {
		var currentPage = $("#pageCode").val();//获取文本框中的当前页码
		var SearchKey = $("#SearchKey").val();
		if(!/^[1-9]\d*$/.test(currentPage)) {//对当前页码进行整数校验
			alert('请输入正确的页码！');
			return;
		}
		if(currentPage > ${pageCount}) {//判断当前页码是否大于最大页
			alert('请输入正确的页码！');
			return;
		}
		location = "DomitoryManager.action?currentPage=" + currentPage+"&Domitory_BuildingID=${Domitory_BuildingID }&SearchRow=${SearchRow}&SearchKey=${SearchKey}";
	}
</script>


<div class="divBody">
  <div class="divContent">
    <%--上一页 --%>
<c:choose>
	<c:when test="${currentPage eq 1 }"><span class="spanBtnDisabled">首页</span></c:when>
	<c:otherwise><a href="DomitoryManager.action?currentPage=1&Domitory_BuildingID=${Domitory_BuildingID}&SearchRow=${SearchRow}&SearchKey=${SearchKey}" class="aBtn bold">首页</a></c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${currentPage eq 1 }"><span class="spanBtnDisabled">上一页</span></c:when>
	<c:otherwise><a href="DomitoryManager.action?currentPage=${currentPage-1}&Domitory_BuildingID=${Domitory_BuildingID}&SearchRow=${SearchRow}&SearchKey=${SearchKey}" class="aBtn bold">上一页</a></c:otherwise>
</c:choose>
        
        

<%--我们需要计算页码列表的开始和结束位置，即两个变量begin和end
计算它们需要通过当前页码！
1. 总页数不足6页--> begin=1, end=最大页
2. 通过公式设置begin和end，begin=当前页-1，end=当前页+3
3. 如果begin<1，那么让begin=1，end=6
4. 如果end>tp, 让begin=tp-5, end=tp
 --%>
 <c:choose>
 	<c:when test="${pageCount <= 6 }">
 		<c:set var="begin" value="1"/>
 		<c:set var="end" value="${pageCount }"/>
 	</c:when>
 	<c:otherwise>
 		<c:set var="begin" value="${currentPage-2 }"/>
 		<c:set var="end" value="${currentPage + 3}"/>
 		<c:if test="${begin < 1 }">
 		  <c:set var="begin" value="1"/>
 		  <c:set var="end" value="6"/>
 		</c:if>
 		<c:if test="${end > pageCount }">
 		  <c:set var="begin" value="${pageCount-5 }"/>
 		  <c:set var="end" value="${pageCount }"/>
 		</c:if> 		
 	</c:otherwise>
 </c:choose>
 
 <c:forEach begin="${begin }" end="${end }" var="i">
   <c:choose>
   	  <c:when test="${i eq currentPage }">
   	    <span class="spanBtnSelect">${i }</span>
   	  </c:when>
   	  <c:otherwise>
   	    <a href="DomitoryManager.action?currentPage=${i}&Domitory_BuildingID=${Domitory_BuildingID}&SearchRow=${SearchRow}&SearchKey=${SearchKey}" class="aBtn">${i }</a>
   	  </c:otherwise>
   </c:choose>
           
          	
 </c:forEach>
    <%-- 计算begin和end --%>
      <%-- 如果总页数<=6，那么显示所有页码，即begin=1 end=${pageCount} --%>
        <%-- 设置begin=当前页码-2，end=当前页码+3 --%>
          <%-- 如果begin<1，那么让begin=1 end=6 --%>
          <%-- 如果end>最大页，那么begin=最大页-5 end=最大页 --%>


    
    <%-- 显示点点点 --%>
    <c:if test="${end < pageCount }">
      <span class="spanApostrophe">...</span>
    </c:if> 

    
     <%--下一页 --%>
 
<c:choose>
	<c:when test="${currentPage eq pageCount }"><span class="spanBtnDisabled">下一页</span></c:when>
	<c:otherwise><a href="DomitoryManager.action?currentPage=${currentPage+1}&Domitory_BuildingID=${Domitory_BuildingID}&SearchRow=${SearchRow}&SearchKey=${SearchKey}" class="aBtn bold">下一页</a></c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${currentPage eq pageCount }"><span class="spanBtnDisabled">尾页</span></c:when>
	<c:otherwise><a href="DomitoryManager.action?currentPage=${pageCount}&Domitory_BuildingID=${Domitory_BuildingID}&SearchRow=${SearchRow}&SearchKey=${SearchKey}" class="aBtn bold">尾页</a></c:otherwise>
</c:choose>      
        
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    <%-- 共N页 到M页 --%>
    <s:iterator id="aa" value="recordCount">
    <span>共${recordCount }条记录</span>
    </s:iterator>
    
    <s:iterator id ="aa" value="pageCount">
    <span>共${pageCount }页</span>
    </s:iterator>
    
    
    <span>到</span>
    <input type="text" class="inputPageCode" id="pageCode" value="${currentPage }"/>
    <span>页</span>
    <a href="javascript:_go();" class="aSubmit" >确定</a>

  </div>
</div>