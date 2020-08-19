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
		<style type="text/css">
			.checkExButton{
				width: 100px;
				height: 35px;
				margin-top: 15px;
				margin-left: 150px;
				cursor: pointer;
			}
			.checkExButton:HOVER {
				background-color: #999999;
				color:#FFFFFF;
			}
			.lineCell{
				cursor: pointer;
			}
		</style>
		<script type="text/javascript" src="/examination/js/jquery.js"></script>
		<script type="text/javascript" 
		src="/examination/js/jquery-fullscreen-plugin/jquery.fullscreen.js"></script>
		<script type="text/javascript">
			
			$(function(){
				var examinationCard = "${em.examinationCard}";
				var examinationCode = "${em.examinationCode}";
				var exIndex = "${exIndex}";
				//	计时
				function time(){
					var time;
					var set = setInterval(function(){
						$.post("/examination/main/getTime.do",{
							"exCard":examinationCard,
							"exIndex":exIndex
						},function(data){
						
							eval("time = " + parseInt(data));
							$("#t-m").text(time);
							
							if(time <= 0){
								clearInterval(set);
								$.post("/examination/main/exitExamination.do",{
									"exCode":examinationCode,
									"exCard":examinationCard,
									"exIndex":exIndex
								},function(data){
									console.log(data);		
									window.location.href="/examination/main/toSuccessExaminationPage.do?score="+data;				
								});
							}
							
						});
					}, 5000);
				}
				
				var examinationIndex = 0;
				var examinationMax = 0;
				function getExaminationIndex(){
					$.post("/examination/main/getExaminationIndex.do",{
							"exCode":examinationCode,
							"exCard":examinationCard,
							"exIndex":exIndex
						},function(data){
							eval("var allIndex = " + parseInt(data));
							examinationMax = allIndex;
							lineStr = "<ul>";
							for(var i = 1 ; i <= allIndex ; i ++){
								lineStr += "<li>"
								lineStr +=	'<a class="lineCell" value="'+i+'">'+i+'</a>'
								lineStr +=	"</li>"
							}
							lineStr += "</ul>";
							
							$(".indexLine").append(lineStr);
							
							//获取题目
							getExamination(examinationIndex);
							$(".lineCell").click(function(e){
								var cell = $(this);
								cell.css("backgroundColor","red");
								var index = cell.attr("value");
								getExamination(parseInt(index)-1)
								examinationIndex = parseInt(index)-1;
							})
							
						});
				}
				
				function selectExamination(){
					$(".pv").click(function(e){
						if(examinationIndex > 0){
							examinationIndex --;
						}
						getExamination(examinationIndex);
						$(".lineCell").eq(examinationIndex).css("backgroundColor","red");
					});
					$(".nx").click(function(e){
						if(examinationIndex < (examinationMax-1)){
							examinationIndex ++;
						}
						getExamination(examinationIndex);
						$(".lineCell").eq(examinationIndex).css("backgroundColor","red");
					});
					$(".exit").click(function(e){
						$.post("/examination/main/exitExamination.do",{
							"exCode":examinationCode,
							"exCard":examinationCard,
							"exIndex":exIndex
						},function(data){
							console.log(data);		
							window.location.href="/examination/main/toSuccessExaminationPage.do?score="+data;				
						});
					});
				}
				
				function getExamination(index){
					$.post("/examination/main/getExamination.do",{
						"exCode":examinationCode,
							"exCard":examinationCard,
								"exIndex":exIndex,
									"index":index
					},function(data){
					
						eval("data = " + data);
						
						$(".stem").text((parseInt(index)+1)+"." + data[0].stem);
						
						var opts = data[0].examinationQuestionsOptions;
						
						var exId = data[0].id;
						var exUid = data[0].uid;
						
						$(".opts").empty();
						
						for(var i = 0 ; i < opts.length ; i ++){
							var opt = opts[i];
							
							var isCheck = '';
							if(data[0].actualChose!=null){
								if(data[0].actualChose.length>1){
									for(var j = 0 ; j < data[0].actualChose.length ; j ++){
										if(data[0].actualChose[j].toLowerCase() == 
											opt.lable.toLowerCase()){
											isCheck = 'checked';	
										}
									}
								}else if(data[0].actualChose.length==1){
									isCheck = ((data[0].actualChose.toLowerCase() == 
										opt.lable.toLowerCase()) ? 'checked':'');
								}
							}
							
							$(".opts").append("<label>");
							
							$(".opts").append('<input class="optVals" type="'+(data[0].score == 1 ? 'radio' : 'checkbox')+'" name="RadioGroup1" value="' + 
								opt.lable
							 + '" id="RadioGroup1_1" '+
							 	isCheck
							 +'>');
							 
							$(".opts").append(opt.context);
							
							$(".opts").append("</label>");
							$(".opts").append("<br/>");
						}
						
						$(".optVals").click(function(e){
							
							
							var chose = "";
							
							$(".optVals:checked").each(function(index,ele){
								chose += $(ele).val();
							})
							
							setExaminationResult(exId , exUid , chose);
							
						});
						
					})
				}
				
				function setExaminationResult(exId,exUid,chose){
					$.post("/examination/main/setExaminationResult.do",{
						"exId":exId,
							"exUid":exUid,
								"chose":chose
					},function(data){
					
						
					
					});
				}
				
				//初始化
				function init(){
					//时间控制
					time();
					//初始化游标
					getExaminationIndex();
					//初始化按钮
					selectExamination();
				}
				init();
				/*(function(){
					alert("*****************请按F11键进入考试********************");
					//屏蔽鼠标右键 
					$(document).bind("contextmenu",function(){return false;});  
					
					$(document).keydown(function(e){
						var flag = $(document).fullScreen();
						console.log(flag);
						if(!flag){
							if(e.key=="F11"){
								init();
							}else{
								return false;
							}
						}else{
							return false;
						}
					});
				})();*/
				
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
		<div class="kong"></div>
		<div id="main">
			<div class="yi">
				<p class="stem">
				</p>
			</div>
			<div class="er">
				<p class="opts">
				
				</p>
			</div>

			<div class="san">
				<div class="san2">
					<div class="san1">
						<input type="button" class="pv checkExButton" value="上一题"/>
					</div>
				</div>

				<div class="san2">
					<div class="san1">
						<input type="button" class="exit checkExButton" value="结束考试"/>
					</div>
				</div>

				<div class="san2">
					<div class="san1">
						<input type="button" class="nx checkExButton" value="下一题"/>
					</div>
				</div>

			</div>

			<div class="si">
				<div class="aa indexLine">

				</div>
			</div>
		</div>


		<div id="footer">
			<div class="yuan">
				<ul>
					<li>
					</li>
				</ul>
			</div>

			<div class="bei">
				<p></p>
			</div>

			<div class="jia">
			</div>
		</div>













	</body>
</html>