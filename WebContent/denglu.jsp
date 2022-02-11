<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录界面</title>
<style>
  body{ 
	 background-image:url('duomeiti/bg2.png');
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
	if(leixing4==2)
    {
		alert("请选中类型中的一项，否则无法进行登录！");
    }
  <!--验证密码是否为空，如果为空则跳出对话框提示必须填写密码-->
  var mima1=document.getElementById("upwd").value;
  if(mima1.length>=1)
  {
	  zhuce++;
  }
  else
  {
	  alert("密码为必选项，登录时请务必填写密码！")
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
  
  
  if(document.getElementById("xieyi").checked)
  {
	  zhuce++;
	  
  }
  else
  {
	  alert("请您勾选用户协议，否则无法进行账号登录！");
	  
  }
  
  
  <!--假如你真的把上述说有的坑爹玩意全部满足了，那么恭喜你成功注册了我们的   利滚利滚利滚利滚利滚利滚利滚利（注意是一共滚了七次）项目的账号！-->
  

  
  if(zhuce==4)
  {
	
	 alert("正在验证登录！")
	
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
	  background-color:#FFF;
	  }

</style>

<body onLoad="yz()">
<div><h1 align="center" style="color:#FF7174">登录账户</h1></div>
<div class="zhuce">
<form action="cc?flag=denglu" method="post">

<table width="495" border="1" id="bg">
  <tr>
    <td width="485">
    <a  href="用户界面.jsp"><img src="duomeiti/返回主菜单.png"></a>类型  
        <label>
          <input type="radio" name="ulx1" value="用户" id="RadioGroup1_0">
          用户</label>
        <label>
          <input type="radio" name="ulx1" value="管理员" id="RadioGroup1_1">
          
          管理员</label>
        </td>
  </tr>
  <tr>
    <td > 用户名<input  type="text" id="uname"  name="uname1" >
    <div id="yzm2"><span  id="yzzha"></span></div></td>
  </tr>  <tr>
    <td>密码
      <label for="textfield"></label>
      <input type="password" name="upwd1" id="upwd" ></td>
  </tr>
  <tr>
    
  </tr>
  <tr>
    <td>验证码
      <label for="textfield3"></label>
      <input name="textfield" type="text" id="yanzhengma" size="8" > <div id="yzm"><span onClick="yz() " id="huan">陈乐斌</span></div> </td>
  </tr>
  <tr>
    <td height="39"><input type="radio" name="radio" id="xieyi" value="xieyi">
      <label for="xieyi">
      <h6 style=" display:inline"> 我已阅读协议</h6> <a href="用户协议.jsp"><h6 style=" display:inline;"> 用户协议</h6></a>
      </label> </td>
  </tr>
  <tr>
  
    <td style="text-align:center;"><a href="注册.jsp">自助注册</a><input type="submit" name="tijiao" id="tijiao" value="登录" style="border-radius:30%;  background-color:#4DA6FF; " onClick="tj()"></td>
  </tr>
</table>
</form>
</div>
</body>
</html>
