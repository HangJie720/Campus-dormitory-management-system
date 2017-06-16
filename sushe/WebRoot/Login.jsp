<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <base href="<%=basePath%>"> 
  <title>校园宿舍管理系统</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="Style/Style.css" rel="stylesheet" type="text/css" />
</head>
<script language="JavaScript">

function mycheck(){
   if(isNull(form1.Type.value)){  
   alert("请选择身份！"); 
   return false;
   }
   if(isNull(form1.Username.value)){  
   alert("请输入用户名！"); 
   return false;
   }
   if(isNull(form1.Password.value)){
   alert("请输入密码！");
   return false;
   }
      
}

function isNull(str){
if ( str == "" ) return true;
var regu = "^[ ]+$";
var re = new RegExp(regu);
return re.test(str);
}

</script>
<body background="Images/aa.jpg">
<center>
  <br><br><br><br><br>
  <table width="684" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="430px" align="center" valign="top" >
      <table width="350" height="201" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="72" align="left"><h3><font color="FF00FF" size="5px" face="楷体">校园宿舍管理系统</font></h3></td>
        </tr>
        <tr>
          <td align="center" valign="top">
             <form name="form1" action="GoLogin.action" method="post" onSubmit="return mycheck()">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="30" colspan="2" align="center" class="STYLE2"><span style="color:red;">
                    <%if(request.getAttribute("Msg")!=null){%>
                    <%=request.getAttribute("Msg")%>
                    <%}%>
                  </span></td>
                  </tr>
                <tr>
                  <td height="20px" align="right" class="STYLE2"><font color="8B00FF" size="3px" face="微软雅黑">身份：</font></td>
                  <td align="left"><select name="Type" id="Type" style="height:20px">
                    <option value="">请选择</option>
                    <option value="系统管理员">系统管理员</option>
                    <option value="楼宇管理员">楼宇管理员</option>
                    <option value="学生">学生</option>
                  </select></td>
                  </tr>
                <tr>
                  <td width="37%" height="30" align="right" class="STYLE2"><font color="8B00FF" size="3px" face="微软雅黑">用户名：</font></td>
                  <td width="300" align="left"><input type="text" name="Username" id="Username" class="text1" placeholder="/手机号/用户名/邮箱" 
  					style="color:#999999;width:140px;height:25px"/></td>
                  </tr>
                <tr>
                  <td height="30" align="right" class="STYLE2"><font color="8B00FF" size="3px" face="微软雅黑">密码：</font></td>
                  <td align="left"><input type="password" name="Password" id="Password" class="text1" placeholder="请输入密码" 
  					style="color:#999999;width:140px;height:25px" /></td>
                  </tr>
                <tr>
                    <td height="30" colspan="2" align="center" ><label>
                    <input type="submit" name="button" id="button" value="登录" style="width:90px;height:25px"/>
                  </label></td>
                  </tr>
              </table>
              </form>
          
          </td>
        </tr>
      </table></td>
    </tr>
  </table>


</center>
</body>
</html>
