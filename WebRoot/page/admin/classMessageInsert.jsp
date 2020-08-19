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
			$(function(){
				function initClassLevel(){
					$("#classType").change(function(e){
						var selectedId = $(this).find("option:selected").val();
						$.post("/examination/class/getClassLevelList.do",{'typeId':selectedId},function(data){
							eval("var data = " + data);
							$("#classLevel").empty();
							$("#classLevel").append('<option value="-1">--请选择--</option>');
							for(var i = 0 ; i < data.length ; i ++){
								$("#classLevel").append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
							}
						});				
					});
				}
				initClassLevel();
			})
		</script>
	</head>

	<body>
		<div style="margin: 30px;">
			<blockquote class="layui-elem-quote"> 
				添加课程信息 
			</blockquote>
			<div id="xx"
				style="width: 100%; height: 450px;; border: 1px solid #DDDDDD; margin-top: 20px;">
				<div class="beg-table-box">
					<div class="beg-table-body">
						<form action="/examination/class/insertClassMessage.do" method="post">
						
							<table
								class="beg-table beg-table-bordered beg-table-hovered beg-table-striped">
								<thead>
									<tr>
										<th>
											名称
										</th>
										<th>
											内容
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>课程名称</td>
						    			<td>
						    				<input type="text" name="name"/>
						    			</td>
									</tr>
									<tr>
										<td>课程类型</td>
						    			<td>
						    				<select id='classType' name="classTypeId">
						    					<option value="-1">--请选择--</option>
						    					<c:forEach items="${classTypeList}" var="classType">
							    					<option value="${classType.id}">${classType.name}</option>
						    					</c:forEach>
						    				</select>
						    			</td>
									</tr>
									<tr>
										<td>课程阶段</td>
						    			<td>
						    				<select id="classLevel" name="classLevelId">
						    					<option value="-1">--请选择--</option>
						    				</select>
						    			</td>
									</tr>
									<tr>
										<td>总分</td>
						    			<td>
						    				<input type="number" name="totalScore"/>
						    			</td>
									</tr>
									<tr>
										<td>及格分</td>
						    			<td>
						    				<input type="number" name="passingGrade"/>
						    			</td>
									</tr>
									<tr>
										<td colspan="2">
											<input type="submit" value="提交"/>
										</td>
									</tr>
								</tbody>
							</table>
						
						</form>
					</div>
					<div class="beg-table-paged">
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
