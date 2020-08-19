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
				height: 270px;
				overflow-y:auto; 
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
		</style>
		<script type="text/javascript" src="/examination/js/jquery.js"></script>
		<script type="text/javascript" src="/examination/js/ajaxfileupload.js"></script>
		<script type="text/javascript">
			$(function(){
				var init = function(){
					
					var removeFunction = function(ele){
						$(ele).find(".remove").click(function(e){
							if($(".row").length>1){
								var row = $(this).parents(".row");
								row.remove();
							}
						});
					}
					
					removeFunction($(".row").eq(0));
					
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
							
							//刷新异步上传
							$(ele).find(".file").change(function(e){
								 $(this).attr("id",rowId);
								 var pathEle = $(this).nextAll(".path");
								 var fileNameEle = $(this).nextAll(".fileName");
								 
								 $.ajaxFileUpload(
						                {
						                    url: '/examination/uploadQuestions/uploadQuestionsFile.do', //用于文件上传的服务器端请求地址
						                    secureuri: false, //是否需要安全协议，一般设置为false
						                    fileElementId: rowId, //文件上传域的ID
						                    dataType: 'json', //返回值类型 一般设置为json
						                    success: function (data, status)  //服务器成功响应处理函数
						                    {
						                    	pathEle.val(data.path);
						                    	fileNameEle.val(data.fileName);
						                    },
						                    error: function (data, status, e)//服务器响应失败处理函数
						                    {
						                    }
						                }
						            );
						          	return false;
							});
						});
					}
					refClassType();
					
					$(".add").click(function(e){
						var row = $(".row").eq(0);
						var thiz = $(this).parents(".bottom");
						var rowClone = row.clone();
						rowClone.find(".file").val("");
						thiz.before(rowClone);
						removeFunction(rowClone);
						refClassType();
					});
					
					$("#showJobButton").click(function(e){
						if($("#jobList").is(":hidden")){
							$("#jobList").show();
							$("#showOrHid").text("-");
						}else{
							$("#jobList").hide();
							$("#showOrHid").text("+");
						}
					});
					
					function initJobWork(){
						var maxTime = 8;
						var nowTime = -1;
						setInterval(function(){
							if(nowTime >= 0){
								$("#ds_time").text(nowTime);
								nowTime --;
							}else{
								nowTime = maxTime;
								
								$.get("/examination/uploadQuestions/getJobList.do",
									{},
										function(data){
											eval("var data = " + data);
											$("#show_list").empty();
											for(var i = 0 ; i < data.length ; i ++){
												var stuts = data[i].stuts;
												if(stuts == 0){
													stuts = "<span style='color:blue;'>未完成</span>";
												}else if(stuts == 1){
													stuts = "<span style='color:green;'>已完成</span>";
												}else if(stuts == 2){
													stuts = "<span style='color:red;'>失败</span>";
												}
												$("#show_list").append("<div><span>"+data[i].code+"</span>"+stuts+"</div>");
											}						
								});
							}
						},1000);
					}
					initJobWork();
					
				}
				init();
			});
		</script>
	</head>

	<body>
		<div style="margin: 30px;">
			<blockquote class="layui-elem-quote">
				批量上传试题&nbsp;&nbsp;&nbsp;
				<a href="/examination/formatFile/questionFormat.xls">
				<img id="downImp" alt="" src="/examination/page/admin/images/download.jpg">
				点击下载试题模板</a>
				<div id="tj">
					<a id="showJobButton" href="#">查看任务列表 <span id="showOrHid">+</span></a>
				</div>
				<div id="jobList">
					<div id="show_time">距离下一次刷新时间还剩<span id="ds_time">8</span>秒</div>
					<div id="show_list">
					</div>
				</div>
			</blockquote>
			<div id="xx"
				style="width: 100%; height: 450px;; border: 1px solid #DDDDDD; margin-top: 20px;">
				<div class="beg-table-box">
					<div class="beg-table-body">
						<form action="/examination/uploadQuestions/uploadFileList.do" method="post">
							<table
								class="beg-table beg-table-bordered beg-table-hovered beg-table-striped">
								<thead>
									<tr>
										<th>
											考试类型选择
										</th>
										<th>
											上传文件选择
										</th>
										<th>
											操作
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
						    				<input type="hidden" class="path" name="path" value=""/>
						    				<input type="hidden" class="fileName" name="fileName" value=""/>
						    			</td>
						    			<td>
						    				<input class="button remove" type="button" value="-"/>
						    			</td>
									</tr>
									<tr class="bottom">
										<td colspan="2">
										</td>
										<td width="16%">
											<input class="button add" type="button" value="+"/>
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
