/*============loginBar start======================
	登陆条调用方法：
	var pageRefresh=false     //登录成功或者退出成功刷新页面,不需要刷新可省略（Boolean）
	InitLoginBar({
		id:         "topBar", //登录条显示位置ID（String）
		template:   0,        //登陆条风格 0为白色、1为红色（Nummber）
		game:       true,     //是否显示游戏（Boolean）
		slideMenu1: true,     //是否显示网站导航（Boolean）
		slideMenu2: true,     //是否显示社区导航（Boolean）
		sousuo:     true,     //是否显示搜索（Boolean）
		addNav:     null,     //[['文字','连接']],[['文字','连接']]...（Array）
		addStyle:   null      //补充样式（String）
	});
*/

var InitLoginBar = function (options) {
    //补充样式、模版样式整合处理
    var templateSet = new Array;
    templateSet[0] = "";
    templateSet[1] = ".loginBar .login-main{background-color:#c5020d;}.loginBar a,.loginBar a:hover,.loginBar a:visited{color:#fff;}.loginBar{color:#fff;border:none;}.loginBar .open,.loginBar .tixing.open{background-color:#ee000d;color:#fff;border-color:#a5010a;box-shadow:0 0 4px #9b0008}.loginBar .exit:hover{color:#fff;}.loginBar .sanjiao{background-position:-13px -94px}.loginBar .login-btn{height:38px;line-height:38px;background-color:#e2000c;}.tixing .highlight, .sms-btn .highlight{background:#fcff00;color:#c4020d;}.tixing span, .sms-btn span{background:#a50007;color:#cbcac8;}";
    var num = options.template;
    if (num > templateSet.length - 1 || num == undefined || num == null) {
        var txt = "风格可选值为0到" + (templateSet.length - 1) + "\n\n系统以为您选择默认风格";
        alert(txt);
        num = 0;
    }
    style = templateSet[num] + (options.addStyle ? options.addStyle : "");
    //新增导航连接处理
    var addLink = ["<a target='_self' class='addfavorite' href=\"javascript:TX.AddFavorite('http://www.tiexue.net','军事-中国军事-军事新闻-铁血网 - 原创第一军事门户');\">收藏铁血</a>", "<a target='_blank' href='http://www.tiexue.net/mobile/'>手机版</a>"];
    if (options.addNav) {
        for (n = 0; n < options.addNav.length; n++) {
            addLink.push("<a href='" + options.addNav[n][1] + "' target='blank'>" + options.addNav[n][0] + "</a>");
        }
    }
    //登陆条默认样式
    var logincss = '<style type="text/css">.loginBar input{outline:0}.loginBar{width:100%;font-family:"Microsoft YaHei", "微软雅黑", "宋体";min-width:960px;height:38px;border-bottom:solid 1px #dadada;color:#535353}.loginBar .login-main{height:38px;_overflow:hidden;line-height:38px;background:#f3f3f3}.box_w{width:960px;min-height:38px;_height:38px;margin:0 auto}.usercenter img{border-radius:50%;margin-top:3px;}.usercenter .hd-menu{_overflow:hidden;}.loginBar .menu-box{_width:83px;position:relative;z-index:100}.loginBar .layer .s{position:relative}.loginBar .layer .s em{display:block;position:absolute;right:11px;top:13px;width:4px;height:7px;background:url(http://r.itiexue.net/tiexue/public/tx-icon.gif) no-repeat}.loginBar .sanjiao{-webkit-transition:all .25s ease 0s;-moz-transition:all .25s ease 0s;-o-transition:all .25s ease 0s;transition:all .25s ease 0s;width:8px;height:4px;overflow:hidden;background:url(http://r.itiexue.net/tiexue/public/tx-icon.gif) no-repeat 0 -94px;position:absolute;right:9px;top:16px;z-index:10}.loginBar .layer{width:83px;position:absolute;top:38px;background:#fff;border:solid 1px #cdcdcd;box-shadow:0 3px 4px #ddd;display:none}.loginBar .sms-box{width:135px;}.loginBar .topBarLeft .layer{left:-1px;}.loginBar .topBarRight .layer{right:-1px;}.loginBar .layer li{float:left;width:100%}.loginBar .layer a{display:block;height:32px;line-height:32px;padding:0 10px;color:#535353 !important}.loginBar .layer span{display:block;border-bottom:dotted 1px #d7d7d7}.loginBar .layer a:hover{background:#f2f2f2;text-decoration:none;color:#535353}.loginBar .layer a:hover span{border:0;padding-bottom:1px}.loginBar .open .sanjiao{-webkit-transform:rotate(180deg);-moz-transform:rotate(180deg);-o-transform:rotate(180deg);transform:rotate(180deg);}.loginBar .open,.loginBar .open .open{background:#fff;border-left:solid 1px #d3d3d3;border-right:solid 1px #d3d3d3;position:relative;margin:0 -1px;*margin:0;box-shadow:0 0 4px #ccc}.loginBar .open .layer,.loginBar .open .open ul,.loginBar .loginbox-select .login-box{display:block}.loginBar .layer li ul{position:absolute;text-align:center;left:83px;top:0;width:80px;display:none;background:#fff;border:solid 1px #cdcdcd;box-shadow:4px 4px 4px #eee}.loginBar .slideMenu1 li ul{width:104px}.loginBar .slideMenu1 .layer{width:95px}.loginBar .slideMenu1 li ul{left:95px}.loginBar .addLink{position:relative;z-index:55;}.loginBar .addLink a{padding:0 5px 0 10px}.loginBar .loginbox{position:relative;z-index:100}.loginBar .login-btn{width:64px;height:40px;line-height:40px;text-align:center;color:#fff;text-decoration:none;background:#c5020d;border-bottom:solid 3px #a20009;cursor:pointer}.loginBar .loginbox-select .login-btn{background:#a20009;border-bottom:solid 3px #830007}.loginBar .login-box a{color:#000 !important}.loginBar .login-box{position:absolute;left:-87px;top:41px;color:#000;width:274px;min-height:150px;padding:25px 0 20px;background:#fff;border:solid 1px #cdcdcd;box-shadow:0 0 8px #cdcdcd;display:none;overflow:hidden;z-index:999999}.loginBar .login-box .form-list{position:relative;height:30px;width:210px;margin:0 auto 10px;border:solid 1px #ddd;overflow:hidden;text-align:center}.loginBar .login-box div label{position:absolute;left:5px;top:8px;line-height:normal;color:#888;z-index:0}.loginBar .login-box div input{width:205px;position:absolute;left:0;top:0;padding:0 2px;height:30px;line-height:30px;border:0;background:#fff;opacity:.5;filter:alpha(opacity=50)}#valaCode{overflow:hidden;zoom:1;margin-bottom:10px}.loginBar .login-box p{width:210px;margin:0 auto 10px;overflow:hidden;zoom:1;clear:both;line-height:25px}.loginBar .login-box p input{margin-top:5px;*margin-top:0}.loginBar .login-box p span{padding-left:5px;cursor:pointer}.loginBar .login-box .yzm-btn{float:left;overflow:hidden;width:15px;height:19px;background:url(http://r.itiexue.net/tiexue/public/tx-icon.gif) no-repeat 0 -61px;line-height:0;font-size:0;margin:7px 0 0 8px;_display:inline;cursor:pointer}.loginBar .login-submit{display:block;width:210px;margin:0 auto;height:28px;line-height:28px;text-align:center;background:#c5020d;border:solid 1px #9c0009;color:#fff;font-weight:bold;cursor:pointer}.loginBar .zhuce-btn{margin:0 20px 0 30px;display:inline}.loginBar .hd-menu{display:block;height:38px;padding:0 24px 0 11px;position:relative;}.loginBar .sms-btn{_width:50px;white-space:nowrap;display:block;}.loginBar .exit{margin:0 12px;display:inline;cursor:pointer}.loginBar .exit:hover{color:#9e0000;text-decoration:underline}.loginBar .usercenter .layer{width:100%;text-align:center}.loginBar .usercenter .layer ul{left:100%;}.loginBar .sms-box em{float:right;padding:0 5px;*position:absolute;*right:5px;*margin-top:-7px;}.topsearch{display:none;width:122px;height:23px;background:#fff;margin:6px 0 0 20px;line-height:23px;border:0;position:relative;overflow:hidden}.topsearch input{position:absolute;left:2px;top:0;width:80px;height:23px;line-height:23px;float:left;border:0}.topsearch span{position:absolute;right:0;top:0;height:23px;text-align:center;background:#8f0000;color:#fff;width:37px;cursor:pointer}.sms-btn span{display:inline-block;background:#e3e3e3;color:#a4a4a4;padding:0 6px;line-height:normal;border-radius:4px;margin-left:5px}.sms-btn .highlight{background:#c6020e;color:#fff}._wx_login{  cursor:pointer; display:block; float:left;padding-left:35px; color:#02ba04; margin-right:15px; background:url(http://r.itiexue.net/global/images/wxicon.png) no-repeat scroll left center /24px 24px; }' + style + '.other_log{line-height:30px !important;    margin: 10px auto 0 !important;} .other_log img{width:30px;vertical-align:top; cursor: pointer;margin-right: 5px;} </style>';

    //登陆条功能模块--适用BBS首页
    var slideMenu1 = options.slideMenu1 ? '<div class="menu-box float_L slideMenu1"> <a class="hd-menu" href="http://www.tiexue.net/" target="_blank">网站导航<em class="sanjiao"></em></a><ul class="layer"><li><a target="_blank" href="http://www.tiexue.net/"><span>网站首页</span></a></li><li class="s"><a target="_blank" href="http://mil.tiexue.net/"><span>军事</span></a><em></em><ul>' + $("#subNav>ul:eq(1)").html() + '</ul></li><li class="s"><a target="_blank" href="http://bbs.tiexue.net/"><span>社区</span></a><em></em><ul>' + $("#subNav>ul:eq(2)").html() + '</ul></li><li class="s"><a target="_blank" href="http://book.tiexue.net/"><span>读书</span></a><em></em><ul>' + $("#subNav>ul:eq(4)").html() + '</ul></li><li class="s"><a target="_blank" href="http://www.tiexue.net/ShowPicClass_53_1.html"><span>图片</span></a><em></em><ul>' + $("#subNav>ul:eq(5)").html() + '</ul></li><li class="s"><a target="_blank" href="http://jingcha.tiexue.net/"><span>警察</span></a><em></em><ul>' + $("#subNav>ul:eq(6)").html() + '</ul></li><li class="s"><a target="_blank" href="http://game.tiexue.net/"><span>游戏</span></a><em></em><ul>' + $("#subNav>ul:eq(7)").html() + '</ul></li><li class="s"><a target="_blank" href="http://www.liangada.cn/?utm_source=txs&utm_medium=hysyxld&utm_campaign=shouye"><span>铁血君品行</span></a><em></em><ul>' + $("#subNav>ul:eq(9)").html() + '</ul></li> <li><a target="_blank" href="http://custom.tiexue.net/"><span>帮助</span></a></li></ul></div>' : '';
    var slideMenu2 = options.slideMenu2 ? '<div class="menu-box float_L slidemenu2"> <a href="http://bbs.tiexue.net" target="_blank" class="hd-menu">社区导航<em class="sanjiao"></em></a><ul class="layer"><li class="s"><a href="http://bbs.tiexue.net/gbbs6-0-1.html" target="_blank"><span>军事论坛</span></a><em></em><ul><li><a href="http://bbs.tiexue.net/bbs32-0-1.html" target="_blank">陆军论坛</a></li><li><a href="http://bbs.tiexue.net/bbs31-0-1.html" target="_blank">海军论坛</a></li><li><a href="http://bbs.tiexue.net/bbs69-0-1.html" target="_blank">空军论坛</a></li><li><a href="http://bbs.tiexue.net/bbs219-0-1.html" target="_blank">君品鉴赏</a></li><li><a href="http://bbs.tiexue.net/bbs79-0-1.html" target="_blank">君品置换</a></li><li><a href="http://bbs.tiexue.net/bbs283-0-1.html" target="_blank">老兵公益</a></li><li><a href="http://bbs.tiexue.net/bbs172-0-1.html" target="_blank">一二战史</a></li><li><a href="http://bbs.tiexue.net/bbs171-0-1.html" target="_blank">尖端科技</a></li><li><a href="http://bbs.tiexue.net/bbs124-0-1.html" target="_blank">军事影评</a></li></ul></li><li class="s"><a href="http://bbs.tiexue.net/gbbs22-0-1.html" target="_blank"><span>国际论坛</span></a><em></em><ul><li><a href="http://bbs.tiexue.net/bbs33-0-1.html" target="_blank">环球风云</a></li><li><a href="http://bbs.tiexue.net/bbs206-0-1.html" target="_blank">图说海外</a></li></ul></li><li class="s"><a href="http://bbs.tiexue.net/gbbs8-0-1.html" target="_blank"><span>历史风云</span></a><em></em><ul><li><a href="http://bbs.tiexue.net/bbs73-0-1.html" target="_blank">中国历史</a></li><li><a href="http://bbs.tiexue.net/bbs74-0-1.html" target="_blank">世界历史</a></li><li><a href="http://bbs.tiexue.net/bbs172-0-1.html" target="_blank">一二战史</a></li><li><a href="http://bbs.tiexue.net/bbs66-0-1.html" target="_blank">历史贴图</a></li></ul></li><li class="s"><a href="http://bbs.tiexue.net/gbbs5-0-1.html" target="_blank"><span>社会万象</span></a><em></em><ul><li><a href="http://bbs.tiexue.net/bbs68-0-1.html" target="_blank">社会聚焦</a></li><li><a href="http://bbs.tiexue.net/bbs155-0-1.html" target="_blank">国货当自强</a></li><li><a href="http://bbs.tiexue.net/bbs114-0-1.html" target="_blank">职场人生</a></li><li><a href="http://bbs.tiexue.net/bbs214-0-1.html" target="_blank">学生时代</a></li><li><a href="http://bbs.tiexue.net/bbs203-0-1.html" target="_blank">谈股论金</a></li><li><a href="http://bbs.tiexue.net/bbs125-0-1.html" target="_blank">社会贴图</a></li><li><a href="http://bbs.tiexue.net/bbs173-0-1.html" target="_blank">娱乐八卦</a></li></ul></li><li class="s"><a href="http://bbs.tiexue.net/gbbs24-0-1.html" target="_blank"><span>警察之家</span></a><em></em><ul><li><a href="http://bbs.tiexue.net/bbs251-0-1.html" target="_blank">警察故事</a></li><li><a href="http://bbs.tiexue.net/bbs252-0-1.html" target="_blank">警用装备</a></li><li><a href="http://bbs.tiexue.net/bbs253-0-1.html" target="_blank">警务探讨</a></li><li><a href="http://bbs.tiexue.net/bbs254-0-1.html" target="_blank">警事聚焦</a></li><li><a href="http://bbs.tiexue.net/bbs255-0-1.html" target="_blank">便民咨询</a></li></ul></li><li class="s"><a href="http://bbs.tiexue.net/gbbs23-0-1.html" target="_blank"><span>吃喝玩乐</span></a><em></em><ul><li><a href="http://bbs.tiexue.net/bbs246-0-1.html" target="_blank">四海钓鱼</a></li><li><a href="http://bbs.tiexue.net/bbs258-0-1.html" target="_blank">钓鱼技巧</a></li><li><a href="http://bbs.tiexue.net/bbs247-0-1.html" target="_blank">人间美食</a></li><li><a href="http://bbs.tiexue.net/bbs286-0-1.html" target="_blank">骑行天下</a></li><li><a href="http://bbs.tiexue.net/bbs248-0-1.html" target="_blank">网友自拍</a></li><li><a href="http://bbs.tiexue.net/bbs249-0-1.html" target="_blank">摄影艺术</a></li></ul></li><li><a href="http://bbs.tiexue.net/bbs239-0-1.html" target="_blank"><span>男人情感</span></a></li></ul></div>' : '';
    var game = options.game ? '<div id="gameBox" class="menu-box float_R"><a href="http://game.tiexue.net/" target="_blank" class="game-btn hd-menu">游戏<em class="sanjiao"></em></a></div>' : '';
    var sousuo = options.sousuo ? '<div class="float_R topsearch" id="sTxt"><input type="text" name="searchBaidu" id="searchBaidu"><span onclick="TxSearch()">搜索</span></div><a id="sBtn" href="javascript:" target="_self" class="float_R" style="margin-left:20px;" onclick="$(\'#sTxt\').show();$(this).hide();">搜索</a>' : '';

    //登陆条结构
    var url = String(window.location);
    var url_1 = url.indexOf("post_");
    var url_2 = url.indexOf("post2_");
    var monitor = "";
    if (url_1 > 0) { monitor = "onclick=\"_gaq.push(['_trackPageview', '/xuni/posttop/register.aspx'])\"" }
    if (url_2 > 0) { monitor = "onclick=\"_gaq.push(['_trackPageview', '/xuni/post2top/register.aspx'])\"" }
    var loginhtml = '<div class="loginBar"><div class="login-main"><div class="box_w"><div class="float_L topBarLeft">' + slideMenu1 + slideMenu2 + '<div class="float_L addLink">' + addLink.join("") + '<a href="javascript:void(0)" target="_self" onmouseover="$(this).next(\'.qrCode\').show();$(\'#wxewm\').attr(\'src\',\'http://r.itiexue.net/tiexue/wwwindex/tx_qrcode.jpg\')" onmouseout="$(this).next(\'.qrCode\').hide()">微信订阅</a><div class="qrCode" style="background:#fff;color:#666;border:1px solid #ddd;display:none;padding:13px 13px 5px;line-height:20px;position:absolute;right:-66px;text-align:center;top:37px;width:145px;box-shadow:0 0 3px #ddd;"><i style="display:block;width:0;height:0;overflow:hidden;position:absolute;left:45%;top:-5px;border-style:solid;border-width:0 5px 5px;border-color:#fff transparent #fff"></i><img src="http://r.itiexue.net/global/images/alpha0.gif" id="wxewm" width="140" height="140" />扫一扫,铁血军事一手掌握</div></div></div><div class="float_R topBarRight">' + sousuo + '<div class="float_R menu-box"><a href="http://custom.tiexue.net/" target="_blank" class="hd-menu">帮助<em class="sanjiao"></em></a><ul class="layer"><li><a href="http://custom.tiexue.net/QuestionDetails.aspx?QuesID=24" target="_blank"><span>注册账号</span></a></li><li><a href="http://custom.tiexue.net/QuestionDetails.aspx?QuesID=33" target="_blank"><span>绑定邮箱 </span></a></li><li><a href=" http://custom.tiexue.net/QuestionDetails.aspx?QuesID=29" target="_blank"><span>忘记密码 </span></a></li><li><a href="http://custom.tiexue.net/QuestionDetails.aspx?QuesID=41" target="_blank"><span>铁血金币 </span></a></li><li><a href="http://custom.tiexue.net/QuestionDetails.aspx?QuesID=34" target="_blank"><span>论坛工分 </span></a></li><li><a href="http://custom.tiexue.net/QuestionDetails.aspx?QuesID=67" target="_blank"><span>铁血军功 </span></a></li><li><a href="http://custom.tiexue.net/QuestionDetails.aspx?QuesID=70" target="_blank"><span>勋章奖章 </span></a></li><li><a href="http://custom.tiexue.net/QuestionDetails.aspx?QuesID=55" target="_blank"><span>发表主贴 </span></a></li><li><a href="http://custom.tiexue.net/QuestionDetails.aspx?QuesID=54" target="_blank"><span>如何回复 </span></a></li><li><a href="http://custom.tiexue.net/QuestionDetails.aspx?QuesID=74" target="_blank"><span>铁血原创 </span></a></li></ul></div>' + game + '<div id="loginBefor" class="float_R"><div class="loginbox float_L" onClick="loginLayer(this,event)"> <span class="login-btn float_L">登录</span><div class="login-box" onClick="doSomething(event)"><div id="error" style="display:none; line-height:25px; width:200px; padding:0 5px; margin:0 auto 10px; background:#ffeed4; border:solid 1px #f3ddbc; color:#c5020d;"></div><div class="form-list"><label>用户名/邮箱/手机号</label><input type="text" id="txtUserName" /></div><div class="form-list"><label>请输入密码</label><input type="password" id="txtUserPassword" onKeyUp="TX.EnterSubmit(event,LoginIn);" /></div><div id="valaCode"><div class="float_L form-list" style="width:85px; margin: 0 0 0 31px;_display:inline;"><label>验证码</label><input type="text" id="txtLoginValidate" style="width:80px" /></div><img width="90" height="30" onClick="TX.RefreshValidCode()" id="ValidateCodeImg" class="float_L yzm-img" style="margin-left:10px; border:solid 1px #ddd;" /> <span class="yzm-btn" onClick="TX.RefreshValidCode()">刷新</span> </div><p><label class="float_L"><input type="checkbox" class="float_L" /><span class="float_L">下次自动登录</span></label><a href="http://reg.tiexue.net/FindPassWord.aspx" target="_blank" class="float_R">忘记密码?</a> </p><div class="login-submit" onClick="LoginIn()">登 录</div> <p class="other_log">其他帐号登录： <img src="http://r.itiexue.net/global/images/icon/qq1.png" title="qq登录" onclick="openQQ();"/> <img src="http://r.itiexue.net/global/images/icon/weixin1.png" title="微信登录"  onclick="openWindow();"/></p>  </div></div><a href="http://reg.tiexue.net/register.aspx" target="_blank" class="float_L zhuce-btn" ' + monitor + '>注册</a> </div><div id="loginLater" class="float_R"></div></div></div></div></div>';
    $("#" + options.id).html(logincss + loginhtml);
    if (TX.BaseCookie.BBS_CurrentUserID() > 0) {
        $("._wx_login").html("微信绑定");
    }
    //游戏
    var gamelist = [];
    if (options.game) {
        gamelist = gamelist.concat(TX.GameLink());
        $("#gameBox").append(gamelist.join(""));
        $("#ui_game_layer").addClass("layer");
    } else {
        $(".game-btn .sanjiao").hide();
        $(".game-btn").css("padding", "0 10px");
        $("#gameBox").removeAttr("onmouseover");
    }
    //登录框状态
    $(".form-list input").each(function () {
        $(this).focus(function () {
            $(this).css("opacity", 1);
            $(this).parent().css("border", "solid 1px #ff7000");
        }).blur(function () {
            if (this.value == "") {
                $(this).css("opacity", 0.5);
            } else {
                $(this).css("opacity", 1);
            }
            $(this).parent().css("border", "solid 1px #ddd");
        }).triggerHandler("blur");
    });
    ResetUserLoginStatus();

}
//打开微信扫码新窗口
function openWindow() {
    var url = encodeURIComponent(window.location.href);
    if (TX.BaseCookie.BBS_CurrentUserID() <= 0) {
        var top = ($(window).height() - 550) / 2,
            left = ($(document).width() - 650) / 2;
        window.open('https://open.weixin.qq.com/connect/qrconnect?appid=wx7f3870c2639a8ee3&redirect_uri=http%3A%2F%2Fwx.sso.tiexue.net%2Fapi%2Fwxlogin%2Fqruserinfo&response_type=code&scope=snsapi_login&state=http%3A%2F%2Freg.tiexue.net%2Foauth%2Fwechat.aspx?rf=' + url + '"', '', 'height=550,width=650,top=' + top + ',left=' + left + ',toolbar=no,menubar=no');
    }
    else {
        window.location.href = 'http://i.tiexue.net/' + TX.BaseCookie.BBS_CurrentUserID() + '/safe.html';
    }
    return false
}



//搜索
function TxSearch() {
    var wordname = $("#searchBaidu");
    if ($.trim(wordname.val()) == "输入你想要输入的内容" || $.trim(wordname.val()) == "") {
        alert('搜索的内容不能为空！');
        wordname.select();
        return false;
    }
    window.open("http://www.baidu.com/baidu?word=" + wordname.val() + "&tn=bds&cl=3&ct=2097152&si=tiexue.net&s=on");
}
//二级菜单
$(document).on('mouseover','.menu-box,.s',function(){
	$(this).addClass('open');	
});
$(document).on('mouseout','.menu-box,.s',function(){
	$(this).removeClass('open');	
});
//登录层
function loginLayer(obj, evt) {
    if ($(obj).hasClass("loginbox-select")) {
        $(obj).removeClass("loginbox-select");
    } else {
        $(obj).addClass("loginbox-select");
    }
    doSomething(evt)
};
//阻止冒泡
function doSomething(evt) {
    var e = (evt) ? evt : window.event;
    if (window.event) {
        e.cancelBubble = true;
    } else {
        e.stopPropagation();
    }
}
$(document).click(function () {
    $(".loginbox").removeClass("loginbox-select");
});

//改变登录退出后界面的布局
function ResetUserLoginStatus() {
    try { 
		var TxTB_UserID = TX.BaseCookie.BBS_CurrentUserID(),
		TxTB_UserName = TX.BaseCookie.TxBBS_CurrentUserName();
	} catch (e) {}
    if (TxTB_UserID>0) {
        var loginLater = '<div class="float_L username"><span class="float_L">欢迎您，</span><div class="usercenter menu-box float_L" > <a href="http://i.tiexue.net/" target="_blank" class="hd-menu" title="' + TxTB_UserName + '"><span><img id="headPic" src="http://avatar.pic.itiexue.net/7352/7352278.jpg" width="31" height="31" /></span><em class="sanjiao"></em></a><ul class="layer"><li><a href="http://i.tiexue.net/threads.html" target="_blank"><span>文集</span></a></li><li><a href="http://i.tiexue.net/rank.html" target="_blank"><span>军功</span></a></li><li><a href="http://i.tiexue.net/follow.html" target="_blank"><span>关注</span></a></li><li><a href="http://i.tiexue.net/setting.html" target="_blank"><span>设置</span></a></li><li><a href="http://i.tiexue.net/safe.html" target="_blank"><span>安全</span></a></li><li class="s"><a href="http://pay.tiexue.net/Bank.aspx" target="_blank"><span>账户</span></a><em></em><ul><li><a href="http://pay.tiexue.net/Bank.aspx" target="_blank">银行账户</a></li><li><a href="http://pay.tiexue.net/" target="_blank">购买金币</a></li><li><a href="http://market.tiexue.net/" target="_blank">劳动力市场</a></li></ul></li></ul></div></div><div class="exit float_L" onClick="UserLogOut()">退出</div><div class="menu-box float_L" id="topMsg"><a target="_blank" href="http://message.tiexue.net" class="sms-btn hd-menu">消息<span id="smsNum">0</span></a><ul class="layer sms-box">\
		<li><a href="http://message.tiexue.net/remind/readnote.aspx" target="_blank"><span>评论我的<em id="n1">0</em></span></a></li>\
		<li><a href="http://message.tiexue.net/remind/atme.aspx" target="_blank"><span>@我的<em id="n2">0</em></span></a></li>\
		<li><a href="http://message.tiexue.net" target="_blank"><span>个人私信<em id="n3">0</em></span></a></li>\
		<li><a href="http://message.tiexue.net/ReadSysNote.aspx" target="_blank"><span>系统通知<em id="n4">0</em></span></a></li>\
		<li><a href="http://message.tiexue.net/remind/newremind.aspx" target="_blank"><span>新帖提醒<em id="n5">0</em></span></a></li>\
		<li><a href="http://i.tiexue.net/collectthreads.html" target="_blank"><span>收藏帖子<em id="n6">0</em></span></a></li>\
		<li><a href="http://i.tiexue.net/fans.html" target="_blank"><span>关注我的人<em id="n7">0</em></span></a></li>\
		</ul></div>';
        $("#loginBefor").hide();
        $("#error").hide();
        $("#loginLater").html(loginLater).show();
		
		//消息
		$.getJSON("http://message.tiexue.net/out/gettopcount.aspx?v="+TX.getRandom()+"&callback=?", function (data) {
			var num=data[0].tolNum;
			if(num>0){
				$("#smsNum").text(num>99?'99+':num).addClass('highlight');	
			}
			else {
				$("#smsNum").removeClass('highlight');
			}
		});
		$("#topMsg").one('mouseover',function(){
			$.getJSON("http://message.tiexue.net/out/getmessage.aspx?v="+TX.getRandom()+"&callback=?", function (data) {
				function r(n){if(n>99){return '99+'}return n}
				var remNum = data[0].remNum,
					atmNum = data[0].atmNum,
					sinNum = data[0].sinNum,
					sysNum = data[0].sysNum,
					newNum = data[0].newNum,
					colNum = data[0].colNum,
					friNum = data[0].friNum;
					remNum?$("#n1").text(r(remNum)).addClass('coloRed2'):'';
					atmNum?$("#n2").text(r(atmNum)).addClass('coloRed2'):"";
					sinNum?$("#n3").text(r(sinNum)).addClass('coloRed2'):"";
					sysNum?$("#n4").text(r(sysNum)).addClass('coloRed2'):"";
					newNum?$("#n5").text(r(newNum)).addClass('coloRed2'):"";
					colNum?$("#n6").text(r(colNum)).addClass('coloRed2'):"";
					friNum ? $("#n7").text(r(friNum)).addClass('coloRed2') : "";
					$('#smsNum').text(r(remNum + atmNum + sinNum + sysNum + newNum + colNum + friNum));
			});	
		});
		//头像格式处理
		var cookie_Head=TX.BaseCookie.GetCookie('uicon'),cookie_Id,cookie_pic;
		if(cookie_Head){
			if(cookie_Head.split(':')[0]!=TxTB_UserID){
				$.getJSON("http://i.tiexue.net/XmlHttp/seticon.aspx?callback=?", function (data) {})
			}
			setTimeout(function(){
				cookie_Head=TX.BaseCookie.GetCookie('uicon');
				cookie_Id=cookie_Head.split(':')[0];
				cookie_pic=cookie_Head.split(':')[1];
			},300);
		}else{
			$.getJSON("http://i.tiexue.net/XmlHttp/seticon.aspx?callback=?", function (data) {});
			setTimeout(function(){
				cookie_Head=TX.BaseCookie.GetCookie('uicon');
				cookie_Id=cookie_Head.split(':')[0];
				cookie_pic=cookie_Head.split(':')[1];
			},300);
		}
		setTimeout(function(){
			$('#headPic').attr({src:'http://avatar.pic.itiexue.net/'+Math.floor(TxTB_UserID/1000)+'/'+TxTB_UserID+'.'+cookie_pic+'?'+TX.getRandom()});
		},400);
    }
    else {
        $("#loginBefor").show();
        $("#loginLater").html("").hide();
        $("#valaCode").hide();
        $("#txtUserName").val("");
        $("#txtUserPassword").val("");
        $(".bottomLogin").hide();
	}
}


//css3动画
function css3_shake(){
	$('.login-box').addClass('shake');
	setTimeout(function(){$('.login-box').removeClass('shake')},1000)
}
//登录
function LoginIn() {
    var userName = $("#txtUserName");
    var passWord = $("#txtUserPassword");
    if (userName.val().length < 1) { $("#error").text("用户ID不能为空").show();css3_shake(); userName.focus(); return; }
    else if (passWord.val().length < 1) { $("#error").text("密码不能为空").show();css3_shake(); passWord.focus(); return; }
    $.getJSON('http://reg.tiexue.net/XmlHttp/IsProtectedUser.aspx?username=' + escape(userName.val()) + '&callback=?', function (data) {
        if (data == "1") {
            TX.ShowProtectedUserAlert();
            userName.focus();
            return false;
        }
        else {
            if ($("#valaCode").is(":visible")) {
                var txtLoginValidate = $("#txtLoginValidate");
                if (txtLoginValidate.val().length < 1) { $("#error").text("验证码不能为空").show();css3_shake(); txtLoginValidate.focus(); return; }
                TX.UserLogin(userName.val(), passWord.val(), 365, true, txtLoginValidate.val());
            } else {
                TX.UserLogin(userName.val(), passWord.val(), 365, false, "");
            }
            $('.login-submit').text('登录中...');
        }
    });
}
//获取用户的行为
function GetUserAction(uid, classid) {
    $.ajax({
        type: "get",
        url: "http://www.tiexue.net/xmlhttp/GetUserAction.aspx",
        data: { UserName: escape(uid), ClassID: escape(classid) },
        error: function () { },
        success: function () { }
    });
}
//退出
function UserLogOut() {
    //TX.BaseCookie.ClearCookie("UserID");
    TX.UserLogout();
    $("#loginBefor").show();
    $("#loginLater").html("").hide();
    $("#valaCode").hide();
    $("#txtUserName").val("").triggerHandler("blur");
    $("#txtUserPassword").val("").triggerHandler("blur");
}
var pageRefresh = null;
//退出回调
function Tx_LogoutFinish(Flags) {
    if (pageRefresh) {//如果为真刷新页面
        window.top.location.href = window.top.location;
    }
}
//快速登录回调
function TxBackFn(){
	if(typeof TX.BackFn == "function"){
		TX.BackFn();
		TX.BackFn=null;
	}
}
var loginBarType = 1;
function Tx_LoginFun(value) {
    if (!TX.LibraryTool.StringIsNullOrEmpty(value)) {
        $('.login-submit').text('登录');
        $('#popLoginBtn').val('登录');
        var result = value.split('|');
        if (result[0] == "true") {
            ResetUserLoginStatus();
            if ($("#pubLayer_Msg").length) {
				TX.PopLayer.CloseLayer("pubLayer_Msg",TxBackFn);
			}
            if (TX.WeakPasswordFlag) {
                TX.ShowPsdMsg()
            }
            if (pageRefresh) {//如果为真刷新页面
                window.top.location.href = window.top.location;
            }
        } else {
            switch (loginBarType) {
                case 1://顶部登陆层
                    if (result[1].indexOf('您的账户已经被锁定') != -1) {
                        $("#error").text(result[1]).show();
                        $("#valaCode").hide();
                    }
                    else if (result[1].indexOf('验证码') != -1) {
                        if (result[1] == "未输入验证码") {
                            $("#error").text("验证码错误").show();
                        }
                        else {
                            $("#valaCode").show();
                            $("#error").text("密码错误，您还有（4）次输入机会！").show();
                        }
                    }
                    else {
                        $("#error").text(result[1]).show();
                    }
                    TX.RefreshValidCode();
					css3_shake();
                    break;
                case 3://新版弹出层快速登录
                    if (result[1].indexOf('您的账户已经被锁定') != -1) {
                        $("#poperror").text(result[1]);
                    }
                    else if (result[1].indexOf('验证码') != -1) {
                        if (result[1] == "未输入验证码") {
                            $("#poperror").text("验证码错误");
                        }
                        else {
                            $("#poperror").text("密码错误，您还有（4）次输入机会！");
                        }
                    }
                    else {
                        $("#error").text('密码错误，请半小时后再尝试输入');
                    }
                    break;
            }
        }
    }
}
/*========================loginBar end==========================*/


//所有选项卡
function tabLayer2(obj) { TX.TabSpace({ id: obj, eventStyle: "mouseover", notClassName: "noLayer", tabStyle: "select", effect: 1, delay: true, loadImg: true }); }
/*================生成底部导航start====================*/
var CreateFooter = function (Node) {
    if ($("#footer").length > 0) {
        var $footer = $("#footer");
    } else {
        var $footer = $(".footer");
    }
    switch (Node) {
        case "about":
            $footer.prepend('<a href="http://www.tiexue.net/company/" target="_blank">关于铁血</a><span>|</span><a href="http://www.tiexue.net/company/contact.htm" target="_blank">广告洽谈</a><span>|</span><a href="http://www.tiexue.net/company/products.htm" target="_blank">旗下产品</a><span>|</span><a href="http://www.tiexue.net/company/hr.htm" target="_blank">招贤纳士</a><span>|</span><a href="http://www.tiexue.net/company/contact.htm" target="_blank">值班客服</a><span>|</span><a href="http://www.tiexue.net/company/disclaimer.htm" target="_blank">免责声明</a><span>|</span><a href="http://www.tiexue.net/company/report.htm" target="_blank">侵权举报</a><span>|</span><a href="http://www.tiexue.net/mobile/" target="_blank">手机上铁血</a>');
            break;
        case "version":
            $footer.append('<br />铁血社区 Ver2.3 铁血网版权所有2001-2015');
            break;
        case "law":
            $footer.append('<br />网站法律顾问：北京市尚公律师事务所 刘容律师');
            break;
        case "record":
            $footer.append('<br />京ICP证050083号 京ICP备09067787 <a href="http://www.tiexue.net/Images/0607-095.jpg">京网文 [2015] 0367-147号</a> <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010802020016" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img src="http://img9.itiexue.net/2213/22133637.jpg" style="float:left;"/>京公网安备 11010802020016号</a> <a href="http://www.tiexue.net/Images/0110-181.jpg">新出网许（京）字181号</a> <a href="http://www.tiexue.net/Images/0110-697.jpg">互联网药品信息服务资格证书 (京)经营性-2013-0015</a>');
            break;
        case "recordJunshihsu":
            $footer.append('<br />京ICP证050083号 京ICP备09067787号-8 <a href="http://www.tiexue.net/Images/0607-095.jpg">京网文 [2015] 0367-147号</a> <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010802020821" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img src="http://img9.itiexue.net/2213/22133637.jpg" style="float:left;"/>京公网安备 11010802020821号</a>');
            break;
        default:
            alert(Node + "不正确");
            break;
    }
}
/*================生成底部导航end====================*/

/*================签到相关start====================*/
var cale, fm = 0;//fm = 0为www首页 1为论坛 2为个人中心
var signfn = {
    //初始化签到状态
    init: function () {
        jQuery.ajax({
            url: "http://i.tiexue.net/sign/Load.aspx?f=" + fm,
            type: "GET",
            cache: false,
            dataType: "jsonp",
            error: function (XMLHttpRequest, textStatus, errorThrown) { },
            success: function (data) {
                if (data.sign_code == 1) {
                    signfn.update(data)
                } else {
                    $('#signStatus').html('<span title="签到" class="signBtn">点击签到</span>');
                    $('.signBtn').on('click', function () { signfn.sign() });
                }
            }
        })
    },
    initNew: function () { //新版WWW暂时使用
        jQuery.ajax({
            url: "http://i.tiexue.net/sign/Load.aspx?f=" + fm,
            type: "GET",
            cache: false,
            dataType: "jsonp",
            error: function (XMLHttpRequest, textStatus, errorThrown) { },
            success: function (data) {
                if (data.sign_code == 1) {
                    signfn.update(data)
                } else {
                    $('#signStatus').html('<span title="签到" class="signBtn">签到</span>');
                    $('.signBtn').on('click', function () { signfn.sign() });
                }
                if (data.total >0) {
                    $('#signnum').text(data.total);//今日签到排名
                }
            }
        })
    },
    sign: function () {
        if (TX.BaseCookie.BBS_CurrentUserID() <= 0) { isnotlogin(); return }
        jQuery.ajax({
            url: "http://i.tiexue.net/sign/Post.aspx?f=" + fm,
            type: "post",
            dataType: "jsonp",
            beforeSend: function () {
                $('.signBtn').off('click');
            },
            error: function (e) {
                $('.signBtn').on('click', function () { signfn.sign });
            },
            success: function (data) {
                $('#qiandao-btn').show();
                switch (data.sign_code) {
                    case -2:
                        alert(data.sign_msg);
                        break;
                    case -1:
                        isnotlogin();
                        break;
                    case 1:
                        $('#peopleNum').text(Number($('#peopleNum').text()) + 1);//累计签到
                        $('#sign_tips').fadeIn(150);
                        signfn.update(data);
                }
            }
        })
    },
    patch: function (obj, y, m, d) {
        if (obj.className == 'sign_0' && window.confirm('是否确定补签，需花费25金币')) {
            jQuery.ajax({
                url: "http://i.tiexue.net/sign/buqian.aspx?f=9",
                data: { m: y + '-' + m + '-' + d },
                type: "GET",
                dataType: "jsonp",
                error: function (XMLHttpRequest, textStatus, errorThrown) { },
                success: function (data) {
                    switch (data.sign_code) {
                        case -2:
                            alert(data.sign_msg);
                            break;
                        case 0:
                            isnotlogin();
                            break;
                        case 1:
                            $(obj).removeClass().addClass('sign_1');
                            $('#total').text(data.sign_bu);//剩余补签次数
                            $('#sign_total').text(data.sign_total);//累计签到
                            $('#gold').text(data.gold);//金币数量
                            $('#sign_keep,#sign_keep_top').text(data.sign_keep);//连续签到
                            alert('补签成功');
                    }
                }
            })
        }
    },
    update: function (data) {
        var Class = { create: function () { return function () { this.initialize.apply(this, arguments) } } };
        Object.extend = function (destination, source) { for (var property in source) { destination[property] = source[property]; } return destination; }
        ; var Calendar = Class.create();
        Calendar.prototype = {
            initialize: function (container, options) {
                this.Container = document.getElementById(container); //table结构容器
                this.Days = []; //日期列表 
                this.SetOptions(options);
                this.Year = this.options.Year;
                this.Month = this.options.Month;
                this.SelectDay = this.options.SelectDay ? new Date(this.options.SelectDay) : null;
                this.onSelectDay = this.options.onSelectDay;
                this.onToday = this.options.onToday;
                this.onFinish = this.options.onFinish;
                this.Draw();
            },
            defaults: function (t) { //当前实际年、月
                var d = new Date(),
				Year = d.getFullYear(),
				Month = d.getMonth() + 1,
				today = d.getDate();
                if (t == 'Y') {
                    return Year
                } else if (t == 'M') {
                    return Month
                } else if (t == 'D') {
                    return today
                } else {
                    return 0
                }
            },
            SetOptions: function (options) {
                this.options = { //默认值 
                    Year: new Date().getFullYear(),
                    Month: new Date().getMonth() + 1,
                    SelectDay: null,
                    //选择日期 
                    onSelectDay: function () { },
                    onToday: function () { },
                    onFinish: function () { }
                };
                Object.extend(this.options, options || {});
            },
            //上月 
            PreMonth: function () {
                if (this.Year > 2013) {
                    //取得上月日期对象 
                    var d = new Date(this.Year, this.Month - 2, 1);
                    //设置属性 
                    this.Year = d.getFullYear();
                    this.Month = d.getMonth() + 1;
                    //重绘日历 
                    this.Draw(this.defaults('Y'), this.defaults('M'));
                }
            },
            //下一个月 
            NextMonth: function () {
                if (this.Year != this.defaults('Y') || this.Month != this.defaults('M')) {
                    var d = new Date(this.Year, this.Month, 1);
                    this.Year = d.getFullYear();
                    this.Month = d.getMonth() + 1;
                    //重绘日历 
                    this.Draw(this.defaults('Y'), this.defaults('M'));
                }
            },
            Draw: function (Y, M) {
                //保存日期列表 
                var arr = [];
                //用当月第一天在一周中的日期值作为当月离第一天的天数 
                for (var i = 1,
				firstDay = new Date(this.Year, this.Month - 1, 1).getDay() ; i <= firstDay; i++) {
                    arr.push(" ");
                }
                //用当月最后一天在一个月中的日期值作为当月的天数 
                for (var i = 1,
				monthDay = new Date(this.Year, this.Month, 0).getDate() ; i <= monthDay; i++) {
                    arr.push(i);
                }
                var frag = document.createDocumentFragment();
                this.Days = [];
                while (arr.length > 0) {
                    //每个星期插入一个tr
                    var row = document.createElement("tr");
                    //星期 
                    for (var i = 1; i <= 7; i++) {
                        var cell = document.createElement("td");
                        cell.innerHTML = " ";
                        if (arr.length > 0) {
                            var d = arr.shift();
                            cell.innerHTML = d;
                            if (d > 0) {
                                this.Days[d] = cell;
                                //可以补签日期设置
                                if (this.Year != this.defaults('Y') || this.Month != this.defaults('M') || d < this.defaults('D')) {
                                    cell.className = 'sign_0';
                                    cell.setAttribute('data', this.Year + '||' + this.Month + '||' + d);
                                }
                                //获取今日 
                                if (this.IsSame(new Date(this.Year, this.Month - 1, d), new Date())) {
                                    this.onToday(cell);
                                }
                                //判断用户是否作了选择
                                if (this.SelectDay && this.IsSame(new Date(this.Year, this.Month - 1, d), this.SelectDay)) {
                                    this.onSelectDay(cell);
                                }
                            }
                        }
                        row.appendChild(cell);
                    }
                    frag.appendChild(row);
                }
                //此先清空然后再插入(ie的table不能用innerHTML) 
                while (this.Container.hasChildNodes()) {
                    this.Container.removeChild(this.Container.firstChild);
                }
                this.Container.appendChild(frag);
                this.onFinish();
            },
            //判断是否同一日
            IsSame: function (d1, d2) {
                return (d1.getFullYear() == d2.getFullYear() && d1.getMonth() == d2.getMonth() && d1.getDate() == d2.getDate());
            }
        };
        cale = new Calendar("idCalendar", {
            //SelectDay: new Date().setDate(0),
            //onSelectDay: function (o) { o.className = "onSelect" },
            onToday: function (o) { o.className = "onToday" },
            onFinish: function () {
                var Y = this.Year, M = this.Month, Days = this.Days;
                document.getElementById("idCalendarYear").innerHTML = Y;
                document.getElementById("idCalendarMonth").innerHTML = M;
                //设置已签到样式
                jQuery.ajax({
                    url: "http://i.tiexue.net/sign/Load.aspx?f=" + fm,
                    data: { m: Y + '-' + M },
                    type: "GET",
                    dataType: "jsonp",
                    error: function () { },
                    success: function (data) {
                        flag = [];
                        if (data.sign_month) {
                            for (i = 0; i < data.sign_month.length; i++) {
                                flag.push(data.sign_month[i].d)
                            }
                            for (var i = 0, len = flag.length; i < len; i++) {
                                Days[flag[i]].className = 'sign_1';
                            }
                        }
                    }
                })
            }
        });
        $('#signStatus').html('<p class="ok">已签到</p><p class="signNum">连续签到' + data.sign_keep + '天</p>');//更新状态
        $('#sign_msg').text(data.sign_msg);//提示签到状态
        $('#sign_rank').text(data.sign_rank);//今日签到排名
        $('#sign_keep').text(data.sign_keep);//连续签到
        $('#sign_total').text(data.sign_total);//累计签到
        $('#gold').text(data.gold);//金币数量
        $('#total').text(data.sign_bu);//剩余补签次数
        var d = null;
        $('.sign').hover(function () { $('#sign_tips').fadeIn(150) }, function () { d = setTimeout(function () { $('#sign_tips').fadeOut(150) }, 120) });
        $('#sign_tips').hover(function () { clearTimeout(d) }, function () { $(this).fadeOut(150) });
        $('#idCalendar>tr>.sign_0').live('click', function () { var array = $(this).attr('data').split('||'); signfn.patch(this, array[0], array[1], array[2]) });
    }
}
/*================签到相关end====================*/

/*================弹出层登录start================*/
function IsNotLogin() { loginBarType = 3; isnotlogin()/*兼容老版*/ }
function isnotlogin() {
    var loginhtml = '<style type="text/css">.loginPop{height:256px;padding-left:230px;background:url(http://r.itiexue.net/tiexue/wwwindex/login-layer-bg.gif) -1px -1px no-repeat}.loginPop .error{height:37px;line-height:37px;color:#f00}.loginPop .uname { outline: 0; width: 205px; height:25px;margin:5px 0 0 34px;line-height:25px; background: 0; border: 0;}.loginPop .upsd { outline: 0; width: 205px; height:25px;margin:35px 0 0 34px;line-height:25px; background: 0; border: 0;}.loginPop .jzmm{padding:24px 0 20px;display:block;clear:both}.loginPop .loginIn{width:120px;height:40px;color:#fff;border:0;font-size:16px;font-weight:bold;cursor:pointer;margin-right:10px;background-color:#f03126;background-image:-moz-linear-gradient(top,#f03126,#df2c21);background-image:-webkit-gradient(linear,top,#f03126,#df2c21);background-image:-webkit-linear-gradient(top,#f03126,#df2c21);background-image:-o-linear-gradient(top,#f03126,#df2c21);float:left}.loginPop .loginIn:hover{background-color:#df2c21;background-image:-moz-linear-gradient(top,#df2c21,#f03126);background-image:-webkit-gradient(linear,top,#df2c21,#f03126);background-image:-webkit-linear-gradient(top,#df2c21,#f03126);background-image:-o-linear-gradient(top,#df2c21,#f03126)}.loginPop .regbtn{float:left;width:93px;height:39px;text-align:center;line-height:39px;background-color:#eee;font-size:14px;background-image:-moz-linear-gradient(top,#fbfbfb,#e9e9e9);background-image:-webkit-gradient(linear,top,#fbfbfb,#e9e9e9);background-image:-webkit-linear-gradient(top,#fbfbfb,#e9e9e9);background-image:-o-linear-gradient(top,#fbfbfb,#e9e9e9);text-decoration:none;border:solid 1px #cfcfcf}.loginPop .regbtn:hover{background-color:#eee;background-image:-moz-linear-gradient(top,#e9e9e9,#fbfbfb);background-image:-webkit-gradient(linear,top,#e9e9e9,#fbfbfb);background-image:-webkit-linear-gradient(top,#e9e9e9,#fbfbfb);background-image:-o-linear-gradient(top,#e9e9e9,#fbfbfb)}</style><div class="loginPop"><p class="error" id="poperror"></p><input type="text" class="uname float_L fontYaHei" id="popusername" placeholder="邮箱/用户名"><input type="password" class="upsd float_L fontYaHei" onkeyup="TX.EnterSubmit(event,popLoginIn)" id="poppassword" placeholder="密码"><label class="jzmm"><input type="checkbox" style="vertical-align:middle;">&nbsp;记住密码，下次免登录</label><input type="button" id="popLoginBtn" class="loginIn" onclick="popLoginIn();loginBarType=3;" value="立即登录"><a class="regbtn" target="_blank" href="http://reg.tiexue.net/">立即注册</a></div>';
    $('#pubLayer_Msg').remove();
    TX.PopLayer.ShowLayer({ Title: "登录", LayerWidth: "504px", LayerHeight: "290px", bgAlpha: "0.2", sHtml: loginhtml})
}
function popLoginIn() {
    var userName = $("#popusername");
    var passWord = $("#poppassword");
    if (userName.val().length < 1) { $('#poperror').text("用户名不能为空"); userName.focus(); return; }
    else if (passWord.val().length < 1) { $('#poperror').text("密码不能为空"); passWord.focus(); return; }
    $.getJSON('http://reg.tiexue.net/XmlHttp/IsProtectedUser.aspx?username=' + escape(userName.val()) + '&callback=?', function (data) {
        if (data == "1") {
            TX.ShowProtectedUserAlert();
            userName.focus();
            return false;
        }
        else {
            TX.UserLogin(userName.val(), passWord.val(), 365, false, "");
            $('#popLoginBtn').val('登录中...');
        }
    });
}

/* adblock */
function fuckAdNotDetected() { var a, b, c, d; a = new Date, b = TX.Log_GetRootDomain(document.domain), a.setMinutes(a.getMinutes() - 30), c = 1, d = ["Hm_txlu"], document.cookie = d[0] + "=" + c + ";expires=" + a.toGMTString() + ";domain=" + b + ";path=/;" }
function fuckAdDetected() { var a = TX.Log_GetRootDomain(document.domain), b = 1, c = ["Hm_txlu"]; document.cookie = c[0] + "=" + b + ";domain=" + a + ";path=/;", LogViewRequest() }
$(document.body).ready(function () { "undefined" == typeof BAIDU_CLB_fillSlot ? fuckAdDetected() : fuckAdNotDetected() });

/*微信登录*/
function openWindow() {
    var url = window.location.href;
    if (TX.BaseCookie.BBS_CurrentUserID() <= 0) {
        var top = ($(window).height() - 550) / 2,
            left = ($(document).width() - 650) / 2;
        window.open('https://open.weixin.qq.com/connect/qrconnect?appid=wx7f3870c2639a8ee3&redirect_uri=http%3A%2F%2Fwx.sso.tiexue.net%2Fapi%2Fwxlogin%2Fqruserinfo&response_type=code&scope=snsapi_login&state=http%3A%2F%2Freg.tiexue.net%2Foauth%2Fgamewechat.aspx?rf=' + url + '"', '', 'height=550,width=650,top=' + top + ',left=' + left + ',toolbar=no,menubar=no');
    }
    return false;
}
/*qq登录*/
function openQQ() {
    var url = window.location.href;
    if (TX.BaseCookie.BBS_CurrentUserID() <= 0) {
        var top = ($(window).height() - 550) / 2,
            left = ($(document).width() - 650) / 2;
        window.open('http://qq.sso.tiexue.net/qqlogin.aspx?url=http%3A%2F%2Freg.tiexue.net%2Foauth%2Fgamewechat.aspx?rf=' + url, '', 'height=550,width=650,top=' + top + ',left=' + left + ',toolbar=no,menubar=no');
    }
    return false;
}