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
		
		<style type="text/css">
			.resultExplorerButton{
				width: 200px;
				height: 30px;
				cursor: pointer;
			}
			.resultExplorerButton:HOVER {
				background-color: #999999;
				color:#FFFFFF;
			}
		</style>
		
		<script type="text/javascript" src="/examination/js/jquery.js"></script>
		<script type="text/javascript">
			
			$(function(){
				
				function init(){
					$(".resultExplorerButton").each(function(index,ele){
						var code = $(ele).attr("code");
						var this_ele = $(ele);
						this_ele.click(function(e){
							$.post(
								"/examination/eerc/getExaminationResultFile.do",
									{"code":code},
										function(data){
											eval("data = " + data);
											if(data.result == "success"){
												var path = data.fileName;
												var eleStr = "<a href='/examination/upload/"+path+"'>考试结果下载</a>";
												var td = this_ele.parents("td");
												td.empty();
												td.append(eleStr);
											}else{
												alert("成绩单生成失败，请联系管理员！");
											}
										});
						});
					});
				}
				
				init();
			})
			
		</script>
	</head>

	<body>
		<div style="margin: 30px;">
			<blockquote class="layui-elem-quote">
				考试列表
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
								</tr>
							</thead>
							<tbody>
									<c:forEach items="${examinationJobs}" var="job" varStatus="status">
										<tr>
											<td>${status.index}</td>
							    			<td>${job.code}</td>
							    			<td><fmt:formatDate value="${job.startTime}" pattern="yyyy-MM-dd hh:mm"/></td>
							    			<td><fmt:formatDate value="${job.endTime}" pattern="yyyy-MM-dd hh:mm"/></td>
							    			<td>
							    				<c:if test="${!empty job.examinationResultFile}">
								    				<a href="/examination/upload/${job.examinationResultFile}">
								    					考试结果下载
								    				</a>
							    				</c:if>
							    				<c:if test="${empty job.examinationResultFile}">
								    				<input class="resultExplorerButton" code="${job.code}" type="button" value="点击生成考试结果"/>
							    				</c:if>
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
