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
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>注册</title>
		<link href="/examination/page/admin/css/register.css" rel="stylesheet" type="text/css" />
		<link type="text/css" rel="stylesheet" href="/examination/page/admin/css/global.css">
		<link type="text/css" rel="stylesheet" href="/examination/page/admin/css/public.css">
		<link type="text/css" rel="stylesheet" href="/examination/page/admin/css/zhuce.css">
		<style type="text/css">
			body,td,th {
				font-size: 14px;
				color: aliceblue;
			}
			
			body {
				background-color: #393d49;
			}
		</style>
		<script type="text/javascript" async=""
			src="/examination/page/admin/js/ga.js"></script>
		<script src="/examination/page/admin/js/base-all-v2.js"
			type="text/javascript"></script>
		<script src="/examination/page/admin/js/public.js"
			type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="/examination/page/admin/js/reg.js"></script>
		<script src="/examination/page/admin/js/h.js" type="text/javascript"></script>
		<script src="/examination/page/admin/js/newzhuce.js"
			type="text/javascript"></script>
		<script type="text/javascript" src="/examination/js/jquery.js"></script>

		<script type="text/javascript">
	        var authnCfg = {
	            // CAPTCHA图片（使用Cookies传递Guid）
	            captchaImageSrc: 'http://sso.tiexue.net/captcha/image'
	        };
	        function GetValidateCode(image) {
	            $(image).attr("src", authnCfg.captchaImageSrc + '?t=' + Date.parse(new Date()) + '&width=102&height=30');
	        }
	
	        $(document).ready(function () {
	            GetValidateCode($("#RegCodeImage"));
	
	        });
	        
	        
	        
	        $(function(){
				//页面初始化函数
				var init = function(){
					//获取验证码
					getCode();
					function getCode(){
						$.post("/examination/user/getCode.do",{},function(data){
							eval("data = " + data);
							
							$("#code").text(data.code);
						})
					}
					$("#code").click(function(e){
						getCode();
					});
					
					
					$("input[name='userName']").keyup(function(){
						var username = $(this).val();
						$.get("/examination/user/checkUserName.do",{'userName':username},function(data){
							eval("data = " + data);
							if(data.result=='success'){
								$("#userNameCheck").text("用户名可用！");
								$("#userNameCheck").attr("check","1");
							}else if(data.result=='error'){
								$("#userNameCheck").text("用户名不可用！");
								$("#userNameCheck").attr("check","0");
							}				
						})
					});
				}
				init();
				
				//提交验证：
				$("form").submit(function(){
					
					var username = $("input[name='userName']").val();
					
					if(username.trim()==""){
						$("#userNameCheck").text("用户名不可为空！");
						return false;
					}else{
						if(!/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/.test(username.trim())){
							$("#userNameCheck").text("用户名格式错误！");
							return false;
						}else{
							$("#userNameCheck").text("");
						}
					}
					
					if($("#userNameCheck").attr("check")=="0"){
						$("#userNameCheck").text("用户名已存在！");
						return false;
					}else{
						$("#userNameCheck").text("");
					}
					
					var password = $("input[name='passWord']").val();
					
					if(password.trim()==""){
						$("#passWordCheck").text("密码不可为空！");
						return false;
					}else{
						if(!/^[a-zA-Z][a-zA-Z0-9]{4,15}$/.test(username.trim())){
							$("#passWordCheck").text("密码格式错误！");
							return false;
						}else{
							$("#passWordCheck").text("");
						}
					}
					
					var rePassword = $("#rePassWord").val();
					if(password!=rePassword){
						$("#rePassWordCheck").text("两次密码输入不一致！");
						return false;
					}else{
						$("#rePassWordCheck").text("");
					}
					
					//phone
					var phone = $("input[name='phone']").val();
					if(phone.trim()!=""){
						var flag = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/.test(phone.trim());
						if(!flag){
							$("#phoneCheck").text("手机号码格式错误！");
							return false;
						}else{
							$("#phoneCheck").text("");
						}
					}
					
					//idcode
					var idCard = $("input[name='idCard']").val();
					if(idCard.trim()!=""){
						var flag = /^\d{15}|\d{18}$/.test(idCard.trim());
						if(!flag){
							$("#idCardCheck").text("身份证号码格式错误！");
							return false;
						}else{
							$("#idCardCheck").text("");
						}
					}
					
					
					var userTypeId = $("select[name='userTypeId'] option:selected").val();
					if(userTypeId==-1){
						$("#userTypeIdCheck").text("请选择用户类型！");
						return false;
					}else{
						$("#userTypeIdCheck").text("");
					}
					
					
					var code = $("input[name='code']").val();
					
					if(code.trim()==""){
						$("#codeCheck").text("验证码不可为空！");
						return false;
					}else{
						$("#codeCheck").text("");
					}
					
				
					return true;
				})
			})
	        
	    </script>
	</head>

	<body>
		<form method="post" action="register.aspx" id="form1">
			<div class="aspNetHidden">
				<input name="__VIEWSTATE" id="__VIEWSTATE"
					value="/wEPDwULLTE2MDIxMTU1MzlkZFCie4hhNoTawGtD23vWUzmFNqC5"
					type="hidden">
			</div>
			<div id="box">
				<h1>
					&nbsp;&nbsp; 注册账号
				</h1>
				<div class="zhuce_cont">
					<div class="zc_message" id="messlink">
						<label class="zc_label" for=" ">
							用 户 名：
						</label>
						<input class="zc_input" id="user" name=" " type="text">
						<div class="zc_prompt">
							<p class="zc_proA" id="user-rs">
								<span>*</span>2-16字符，建议用中文，一经注册不能修改。
							</p>
							<p class="zc_proB" id="user-error">
								<span></span>用户名格式不正确！
							</p>
							<p class="zc_proC" id="user-fon">
								<span></span>恭喜您，用户名可以使用
							</p>
						</div>
						<div class="zc_hint" id="usertit">
							请输入汉字、字母、数字和下划线，2-16个字符。
						</div>
					</div>
					<div class="zc_message" style="margin-bottom: 0;">
						<label class="zc_label" for=" ">
							设置密码：
						</label>
						<input class="zc_input" id="pwd" name=" " type="password">
						<div class="zc_prompt">
							<p class="zc_proA" id="pwd-rs">
								<span>*</span>长度为6-16位，建议由字母、数字或符号组合，区分大小写。
							</p>
							<p class="zc_proB" id="pwd-error">
								<span></span>密码不能少于6个字符！
							</p>
							<p class="zc_proC" id="pwd-fon">
								<span></span>
							</p>
						</div>
						<div class="zc_hint" id="zc_hint" style="display: none;">
							<h3 class="zc_cd ">
								<div class="zc_rzq zc_ruo">
									<div></div>
								</div>
								<p class="zc_ruoText">
									弱,容易被盗
								</p>
							</h3>
							<h3 class="zc_cd">
								<div class="zc_rzq zc_zhong">
									<div></div>
								</div>
								<p class="zc_zhongText">
									中,还可以再复杂些
								</p>
							</h3>
							<h3 class="zc_cd">
								<div class="zc_rzq zc_gao">
									<div></div>
								</div>
								<p class="zc_gaoText">
									强，密码安全
								</p>
							</h3>
						</div>
					</div>
					<div class="zc_message ">
						<label class="zc_label" for=" ">
							确认密码：
						</label>
						<input class="zc_input" id="pass" name=" " type="password">
						<div class="zc_prompt">
							<p class="zc_proA" id="pass-rs">
								<span>*</span>请再次输入密码
							</p>
							<p class="zc_proB" id="pass-error">
								<span></span>两次输入的密码不一致
							</p>
							<p class="zc_proC" id="pass-fon">
								<span></span>
							</p>
						</div>
					</div>
					<div class="zc_message" id="phone">
						<label class="zc_label" for=" ">
							手机号码：
						</label>
						<input class="zc_input" id="mobile" name="mobile" type="text">
						<div class="zc_prompt">
							<p class="zc_proA" id="mobile-rs">
								<span>*</span>请输入真实有效的手机号码
							</p>
							<p class="zc_proB" id="mobile-error">
								<span></span>手机号码错误
							</p>
							<p class="zc_proC" id="mobile-fon">
								<span></span>
							</p>
						</div>
						<div class="zc_hint" id="mobiletit">
							请输入真实有效的手机号码
						</div>
					</div>
					<div class="zc_message" style="padding-top: 10px;">
						<label class="zc_label" for=" ">
							验证码:
						</label>
						<div class="zc_InputW">
							<input class="zc_yzmInput" id="yzm" name="" maxlength="4"
								onkeydown="TX.EnterSubmit(event,function(){checkform('form1')})"
								type="text">
							<span class="VerifyCodeImg"> <img id="RegCodeImage"
									onclick="GetValidateCode(this);" src="images/vcode.gif">
							</span>
							<b onclick="GetValidateCode($('#RegCodeImage'));">刷新</b>
						</div>
						<div class="zc_prompt">
							<p class="zc_proA" id="yzm-rs">
								<span>*</span>不分大小写
							</p>
							<p class="zc_proB" id="yzm-error">
								<span></span>验证码有误
							</p>
							<p class="zc_proC" id="yzm-fon">
								<span></span>
							</p>
						</div>
					</div>
					<div class="zc_text">
						<div class="zc_xy">
							<div class="zc_checkbox">
								<input checked="checked" name="ydfwxy" id="igrai"
									type="checkbox">
							</div>
							<div class="zc_ctext">
								我已阅读并同意遵守&nbsp;
								<a href="javascript:void(0)" id="togg">服务条款</a>
							</div>
						</div>
						<div id="regsiter15221" style="display: none;">
							<div class="regsiter15222">
								阅读服务条款
							</div>
							<div class="regsiter15222">
								<b id="closed">X</b>
							</div>
						</div>
						<div class="zc_xyz" id="greet">
							<span></span>请阅读并同意服务条款
						</div>
						<div class="zc_xy" style="clear: both; display: none;">
							<div class="zc_checkbox">
								<input name="xcdl" id="ydfwxy" type="checkbox">
							</div>
							<div class="zc_ctext">
								下次自动登录，请勿在公共电脑勾选此项
							</div>
						</div>
					</div>
					<div class="zc_submit">
						<input name="tijiao" id="tijiao" class="zc_mszc" value="马上注册"
							onclick="checkform('form1');" type="button">
						<p>
							已经注册了？
							<a href="login.html">点击登录</a>
						</p>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				var togg = document.getElementById("togg"), cont = document
						.getElementById("regsiter15221"), clsed = document
						.getElementById("closed");
				togg.onclick = function() {
					if (cont.style.display == "none") {
						cont.style.display = "block";
						document.getElementById("greet").style.display = "none";
					} else if (cont.style.display == "block") {
						cont.style.display = "none";
			
					}
				}
				clsed.onclick = function() {
					cont.style.display = "none";
				}
				function openWindow() {
			
					if (TX.BaseCookie.BBS_CurrentUserID() <= 0) {
						var top = ($(window).height() - 550) / 2, left = ($(document)
								.width() - 650) / 2;
			
						window
								.open(
										'https://open.weixin.qq.com/connect/qrconnect?appid=wx7f3870c2639a8ee3&redirect_uri=http%3A%2F%2Fwx.sso.tiexue.net%2Fapi%2Fwxlogin%2Fqruserinfo&response_type=code&scope=snsapi_login&state=http%3A%2F%2Freg.tiexue.net%2Foauth%2Fwechat.aspx?rf=',
										'', 'height=550,width=650,top=' + top + ',left='
												+ left + ',toolbar=no,menubar=no');
					} else {
						window.location.href = 'http://i.tiexue.net/' + TX.BaseCookie
								.BBS_CurrentUserID() + '/safe.html';
					}
					return false
				}
			</script>
	</body>
</html>
