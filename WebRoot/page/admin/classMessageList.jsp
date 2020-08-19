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
		<title>无标题文档</title>
		<link href="/examination/page/admin/css/3.css" rel="stylesheet"
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
		<style type="text/css">
			.page{
				border:1px solid;
				padding: 5px 15px;
				margin:0px 60px;
			}
			.page:HOVER {
				background-color: #FFFFFF;
				border-color: #FFFFFF;
			}
			#query span{
				color:rgb(43, 46, 55);
				font-weight: bold;
			}
			#query input{
				color:rgb(43, 46, 55);
				font-weight: bold;
				border: 1px solid #DDDDDD;
				height: 25px;
				line-height: 25px;
			}
		</style>
		<script type="text/javascript" src="/examination/js/jquery.js"></script>
		<script type="text/javascript">
		</script>
	</head>

	<body>
		<div style="margin: 30px;">
			<blockquote class="layui-elem-quote">
				课程信息列表
				<div id="tj">
					<a href="/examination/class/toInsertClassMessagePage.do">添加课程信息 +</a>
				</div>
			</blockquote>
			
			<div>
				<form id="query" action="/examination/class/toClassMessageListPage.do" method="get">
					<span>课程名称：</span>
					<input type="text" name="nameLike" value="${nameLike}"/>
					&nbsp;
					<input style="width: 80px;cursor: pointer;" type="submit" value="查询"/>
				</form>
			</div>
			
			
			<div id="xx"
				style="width: 100%; height: 450px;; border: 1px solid #DDDDDD; margin-top: 20px;">
				<div class="beg-table-box">
					<div class="beg-table-body">
						<table
							class="beg-table beg-table-bordered beg-table-hovered beg-table-striped">
							<thead>
								<tr>
									<th>
										序号
									</th>
									<th>
										课程名称
									</th>
									<th>
										课程类型
									</th>
									<th>
										课程阶段
									</th>
									<th width="16%">
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${classMessageList}" var="cm" varStatus="status">
									<tr>
										<td>${status.index}</td>
										<td>${cm.name}</td>
										<td>${cm.classTypeName}</td>
										<td>${cm.classLevelName}</td>
										<td width="16%">
											<span style="cursor: pointer;" class="listButton">
											 <img src="/examination/page/admin/images/01.png" width="23"
													height="23" />
											</span>
											<span style="cursor: pointer;" class="listButton">
												<img src="/examination/page/admin/images/02.png" width="23"
														height="23" />
											</span>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="beg-table-paged">
						<a class="page" href="/examination/class/toClassMessageListPage.do?pageNumber=1&nameLike=${nameLike}">首页</a>
						<a class="page" href="/examination/class/toClassMessageListPage.do?pageNumber=${page.pageNumber-1==0?1:(page.pageNumber-1) }&nameLike=${nameLike}">上一页</a>
						<span>第${page.pageNumber}页</span>
						<a class="page" href="/examination/class/toClassMessageListPage.do?pageNumber=${(page.pageNumber+1) < page.pageCount ?  (page.pageCount + 1) : page.pageCount }&nameLike=${nameLike}">下一页</a>
						<a class="page" href="/examination/class/toClassMessageListPage.do?pageNumber=${page.pageCount}&nameLike=${nameLike}">尾页</a>
						<span>当前共${page.pageCount}页/${page.count }条记录</span>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
