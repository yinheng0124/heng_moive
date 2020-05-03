<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--  $("form").serialize()
	  $.ajaxSetup({
  async: false
});
 -->
<html>
<head>
  <script type="text/javascript" src="<%=path%>/jquery/jquery-1.8.2.js"></script>
  <link rel="stylesheet" href="<%=path%>/css/css.css" type="text/css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	 <tr>
            <td colspan="10">
              <button  name="pageNum" value="1">首页</button>
              <button  name="pageNum" value="${pg.prePage==0?1:pg.prePage }">上一页</button>
              <button  name="pageNum" value="${pg.nextPage==0?pg.pages:pg.nextPage }">下一页</button>
              <button  name="pageNum" value="${pg.pages }">尾页</button>
   	     	&nbsp;&nbsp;  当前页：${pg.pageNum }/${pg.pages } &nbsp;&nbsp;&nbsp;&nbsp;    总条数：${pg.total }
            </td>
         </tr>

</body>
</html>