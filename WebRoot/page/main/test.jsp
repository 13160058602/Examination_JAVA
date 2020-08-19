<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<title>阶段考试</title>
		<link rel="stylesheet" type="text/css"
			href="/examination/page/main/css/examination.css">
		<script type="text/javascript" src="/examination/js/jquery.js"></script>
		<script type="text/javascript" 
		src="/examination/js/jquery-fullscreen-plugin/jquery.fullscreen.js"></script>
		<script type="text/javascript">
			
			$(function(){
				// 全屏
				function fullscreen() {
					$("#top").fullScreen(true);
				}
				// 退出全屏
				function exitFullscreen() {
					$("#top").fullScreen(false);
				}
				//初始化
				function init(){
					//全屏控制
					fullscreen();
				}
				init();
				
			});
		
		</script>
	</head>
	<body id="body">
		<div id="top">
			<div class="middle">
				<div class="LOGO">
					<img src="/examination/page/main/images/logo.png">
					<h1>
						<a href="#">成绩考核</a>
					</h1>
				</div>
				<p id="time">
					<span id="t-m">59</span>分钟
				</p>
			</div>
		</div>
	</body>
</html>