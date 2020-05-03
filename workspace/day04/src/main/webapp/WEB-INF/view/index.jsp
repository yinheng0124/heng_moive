<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@  taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  <link rel="stylesheet" href="css/css.css" type="text/css"></link>
  <script type="text/javascript" src="jquery/jquery-1.8.2.js"></script>
  
  </head>
    
    ${erro }
  <body>
     <form:form  action="login.do"  method="post" modelAttribute="u">
   		<table>
   			<tr>
   				<td>
   					姓名: <form:input path="user_name"  /> <form:errors path="user_name"></form:errors>
   				</td>
   			</tr>
   			<tr>
   				<td>
			   		密码:<form:input path="user_password" /><form:errors path="user_password"></form:errors>
   				</td>
   			</tr>
   			<tr>
   				<td colspan="10">
		   			 <input type="submit" value="登录">   		
   				</td>
   			</tr>
   		</table>
   </form:form>
  </body>
</html>
