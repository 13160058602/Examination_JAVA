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
		<title>考试系统</title>
		<link href="/examination/page/main/css/index.css" rel="stylesheet"
			type="text/css" />
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
				<div id="picture">
					<img src="/examination/page/main/images/picture.png" width="1903"
						height="494" />
				</div>
				<div id="m1">
					<div id="m1in">
						<div id="m1-1">
							<p>
								<img src="/examination/page/main/images/func_in.png" width="36"
									height="36" />
							</p>
							<p>
								&nbsp;
							</p>
							<p>
								&nbsp;
							</p>
							<p>
								<a href="#">一键导入</a>
							</p>
							<p>
								支持Excel模板快速导入试题
							</p>
							<p>
								&nbsp;
							</p>
						</div>
						<div id="m1-2">
							<p>
								<img src="/examination/page/main/images/func_sui.png" width="36"
									height="36" />
							</p>
							<p>
								&nbsp;
							</p>
							<p>
								&nbsp;
							</p>
							<p>
								<a href="#">随机抽卷</a>
								<br />
								设定组卷规则，随机抽取试题
							</p>
						</div>
						<div id="m1-3">
							<p>
								<img src="/examination/page/main/images/func_shiti.png"
									width="36" height="36" />
							</p>
							<p>
								&nbsp;
							</p>
							<p>
								&nbsp;
							</p>
							<p>
								<a href="#">试题乱序</a>
								<br />
								考题随机乱序，有效防止作弊
							</p>
						</div>
						<div id="m1-4">
							<p>
								<img src="/examination/page/main/images/func_wechat.png"
									width="36" height="36" />
							</p>
							<p>
								&nbsp;
							</p>
							<p>
								&nbsp;
							</p>
							<p>
								<a href="#">微信集成</a>
								<br />
								可从公众号进入考试，成绩可分享
							</p>
						</div>
					</div>
				</div>
				<div id="m2">
					<div id="m2in">
						<h1>
							&nbsp;
						</h1>
						<h1>
							产品体验
						</h1>

						<p>
							我们在考试创新上一直全力以赴，希望为企业带来先进的考试技术及测评理念，致力于打造优质体验的考试服务。
						</p>
						<div id="m2-1">
							<div id="m2-1-1">
								考生端演示
							</div>
							<p>
								&nbsp;
							</p>
							<p>
								用微信扫描二维码，30秒体验考生作答
							</p>
							<p>
								&nbsp;
							</p>
							<p>
								<img src="/examination/page/main/images/qrcode_try.png"
									width="145" height="145" />
							</p>
							<p>
								&nbsp;
							</p>
							<p>
								若想体验电脑上作答，请点击 [
								<a href="https://njhxzy.weicewang.com/test/?m=1&amp;p=P100190"
									target="_blank">这里</a> ]
							</p>
						</div>
						<div id="m2-2">
							<div id="m2-2-1">
								企业端演示
							</div>
							<p>
								&nbsp;
							</p>
							<p>
								只需简单三步，即可创一场考试：
							</p>
							<p>
								&nbsp;
							</p>
							<p>
								<img src="/examination/page/main/images/step.png" width="253"
									height="94" />
							</p>
							<p>
								&nbsp;
							</p>
							<p>
								产品演示： [
								<a href="http://v.youku.com/v_show/id_XMTM4MjE0ODg0OA==.html"
									target="_blank">5分钟视频演示</a> ]
							</p>
							<p>
								&nbsp;
							</p>
							<p>
								若想体验企业端操作，请点击 [
								<a
									href="https://njhxzy.weicewang.com/user/login/gomanage/demo1/e10adc3949ba59abbe56e057f20f883e"
									target="_blank">这里</a> ]
							</p>
						</div>
						<div id="m2-3">
							<div id="m2-3-1">
								产品服务
							</div>
							<p>
								&nbsp;
							</p>
							<p>
								微测网可提供平台服务和运营服务：
							</p>
							<p>
								&nbsp;
							</p>
							<p class="f1">
								平台服务：
							</p>
							<p>
								完全免费，可自主上传试题并组织考试，
								<br />
								<span class="f1">&nbsp;&nbsp;&nbsp;&nbsp; 95%</span>的微测企业用户为免费用户。
							</p>
							<p>
								&nbsp;
							</p>
							<p class="f2">
								运营服务：
							</p>
							<p>
								常用于高安全级别的大规模校园招聘考试，
								<br />
								&nbsp;&nbsp;&nbsp;&nbsp; 以及微测商店运营服务。
							</p>
							<p>
								&nbsp;
							</p>
							<p>
								详情请点击 点击 [
								<a
									href="https://njhxzy.weicewang.com/user/login/gomanage/demo1/e10adc3949ba59abbe56e057f20f883e"
									target="_blank">这里</a> ]
							</p>
						</div>
						<p>
							&nbsp;
						</p>
					</div>
				</div>
				<div id="m3">
					<div id="m3in">
						<h1>
							&nbsp;
						</h1>
						<h1>
							典型案例
						</h1>

						<p>
							在这里，您可以了解使用微测网相关的各种最新案例，包括招聘考试、培训考试、知识竞赛及各种企业内部考核等。
						</p>
						<div id="m3-1">
							<p>
								<a href="#"><img src="/examination/page/main/images/jd.jpg"
										width="298" height="160" />
								</a>
							</p>
							<div id="m3-1-1">
								<p class="apply-top">
									&nbsp;
								</p>
								<p class="apply-top">
									<a
										href="https://njhxzy.weicewang.com/home/article/100044?category=%E5%AE%A2%E6%88%B7%E6%A1%88%E4%BE%8B"
										class="a1">京东2016秋季校园招聘笔试</a>
								</p>
								<p class="apply-top">
									&nbsp;
								</p>
								<p class="apply-time">
									<a
										href="https://njhxzy.weicewang.com/home/article/100044?category=%E5%AE%A2%E6%88%B7%E6%A1%88%E4%BE%8B"
										class="a2"> 2015-12-01 18:00</a>
								</p>
								<p class="apply-time">
									&nbsp;
								</p>
								<p class="apply-time">
									<a
										href="https://njhxzy.weicewang.com/home/article/100044?category=%E5%AE%A2%E6%88%B7%E6%A1%88%E4%BE%8B"
										class="a3">京东2016秋季校园招聘笔试于2015年9月20日&nbsp;
										开始启动，分两个批次，给50000多名候选人发送了邀请，实际完成 [ <span class="apply-a"
										href="#"><span class="a4">详情</span>
									</span> ] </a>
								</p>
							</div>
							<p class="apply-top">
								<a
									href="https://njhxzy.weicewang.com/home/article/100044?category=%E5%AE%A2%E6%88%B7%E6%A1%88%E4%BE%8B"
									class="a1">&nbsp;</a>
							</p>
						</div>
						<div id="m3-2">
							<p>
								<a href="#"><img src="/examination/page/main/images/xue.jpg"
										width="298" height="160" />
								</a>
							</p>
							<div id="m3-2-1">
								<p class="apply-top">
									&nbsp;
								</p>
								<p class="apply-top">
									<a
										href="https://njhxzy.weicewang.com/home/article/100056?category=%E5%AE%A2%E6%88%B7%E6%A1%88%E4%BE%8B"
										class="a1">南通全市党员“两学一做”答题 … </a>
								</p>
								<p class="apply-top">
									&nbsp;
								</p>
								<p class="apply-time">
									<a
										href="https://njhxzy.weicewang.com/home/article/100056?category=%E5%AE%A2%E6%88%B7%E6%A1%88%E4%BE%8B"
										class="a2">&nbsp; 2016-07-01 10:30</a>
								</p>
								<p class="apply-time">
									&nbsp;
								</p>
								<p class="apply-detail">
									<a
										href="https://njhxzy.weicewang.com/home/article/100056?category=%E5%AE%A2%E6%88%B7%E6%A1%88%E4%BE%8B"
										class="a3">南通全市66000多人参与“两学一做”答题， 本次活动由市委组织部主办，南通日报社承办，
										新华书店协办，微测网提供技术支持 … [ <span class="apply-a" href="#"><span
											class="a4">详情</span>
									</span> ] </a>
								</p>
							</div>
							<p class="apply-top">
								&nbsp;
							</p>
							<p class="apply-top">
								<a
									href="https://njhxzy.weicewang.com/home/article/100056?category=%E5%AE%A2%E6%88%B7%E6%A1%88%E4%BE%8B"
									class="a1">&nbsp;</a>
							</p>
							<p>
								&nbsp;
							</p>
						</div>
						<div id="m3-3">
							<p>
								<a href="#"><img
										src="/examination/page/main/images/renshou.jpg" width="298"
										height="160" />
								</a>
							</p>
							<div id="m3-3-1">
								<div id="m3-4">
									<p class="apply-top">
										&nbsp;
									</p>
									<p class="apply-top">
										<a
											href="https://njhxzy.weicewang.com/home/article/100031?category=%E5%AE%A2%E6%88%B7%E6%A1%88%E4%BE%8B"
											class="a1">泰康人寿培训考试采用微测网</a>
									</p>
									<p class="apply-time">
										&nbsp;
									</p>
									<p class="apply-time">
										<a
											href="https://njhxzy.weicewang.com/home/article/100031?category=%E5%AE%A2%E6%88%B7%E6%A1%88%E4%BE%8B"
											class="a2">&nbsp; 2017-08-10 14:30</a>
									</p>
									<p class="apply-time">
										&nbsp;
									</p>
									<p class="apply-detail">
										<a
											href="https://njhxzy.weicewang.com/home/article/100031?category=%E5%AE%A2%E6%88%B7%E6%A1%88%E4%BE%8B"
											class="a3">泰康人寿拥有非常完善的内部培训体系，为了 更好更快的对培训效果进行评估和考核，泰康采
											用了微测网的的移动考试服务 … [ <span class="apply-a" href="#"><span
												class="a4">详情</span>
										</span> ] </a>
									</p>
									<p>
										&nbsp;
									</p>
								</div>
							</div>
							<p class="apply-top">
								&nbsp;
							</p>
							<p class="apply-top">
								<a
									href="https://njhxzy.weicewang.com/home/article/100031?category=%E5%AE%A2%E6%88%B7%E6%A1%88%E4%BE%8B"
									class="a1">&nbsp;</a>
							</p>
						</div>
						<p>
							&nbsp;
						</p>
					</div>
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
