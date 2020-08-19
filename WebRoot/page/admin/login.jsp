<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>考试系统后台</title>
		<style type="text/css">
body {
	background-color: #393d49;
}

body,td,th {
	font-size: 14px;
	color: aliceblue;
	font-family: "Helvetica Neue", Helvetica, "PingFang SC",;
}
</style>
		<link href="/examination/page/admin/css/login.css" rel="stylesheet"
			type="text/css" />
		<link rel="stylesheet"
			href="/examination/page/admin/plugins/layui/css/layui.css"
			media="all" />
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
		}
		init();
		
		//提交验证：
		/*$("form").submit(function(){
			
			var username = $("input[name='userName']").val();
			
			if(username.trim()==""){
				$("#msg").text("用户名不可为空！");
				return false;
			}
			
			var password = $("input[name='passWord']").val();
			
			if(password.trim()==""){
				$("#msg").text("密码不可为空！");
				return false;
			}
			
			var code = $("input[name='code']").val();
			
			if(code.trim()==""){
				$("#msg").text("验证码不可为空！");
				return false;
			}
			
		
			return true;
		})*/
	})
</script>
	</head>

	<body>
		<div id="box">
			<p>
				后台登录
			</p>
			<div class="beg-login-main">
				<form action="/examination/user/login.do" class="layui-form" method="post">
					<input name="__RequestVerificationToken" type="hidden"
						value="fkfh8D89BFqTdrE2iiSdG_L781RSRtdWOH411poVUWhxzA5MzI8es07g6KPYQh9Log-xf84pIR2RIAEkOokZL3Ee3UKmX0Jc8bW8jOdhqo81" />
					<div class="layui-form-item">
						<label class="beg-login-icon">
							<i class="layui-icon">&#xe612;</i>
						</label>
						<input type="text" name="userName" lay-verify="userName"
							autocomplete="off" placeholder="这里输入登录名" class="layui-input">
					</div>
					<div class="layui-form-item">
						<label class="beg-login-icon">
							<i class="layui-icon">&#xe642;</i>
						</label>
						<input type="password" name="passWord" lay-verify="password"
							autocomplete="off" placeholder="这里输入密码" class="layui-input">


						<label class="beg-login-icon1">
							<i class="layui-icon">&#xe642;</i>
						</label>
						<input type="text" name="code" class="vcode" placeholder="请输入验证码" />
						<div class="code">
							<span id="code">验证码</span>
						</div>
					</div>
					<div class="beg-pull-right">
						<button class="layui-btn layui-btn-primary"
							style="border-radius: 8px" lay-submit 
							lay-filter="login">
							<i class="layui-icon">&#xe650;</i> 登录
						</button>
						<button class="layui-btn layui-btn-primary"
							style="border-radius: 8px; margin-left: 65px" lay-submit
							lay-filter="register">
							注册
						</button>
					</div>
					<div class="forget">
						<a href="#">忘记密码？</a>
					</div>

					<div class="notice">
						${message}
					</div>
				</form>
			</div>
		</div>
		<p>
			&nbsp;
		</p>
		<script type="text/javascript"
			src="/examination/page/admin/plugins/layui/layui.js"></script>
		<script type="text/javascript">
			layui.use(['layer', 'form'], function() {
				var layer = layui.layer,
					$ = layui.jquery,
					form = layui.form();
					form.on('submit(login)',function(data){
						var username = $("input[name='userName']").val();
			
						if(username.trim()==""){
							$("#msg").text("用户名不可为空！");
							return false;
						}
						
						var password = $("input[name='passWord']").val();
						
						if(password.trim()==""){
							$("#msg").text("密码不可为空！");
							return false;
						}
						
						var code = $("input[name='code']").val();
						
						if(code.trim()==""){
							$("#msg").text("验证码不可为空！");
							return false;
						}
						
						$("form").submit();
						
						return false;
					});
					
					form.on('submit(register)',function(data){
						window.location.href="/examination/user/toRegPage.do";
						return false;
					});
			});
		</script>
	</body>
</html>
