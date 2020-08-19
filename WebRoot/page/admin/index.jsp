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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>后台管理系统</title>
		<link href="/examination/page/admin/css/1.css" rel="stylesheet"
			type="text/css" />
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport"
			content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet"
			href="/examination/page/admin/images/layui/css/layui.css" media="all" />
		<link rel="stylesheet"
			href="/examination/page/admin/images/css/begtable.css" />
		<link rel="stylesheet"
			href="/examination/page/admin/images/css/global.css" media="all">
		<link rel="stylesheet"
			href="/examination/page/admin/images/plugins/font-awesome/css/font-awesome.min.css">

		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">

	</head>

	<body>
		<div id="box">
			<div id="top">
				<img src="/examination/page/admin/images/03.png" width="80"
					height="80" />
				<h1>
					后台管理系统
				</h1>
				<ul class="layui-nav admin-header-item">
					<li class="layui-nav-item">
						<a href="#" class="admin-header-user"> ID:<span>${user.userName}(${user.userTypeName})</span>
						</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="#"><i class="fa fa-user-circle" aria-hidden="true"></i>
									个人信息</a>
							</dd>
							<dd>
								<a href="#"><i class="fa fa-gear" aria-hidden="true"></i> 设置</a>
							</dd>
							<dd>
								<a href="/examination/user/logout.do"><i
									class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="#">今天是：2018/1/4</a>
					</li>
					<li class="layui-nav-item">
						<a href="#">天气情况：...</a>
					</li>
				</ul>
			</div>
		</div>

		<div id="main">
			<div id="left">

				<h2>
					管理菜单
				</h2>

				<ul class="layui-nav layui-nav-tree">
					<c:if test="${user.userTypeId == 2 || user.userTypeId == 3}">
						<li class="layui-nav-item layui-nav-itemed">
							<a href="#">考试管理</a>
							<dl class="layui-nav-child">
								<c:if test="${user.userTypeId == 2}">
									<dd>
										<a href="/examination/uploadQuestions/toUploadQuestionsPage.do" target="frame">导入试题</a>
									</dd>
									<dd>
										<a href="#" target="frame">学籍管理</a>
									</dd>
									<dd>
										<a href="#" target="frame">考核管理</a>
									</dd>
								</c:if>
								<c:if test="${user.userTypeId == 3}">
									<dd>
										<a href="/examination/uploadExamination/toUploadExaminationListPage.do" target="frame">创建考试</a>
									</dd>
									<dd>
										<a href="/examination/eerc/toExplorerExaminationResultPage.do" target="frame">考试结果</a>
									</dd>
									<dd>
										<a href="/examination/class/toClassMessageListPage.do" target="frame">课程管理</a>
									</dd>
									<dd>
										<a href="#" target="frame">教学进度</a>
									</dd>
									<dd>
										<a href="#" target="frame">考核统计</a>
									</dd>
								</c:if>
							</dl>
						</li>
					</c:if>
					<c:if test="${user.userTypeId == 1}">
						<li class="layui-nav-item  layui-nav-itemed">
							<a href="#">系统管理</a>
							<dl class="layui-nav-child">
								<dd>
									<a href="/examination/user/getUserList.do" target="frame">用户审核</a>
								</dd>
								<dd>
									<a href="#">用户类型</a>
								</dd>
							</dl>
						</li>
					</c:if>
					<li class="layui-nav-item  layui-nav-itemed">
						<a href="#">个人中心</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="#" target="frame">个人资料</a>
							</dd>
							<dd>
								<a href="#">用户类型</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
			<div id="right">
				<div id="jg"></div>
				<iframe name="frame" src="/examination/page/admin/welcome.jsp" width="100%" height="800"></iframe>
			</div>
		</div>
		<script type="text/javascript"
			src="/examination/page/admin/images/layui/layui.js"></script>
		<script type="text/javascript">
			layui.use('element', function() {
			var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
	
			});
		</script>
	</body>
</html>
