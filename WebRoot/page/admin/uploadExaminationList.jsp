<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<script type="text/javascript" src="/examination/js/jquery.js"></script>
		<script type="text/javascript">
			
		</script>
	</head>

	<body>
		<div style="margin: 30px;">
			<blockquote class="layui-elem-quote">
				考试列表
				<div id="tj">
					<a href="/examination/uploadExamination/toUploadExaminationPage.do">创建考试 +</a>
				</div>
			</blockquote>
			
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
										考试号
									</th>
									<th>
										考试开始时间
									</th>
									<th>
										考试结束时间
									</th>
									<th>
										下载地址
									</th>
									<th width="16%">
										操作
									</th>
								</tr>
							</thead>
							<tbody>
									<c:forEach items="${jobs}" var="job" varStatus="status">
										<tr>
											<td>${status.index}</td>
							    			<td>${job.code}</td>
							    			<td><fmt:formatDate value="${job.startTime}" pattern="yyyy-MM-dd hh:mm"/></td>
							    			<td><fmt:formatDate value="${job.endTime}" pattern="yyyy-MM-dd hh:mm"/></td>
							    			<td>
							    				<a href="/examination/upload/${job.examinationFile}">
							    					考试信息下载
							    				</a>
							    			</td>
											<td width="16%">
												<span style="cursor: pointer;" class="listButton" path="">
												 <img src="/examination/page/admin/images/01.png" width="23"
														height="23" />
												</span>
												&nbsp;
												<span style="cursor: pointer;" class="listButton" path="">
													<img src="/examination/page/admin/images/02.png" width="23"
															height="23" />
												</span>
											</td>
										</tr>
									
									</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
