<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'reg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="/examination/js/jquery.js"></script>
	<script type="text/javascript">
		$(function(){
			//页面初始化函数
			var init = function(){
				//获取验证码
				getCode();
				function getCode(){
					$.post("/examination/user/getCode.do",{},function(data){
						eval("data = " + data);
						
						$("#code").text(data.code);
					})
				}
				$("#code").click(function(e){
					getCode();
				});
				
				
				$("input[name='userName']").keyup(function(){
					var username = $(this).val();
					$.get("/examination/user/checkUserName.do",{'userName':username},function(data){
						eval("data = " + data);
						if(data.result=='success'){
							$("#userNameCheck").text("用户名可用！");
							$("#userNameCheck").attr("check","1");
						}else if(data.result=='error'){
							$("#userNameCheck").text("用户名不可用！");
							$("#userNameCheck").attr("check","0");
						}				
					})
				});
			}
			init();
			
			//提交验证：
			$("form").submit(function(){
				
				var username = $("input[name='userName']").val();
				
				if(username.trim()==""){
					$("#userNameCheck").text("用户名不可为空！");
					return false;
				}else{
					if(!/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/.test(username.trim())){
						$("#userNameCheck").text("用户名格式错误！");
						return false;
					}else{
						$("#userNameCheck").text("");
					}
				}
				
				if($("#userNameCheck").attr("check")=="0"){
					$("#userNameCheck").text("用户名已存在！");
					return false;
				}else{
					$("#userNameCheck").text("");
				}
				
				var password = $("input[name='passWord']").val();
				
				if(password.trim()==""){
					$("#passWordCheck").text("密码不可为空！");
					return false;
				}else{
					if(!/^[a-zA-Z][a-zA-Z0-9]{4,15}$/.test(username.trim())){
						$("#passWordCheck").text("密码格式错误！");
						return false;
					}else{
						$("#passWordCheck").text("");
					}
				}
				
				var rePassword = $("#rePassWord").val();
				if(password!=rePassword){
					$("#rePassWordCheck").text("两次密码输入不一致！");
					return false;
				}else{
					$("#rePassWordCheck").text("");
				}
				
				//phone
				var phone = $("input[name='phone']").val();
				if(phone.trim()!=""){
					var flag = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/.test(phone.trim());
					if(!flag){
						$("#phoneCheck").text("手机号码格式错误！");
						return false;
					}else{
						$("#phoneCheck").text("");
					}
				}
				
				//idcode
				var idCard = $("input[name='idCard']").val();
				if(idCard.trim()!=""){
					var flag = /^\d{15}|\d{18}$/.test(idCard.trim());
					if(!flag){
						$("#idCardCheck").text("身份证号码格式错误！");
						return false;
					}else{
						$("#idCardCheck").text("");
					}
				}
				
				
				var userTypeId = $("select[name='userTypeId'] option:selected").val();
				if(userTypeId==-1){
					$("#userTypeIdCheck").text("请选择用户类型！");
					return false;
				}else{
					$("#userTypeIdCheck").text("");
				}
				
				
				var code = $("input[name='code']").val();
				
				if(code.trim()==""){
					$("#codeCheck").text("验证码不可为空！");
					return false;
				}else{
					$("#codeCheck").text("");
				}
				
			
				return true;
			})
		})
	</script>
  </head>
  
  <body>
    <form action="/examination/user/regUser.do" method="post">
    	<table>
    		<tr>
    			<td>用户名：</td>
    			<td><input type="text" name="userName" value="${username}"/>
	    			<span id="userNameCheck" check="0">
	    				${unMsg }
	    			</span>
    			</td>
    		</tr>
    		<tr>
    			<td colspan="2">字母开头，允许5-16字节，允许字母数字下划线</td>
    		</tr>
    		<tr>
    			<td>密码：</td>
    			<td><input type="password" name="passWord"/><span id="passWordCheck">${pwMsg }</span></td>
    		</tr>
    		<tr>
    			<td colspan="2">字母开头，允许5-16字节，允许字母数字</td>
    		</tr>
    		<tr>
    			<td>重复 密码：</td>
    			<td><input type="password" id="rePassWord"/><span id="rePassWordCheck"></span></td>
    		</tr>
    		<tr>
    			<td>性别：</td>
    			<td>
    				<select name="sex">
    					<option value="-1">--请选择--</option>
    					<option value="1">男</option>
    					<option value="0">女</option>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<td>年龄：</td>
    			<td>
    				<input type="number" name="age"/>
    			</td>
    		</tr>
    		<tr>
    			<td>电话：</td>
    			<td><input type="text" name="phone" value="${phone}"/>
    				<span id="phoneCheck"></span>
    			</td>
    		</tr>
    		<tr>
    			<td>真实姓名：</td>
    			<td>
    				<input type="text" name="realName" value="${realName}"/>
    			</td>
    		</tr>
    		<tr>
    			<td>身份证号：</td>
    			<td><input type="text" name="idCard" value="${idCard}"/>
    				<span id="idCardCheck"></span>
    			</td>
    		</tr>
    		<tr>
    			<td>用户类型：</td>
    			<td>
    				<select name="userTypeId">
    					<option value="-1">--请选择--</option>
    					<c:forEach items="${userTypes}" var="ut">
	    					<option value="${ut.id }">${ut.name }</option>
    					</c:forEach>
    				</select>
    				<span id="userTypeIdCheck">${userTypeMsg }</span>
    			</td>
    		</tr>
    		<tr>
    			<td>验证码：</td>
    			<td><input type="text" name="code"/><span id="code" 
    				style="border: 1px solid #000000;cursor: pointer;"></span>
    				<span id="codeCheck">${codeMsg }</span>	
    			</td>
    		</tr>
    		<tr>
    			<td colspan="2">
    				<input type="submit" value="提交"/>
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
