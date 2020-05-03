<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@  taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@  taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--  $("form").serialize()
	  $.ajaxSetup({
  async: false
});
 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add.jsp' starting page</title>
  <script type="text/javascript" src="<%=path%>/jquery/jquery-1.8.2.js"></script>
  <script type="text/javascript" src="jquery/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="jquery/DateUtil.js"></script>
  <link rel="stylesheet" href="<%=path%>/css/css.css" type="text/css"></link>
  
  </head>
  
   <script type="text/javascript">
      //ajax动态追加房主
      $(function(){
    	  $.post(
    		 "getOlist.do",
    		 function(obj){
    			 for ( var i in obj) {
					$("#f").append("<input type='checkbox' name='oids' value='"+obj[i].owner_id+"' />"+obj[i].owner_name+"")
				}
    		 },"json"
    	  )
    	  
    	  
    	   var hid =${param.hid};
          //回显
         $.post(
        	"getOneById.do",
        	{hid:hid},
        	function(data){
        		$("[name=house_id]").val(data.h.house_id);
        		$("[name=house_address]").val(data.h.house_address);
        		$("[name=house_use]").val(data.h.house_use);
        		$("[name=house_area]").val(data.h.house_area);
        		$("#img").attr("src",data.h.house_pec); //图片进行赋值
        		
        		//复选框回显
        		for ( var i in data.oids) {
					$("[name=oids][value='"+data.oids[i]+"']").attr("checked",true);
				}
        	},"json"
         ) 
      })
      
      //提交
      function tj(){
    	  var ids=[];
          $("[name=oids]:checked").each(function(){
        	  ids.push($(this).val());
          })
    	  if(ids.length>0){
    		  //调用添加方法
    		 $("form").submit();
    	  }else{
    		  alert("请选择房主");
    	  }
    	  
      }
      
   
      
   
   </script>

  
  <body>
  <form:form action="update.do" method="post"  enctype="multipart/form-data" modelAttribute="house">
  	<form:input path="house_address"/>
  	<form:input path="house_use"/>
  	<form:input path="house_area"/>
  </form:form>
      <%-- <form action="update.do" method="post"  enctype="multipart/form-data">
         <input type="hidden" name="house_id" value="">
         <table>
           <tr>
             <td>地址</td>
             <td>
               <textarea  name="house_address">
               </textarea>
             </td>
           </tr>
        
           <tr>
             <td>用途</td>
             <td>
               <input   name="house_use">
             </td>
           </tr>
           <tr>
             <td>面积</td>
             <td>
               <input  name="house_area">
             </td>
           </tr>
           
            <tr>
             <td>房主</td>
             <td  id="f">
              
             </td>
           </tr>
           
            <tr>
             <td>证书</td>
             <td>
               <input type="file" name="file">
                <img alt="" src="" id="img" width="50px" height="50px">
                <!-- name属性值一定不能和对象中的基本属性一致 -->
             </td>
           </tr>
           
           <tr>
             <td colspan="10">
               <input type="button" value="提交"  onclick="tj()">
             </td>
           </tr>
         
         </table>
      </form> --%>
  </body>
</html>
