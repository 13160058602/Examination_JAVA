<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>阶段考试</title>
		<link href="/examination/page/main/css/index.css" rel="stylesheet"
			type="text/css" />
		<style type="text/css">
			#f-t{
				width: 100%;
				margin-top: 50px;
			}
			#f-t tr td{
				line-height: 50px;
			}
			#f-t .top td,#f-t .bottom td{
				text-align: center;	
				font-size: 24px;	
				font-family: 微软雅黑;
			}
			#f-t .left{
				text-align: right;
				font-size: 18px;	
				font-family: 微软雅黑;
				width: 40%;
			}
			#f-t .right{
				text-align: left;
			}
			#f-t .right input{
				width: 500px;
				height: 30px;
				border-width: 1px;
				border-color:#999999;
				border-style: none none solid none;
			}
			.bottom input{
				width: 120px;
				height: 30px;
			}
			.bottom input:HOVER{
				background-color: #999999;
				color:#FFFFFF;
			}
			.message{
				text-align: center;
				color:red;
				line-height: 200px;
				font-size: 35px;
			}
		</style>
	</head>

	<body>
		<div id="box">
			<div id="top">
				<div id="topin">
					<img src="/examination/page/main/images/logo.jpg" width="220"
						height="136" />
					<ul>
						<li class="ss">
							<a href="#">首页</a>
						</li>
						<li class="rk">
							<a href="#">入学考试</a>
						</li>
						<li class="rk">
							<a href="/examination/main/toStartExaminationPage.do">阶段考试</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="main">
				<!-- 准备考试 -->
				<div class="message">
					本次考试成绩为&nbsp;${message}&nbsp;分
				</div>
			</div>
			<div id="bt">
				<div id="btin">
					<div id="bt1">
						<div id="bt1-1">
							<p>
								&nbsp;
							</p>
							<p>
								xxxx
							</p>
							<ul>
								<li>
									<a href="">xxxxxx</a>
								</li>
								<li>
									<a href="">xxxxxx</a>
								</li>
								<li>
									<a href="">xxxxxx</a>
								</li>
								<li>
									<a href="">xxxxxx</a>
								</li>
							</ul>
						</div>
						<div id="bt1-2">
							<p>
								&nbsp;
							</p>
							<p>
								xxxx
							</p>
							<ul>
								<li>
									<a href="">xxxxxx</a>
								</li>
								<li>
									<a href="">xxxxxx</a>
								</li>
								<li>
									<a href="">xxxxxx</a>
								</li>
								<li>
									<a href="">xxxxxx</a>
								</li>
							</ul>
						</div>
						<div id="bt1-3">
							<p>
								&nbsp;
							</p>
							<p>
								xxxx
							</p>
							<ul>
								<li>
									<a href="">xxxxxx</a>
								</li>
								<li>
									<a href="">xxxxxx</a>
								</li>
								<li>
									<a href="">xxxxxx</a>
								</li>
								<li>
									<a href="">xxxxxx</a>
								</li>
							</ul>
						</div>
						<div id="bt1-4">
							<p>
								&nbsp;
							</p>
							<p>
								xxxx
							</p>
							<ul>
								<li>
									<a href="">xxxxxx</a>
								</li>
								<li>
									<a href="">xxxxxx</a>
								</li>
								<li>
									<a href="">xxxxxx</a>
								</li>
								<li>
									<a href="">xxxxxx</a>
								</li>
							</ul>
						</div>
						<div id="bt1-5">
							<p>
								&nbsp;
							</p>
							<p>
								<img src="/examination/page/main/images/qrcode_home.png"
									width="121" height="121" />
							</p>
						</div>
					</div>
					<div id="bt2">
						xxxxxx
					</div>

				</div>
			</div>
		</div>
	</body>
</html>
