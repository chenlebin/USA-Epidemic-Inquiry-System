<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>实时疫情查询系统用户总人数</title>
<style>
td{ 
border:solid 4px}

table{
   width:400px;
}

table tr{
  height:60px;
}


table tr td{
   /*border:1px solid red;*/
}


table tr:nth-child(odd){

 background-color:#ABFAF5;
  }
  
table tr:nth-child(even){
  background-color:#D8D8D8;
}
	  
	body{ 
	 background-image:url(duomeiti/bg7.png);
	 background-size:cover;
	 
	 }
	 
	 .juzhong{
display:flex;
justify-content:center;
align-items:center;
 position:relative;
	 top:100px;
	 text-align:center;
}

.fanhui{ 
display:flex;
justify-content:center;
align-items:center;
position:relative;
	 top:180px;
}
}
</style>
</head>
<body>


<h1 align="center" style="color:#787878">实时疫情查询系统用户总人数</h1>
<div class="juzhong" >
<table>

<tr>
  <td>疫情查询系统用户总人数</td>
</tr>



<c:forEach items="${dbdata}" var="bd">
   <tr>
     <td>${bd.uidsum}</td>
   </tr>
</c:forEach>
</table>
</div>

<div class="fanhui">
<form>
<a href="主页.jsp">
<input type="button"  value="返回主页" style="  height:40px; width:120px;align:center; border-radius:30%; background-color:#97FDDC; ">
</a>
</form>

</div>
</body>
</html>