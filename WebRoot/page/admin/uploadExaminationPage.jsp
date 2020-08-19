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
			.button{
				width: 40px;
				cursor: pointer;
			}
			.button:HOVER {
				background-color: #999999;
				color:#FFFFFF;
			}
			#jobList{
				height: 300px;
				width: 500px;
				border: 1px solid #DDDDDD;
				float:left;
				position: absolute;
				background-color: #FFFFFF;
				z-index: 999;
				right:30px;
				display: none;
			}
			#submit{
				width: 80px;
				height: 30px;
				border: 1px solid #999999;
				font-size: 18px;
			}
			#submit:HOVER{
				width: 81px;
				height: 31px;
				border: 1px solid #DDDDDD;
				font-size: 19px;
				background-color: #999999;
				color:#FFFFFF;
			}
			#ds_time{
				color:red;
			}
			#show_time{
				padding-left: 15px;
				padding-top:5px;
				background-color: #DDDDDD;
				border: 1px solid #999999;
			}
			#show_list{
				padding-left: 15px;
			}
			#show_list div{
				font-size:16px;
				margin-top: 15px;
			}
			#show_list div span{
				margin-right: 15px;
			}
			#downImp{
				width: 30px;
				height: 30px;
			}
			.bottom{
				font-weight: bold;
				font-size: 13px;
			}
			.time{
				border: solid 1px #999999;
				width: 280px;
				height: 25px;
			}
		</style>
		<script type="text/javascript" src="/examination/js/jquery.js"></script>
		<script type="text/javascript" src="/examination/js/ajaxfileupload.js"></script>
		<script type="text/javascript" src="/examination/js/lydate/laydate.js"></script>
		<script type="text/javascript">
			$(function(){
				var init = function(){
					var refClassType = function(){
						$(".row").each(function(index,ele){
							var rowId = "row"+index;
							//刷新联动列表
							$(ele).find(".classType").change(function(e){
								var classType = $(this);
								var selectedId = $(this).find("option:selected").val();
								$.post("/examination/class/getClassLevelList.do",{'typeId':selectedId},function(data){
										eval("var data = " + data);
										classType.nextAll(".classLevel").empty();
										classType.nextAll(".classLevel").append('<option value="-1">--请选择--</option>');
										for(var i = 0 ; i < data.length ; i ++){
											classType.nextAll(".classLevel").append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
										}
									});				
								});
							});
						}
					refClassType();
				}
				init();
			});
		</script>
	</head>

	<body>
		<div style="margin: 30px;">
			<blockquote class="layui-elem-quote">
				创建考试&nbsp;&nbsp;&nbsp;
				<a href="/examination/formatFile/studentMessageFormat.xls">
				<img id="downImp" alt="" src="/examination/page/admin/images/download.jpg">
				点击下载考生信息模板</a>
			</blockquote>
			<div id="xx"
				style="width: 100%; height: 450px;; border: 1px solid #DDDDDD; margin-top: 20px;">
				<div class="beg-table-box">
					<div class="beg-table-body">
						<form action="/examination/uploadExamination/createExamination.do" 
							enctype="multipart/form-data"
									method="post">
							<table
								class="beg-table beg-table-bordered beg-table-hovered beg-table-striped">
								<thead>
									<tr>
										<th>
											考试类型选择
										</th>
										<th>
											上传考生信息
										</th>
									</tr>
								</thead>
								<tbody class="tbody">
									<tr class="row">
										<td>
											<select class="classType" name="classType">
												<option value="-1">--请选择--</option>
						    					<c:forEach items="${classTypeList}" var="classType">
							    					<option value="${classType.id}">${classType.name}</option>
						    					</c:forEach>
											</select>
											<select class="classLevel" name="classLevel">
												<option value="-1">--请选择--</option>
											</select>
										</td>
						    			<td>
						    				<input class="file" type="file" name="file"/>
						    			</td>
									</tr>
									<tr class="bottom">
										<td colspan="2">
											请选择考试时间：
										</td>
									</tr>
									<tr class="bottom">
										<td colspan="2">
											<input placeholder="请输入日期" 
												class="laydate-icon timeUstyle stateUTime"  name="startTimeStr"
													onclick="laydate({istime: true,format:'YYYY-MM-DD hh:mm'})"/>
											&nbsp;&nbsp;至&nbsp;&nbsp;
											<input placeholder="请输入日期" 
												class="laydate-icon timeUstyle stateUTime"  name="endTimeStr"
													onclick="laydate({istime: true,format:'YYYY-MM-DD hh:mm'})"/>
										</td>
									</tr>
									<tr class="bottom">
										<td colspan="3">
											<input id="submit" type="submit" value="提交"/>
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
