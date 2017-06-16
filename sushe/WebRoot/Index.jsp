<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>校园宿舍管理系统</title>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="Style/Style.css" rel="stylesheet" type="text/css" />
</head>
   
<body >
<center>
  <table width="900" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="60"  style="color:#DA70D6; font-size:30px; font-weight:bolder; padding-left:50px;" background="Images/LoginBg.jpg">校园宿舍管理系统</td>
    </tr>
    <tr>
   <%if(session.getAttribute("type").toString().equals("1")){%> 
   	 <td height="30" background="Images/MenuBg.jpg" align="right" ><font color="4A4AFF" size="3px" face="楷体">系统管理员：${adminname}&nbsp;</font></td>
    
    <%}%>
     <%if(session.getAttribute("type").toString().equals("2")){%> 
   	 <td height="30" background="Images/MenuBg.jpg" align="right" ><font color="4A4AFF" size="3px" face="楷体">楼宇管理员：${teachername}&nbsp;</font></td>
    
    <%}%>
     <%if(session.getAttribute("type").toString().equals("3")){%> 
   	 <td height="30" background="Images/MenuBg.jpg" align="right" ><font color="4A4AFF" size="3px" face="楷体">欢迎您：${studentname}同学&nbsp;</font></td>
    
    <%}%>
    </tr>
    <tr>
      <td height="500" align="center" valign="top"><table width="900" border="0" cellspacing="0" cellpadding="0">
      
        <tr>
          <td width="191" height="500" align="center" valign="top" background="Images/leftbg.jpg">
          <%@ include file="Left.jsp"%>
          </td>
           <td align="right"  background="Images/body.jpg" ><h1><font color="FF00FF" size="5px" face="楷体"><marquee direction=right behavior="ALTERNATE">团队：JDG TEAM</marquee>
          <font color="FF00FF" size="5px" face="楷体"><marquee direction=left>欢迎使用校园宿舍管理系统  Jack 版权所有</marquee></font>
          <font color="FF00FF" size="5px" face="楷体"><marquee direction=down behavior="ALTERNATE">咨询 QQ：1339327861 Tel:18205253767</marquee></font></td>
          <td><embed src="music/Brian Tyler - Furious 7.mp3" width="32" height="32" hidden="true" loop="true"></embed></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="35" background="Images/bootBg.jpg">&nbsp;</td>
    </tr>
  </table>

</center>
</body>
</html>
