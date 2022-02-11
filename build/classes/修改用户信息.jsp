<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>*修改用户信息</title>
<style>
  body{ 
	 background-image:url(duomeiti/bg3.png);
	 background-size:cover;
	 
	 }
  .zhuce{	 
     position:relative;
	 top:100px;
	 left:300px;
	 text-align:center;
	 }
	 
</style>
</head>

<!--
  本网页仍存在的问题：
    1、账号和邮箱的触发条件不是在对话框回车则立马弹出验证信息，而是采用点击右侧验证按钮进行触发，并不符合题意。
    2、代码太长，并不精简，我还可以尝试继续使用更精简的代码完成。
-->

<script language="javascript">
var yzm2="";

function tiaozhuan()
{
	 
	}


function yz()
{
    <!--得到随机验证码-->
	s=new Array("S","D","3","9","0","2","a","x","7","6","1","4","5","8","Z","K","k","F","Y","y");
	
    var yzm1="";
    for(var j=0;j<4;j++)
    {
	yzm1=s[Math.floor(Math.random()*100%20)]+yzm1;
	}
	yzm2=yzm1;
	<!--将得到的随机验证码替换到HTML中的文本里-->
	document.getElementById("huan").innerHTML=yzm1;
	
	}
	
function tj()
{
	
	<!--验证是否满足所有的选项满足则输出注册成功页面！-->
	var zhuce=0;
	
	
	<!--验证是否勾选了类型中的任何一项，如果都没有勾选的话则弹出对话框！-->
	var leixing3=document.getElementsByName("ulx1");
  var leixing4=0;
  for(var i=0;i<leixing3.length;i++)
	{
	if(leixing3.item(i).checked)
	{
	   zhuce++;	
    }
	else 
	var leixing4=leixing4+1;
	}
	if(leixing4==3)
    {
		alert("请选中类型中的一项，否则无法进行用户信息修改！");
    }
  <!--验证密码是否为空，如果为空则跳出对话框提示必须填写密码-->
  var mima1=document.getElementById("upwd").value;
  if(mima1.length>=1)
  {
	  zhuce++;
  }
  else
  {
	  alert("密码为必选项，注册时请务必填写密码！")
  }
	
	  
  <!--验证验证码是否输入正确了-->
  var yanzheng1=document.getElementById("yanzhengma").value;
  if(yanzheng1==yzm2)
  {
	  zhuce++;
  }
  else
  {
	  alert("您输入的验证码错误请重新输入！");
	  yz();
  }
  
  
  <!--验证是否勾选了用户协议，没有勾选的话则弹出对话框！-->
  
  
  
  
  <!--假如你真的把上述说有的坑爹玩意全部满足了，那么恭喜你成功注册了我们的   利滚利滚利滚利滚利滚利滚利滚利（注意是一共滚了七次）项目的账号！-->
  

  if(zhuce==3)
  {
	  alert("恭喜你成功修改了**银行的银行账户！");
	  tiaozhuan();
  }
  
}

</script>
<style> 
  #yzm{
	  background-color:#9FC;
	  height:20px;
	  width:70px;
	  display:inline;
	  }
  #yzm2{
	  background-color:#9FC;
	  display:inline;
	  }
  #bg{
	  background-color:#00C1C1;
	  }

</style>

<body onLoad="yz()">
<div><h1 align="center" style="color:#3F70A0">*修改用户信息</h1></div>
<div class="zhuce">
<form action="cc?flag=xgyh" method="post">

<table width="495" border="1" id="bg">

<tr>
    <td > <a  href="主页.jsp"><img src="duomeiti/返回主菜单.png"></a>需修改的用户id
      <input  type="text" id="uid"  name="uid1" size="8" >
  </td>
  </tr>
  
  <tr>
    <td>
      <h5 style="text-align:center ;color:#E3171D">请输入修改后用户信息:</h5>
    
    
    </td>
  </tr>

  <tr>
    <td >用户名<input  type="text" id="uname"  name="uname1" >
    <div id="yzm2"><span  id="yzzha"></span></div></td>
  </tr> 
   <tr>
    <td>密码
      <label for="textfield"></label>
      <input type="text" name="upwd1" id="upwd" ></td>
  </tr>

  <tr>
    <td>身份证号
      <label for="textfield"></label>
      <input type="text" name="sfzh1" id="sfzh" ></td>
  </tr>

  <tr>
    <td>
      性别:
      <label>
        <input type="radio" name="xb1" value="男" id="xb">男
      </label>
      <label>
        <input type="radio" name="xb1" value="女" id="xb">女
      </label>
    </td>
  </tr>

  <tr>
    <td>邮箱
      <label for="textfield2" ></label>
      <input type="text" name="yx1" id="yx"  >
      <div id="yzm2" ><span id="yz@" ></span></div></td>
  </tr>
  
  <tr>
    <td>验证码
      <label for="textfield3"></label>
      <input name="textfield" type="text" id="yanzhengma" size="8" > <div id="yzm"><span onClick="yz() " id="huan">陈乐斌</span></div> </td>
  </tr>
  
  <tr>
    <td style="text-align:center;"><input type="submit" name="tijiao" id="tijiao" value="确定" style=" border-radius:30%; background-color:#4DA6FF; " onClick="tj()"></td>
  </tr>
</table>
</form>
</div>
</body>
</html>
