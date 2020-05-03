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
    			 console.log(obj);
    			 for ( var i in obj) {
					$("#f").append("<input type='checkbox' name='oids' value='"+obj[i].owner_id+"' />"+obj[i].owner_name+"")
				}
    		 }
    	  )
      })
      
      function tj(){
    	  var ids=[];
          $("[name=oids]:checked").each(function(){ //获得复选框选中的值  [name=oids]通过name属性找到复选框  :checked复选框被选中状态
        	  ids.push($(this).val());
          })
    	  
    	  console.log(ids);
    	  if(ids.length>0){
    		  //调用添加方法
    		 $("form").submit();
    	  }else{
    		  alert("请选择房主");
    	  }
    	  
      }
      
   
   </script>

  
  <body>
      <form action="add.do" method="post"  enctype="multipart/form-data">
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
               <input type="file" name="file"> <!-- name属性值一定不能和对象中的基本属性一致 -->
             </td>
           </tr>
           
           <tr>
             <td colspan="10">
               <input type="button" value="提交"  onclick="tj()">
             </td>
           </tr>
         
         </table>
      </form>
  </body>
</html>
