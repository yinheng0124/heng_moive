<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@  taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@  taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <script type="text/javascript" src="<%=path%>/jquery/jquery-1.8.2.js"></script>
  <script type="text/javascript" src="jquery/My97DatePicker/WdatePicker.js"></script>
   <script type="text/javascript" src="jquery/DateUtil.js"></script>
  <link rel="stylesheet" href="<%=path%>/css/css.css" type="text/css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

欢迎${loginu.user_name }登陆
<body>

    <form action="list.do" method="post" >
        房主:<input name="hname" value="${h.hname }">
     地址：<input name="house_address" value="${h.house_address }"> 
    <button>提交</button>   
       <a href="loginOut.do">注销</a>
        <table>
          <tr>
            <td>编号</td>
            <td>房主姓名</td>
            <td>地址</td>
            <td>用途</td>
            <td>面积</td>
            <td>操作  <a href="add.jsp">添加</a></td>
          </tr>
          <c:forEach items="${list }" var="h">
          	 <tr>
	            <td>${h.house_id}</td>
	            <td>${h.hname}</td>
	            <td>${h.house_address}</td>
	            <td>${h.house_use}</td>
	            <td>${h.house_area}</td>
	            <td>
	            	<a href="/toUpdate.do?id=${h.house_id}">修改</a> 
	            </td>
        	  </tr>
          </c:forEach>

        </table>
    
    </form>

</body>
</html>