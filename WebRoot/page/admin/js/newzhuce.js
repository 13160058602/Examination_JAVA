function getinput() {
    pass = document.getElementById("pass");
    pass_rs = document.getElementById("pass-rs");
    pass_fon = document.getElementById("pass-fon");
    pass_error = document.getElementById("pass-error");
    pwd = document.getElementById("pwd");
    pwd_rs = document.getElementById("pwd-rs");
    pwd_error = document.getElementById("pwd-error");
    user_rs = document.getElementById("user-rs");
    user_error = document.getElementById("user-error");
    //email_rs = document.getElementById("email-rs");
    //email_error = document.getElementById("email-error");
    //fone_rs = document.getElementById("fone-rs");
    //fone_error = document.getElementById("fone-error");
    iarai = document.getElementById("igrai");
    mess_link = document.getElementById("messlink");
    yzm = document.getElementById("yzm");
    yzm_rs = document.getElementById("yzm-rs");
    yzm_fon = document.getElementById("yzm-fon");
    yzm_error = document.getElementById("yzm-error");

    mobile = document.getElementById("mobile");

    var inputs = document.getElementById("form1").getElementsByTagName("input");
    for (i = 0; i < inputs.length - 2; i++) {
        inputs[i].onfocus = function () {
            focustit(this, this.id)
        }
    };
    for (i = 0; i < inputs.length - 2; i++) {
        inputs[i].onblur = function () {
            blurtit(this, this.id)
        }
    };
};
function focustit(inpthis2, inputId) {
    inpthis2.style.borderColor = "#ffcdaa";
    document.getElementById(inputId + "-error").style.display = "none";
    document.getElementById(inputId + "-rs").style.display = "block";
    document.getElementById(inputId + "-fon").style.display = "none";
}
function blurtit(inpthis, inputId) {
    inpthis.style.borderColor = "#b5b5b5";
    var usereail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    var ueserf = /0?(13|14|15|18)\d{9}/
    var userzz = /^[A-Za-z0-9_\-\u4e00-\u9fa5]{2,16}$/
    var pwdzz = /.{6,16}/;
    //var fonezz = /^0?(13|14|15|18|17|14)[0-9]{9}$/;
    var val = document.getElementById(inputId).value;
    //var mailzz = /\w+((-w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+/;
    var shuzi = /^[\d]{4,16}$/;
    var zimu = /^[a-zA-Z]{4,16}$/;
    var zhong1 = /^[\da-zA-Z]{4,16}$/;
    var zhong2 = /^[\d_]{4,16}$/;
    var zhong3 = /^[a-zA-Z_]{4,16}$/;
    var reg = /^$/;

    var telReg = /^1\d{10}$/;
    var usertit = document.getElementById("usertit");
    if (val != "") {
        if (inpthis.id == "pass") {
            if (pwd.value == pass.value && pwdzz.test(pwd.value)) {
                pass_rs.style.display = "none";
                pass_fon.style.display = "block";
            } else {
                pass_rs.style.display = "none";
                pass_error.style.display = "block";
            }
        } else if (inpthis.id == "user") {
            if (usereail.test(val) || ueserf.test(val) || userzz.test(val) == false) {
                user_rs.style.display = "none";
                user_error.style.display = "block";
                usertit.style.display = "block";
                mess_link.className = "zc_message zc_messBorder";
            } else {
                ValidateUserNameIsExist(val)
            }
        }
        else if (inpthis.id == "mobile") {
            var mobileNum = $.trim($("#mobile").val());
            if (!telReg.test(mobileNum)) {
                $("#mobile-rs").hide();
                $("#mobile-error").show();
            } else {
                $("#mobile-fon").show();

                $("#mobile-rs").hide();
                $("#mobile-error").hide();
            }
        }
        else if (inputId == "yzm") {
            //调用注册
            $.ajax({
                url: 'http://sso.tiexue.net/captcha/ValidateImgCode',
                type: 'GET',
                dataType: 'jsonp',
                data: { text: yzm.value },
                success: function (data) {
                    if (data.Ok == true) {
                        // 注册成功后亦需同步登录操作
                        yzm_rs.style.display = "none";
                        yzm_fon.style.display = "block";
                    } else {
                        yzm_rs.style.display = "none";
                        yzm_error.style.display = "block";
                    }
                }
            });
        } else {
            switch (inputId) {
                case "pwd":
                    reg = pwdzz;
                    break;
            };
            if (reg.test(val)) {
                var uls = document.getElementById("zc_hint");
                var lis = uls.getElementsByTagName("h3");
                for (i = 0; i < lis.length; i++) {
                    lis[i].style.display = "none";
                }
                if (inpthis.id == "pwd") {
                    if (shuzi.test(val) || zimu.test(val)) {
                        lis[0].style.display = "block";
                    } else if (zhong1.test(val) || zhong2.test(val) || zhong3.test(val)) {
                        lis[1].style.display = "block";
                    } else {
                        lis[2].style.display = "block";
                    }
                }
                if (inpthis.id == "pwd" && pass.value != "") {
                    if (pass.value == pwd.value) {
                        pass_error.style.display = "none";
                        pass_fon.style.display = "block";
                    }
                }
                document.getElementById(inputId + "-rs").style.display = "none";
                document.getElementById(inputId + "-fon").style.display = "block";
                document.getElementById("usertit").style.display = "none";

                if (inpthis.id == "pwd") {
                    if (TX.ValidatePassword(pwd.value)) {
                        document.getElementById(inputId + "-fon").style.display = "none";
                        document.getElementById(inputId + "-error").style.display = "block";
                        pwd_error.innerHTML = "<span></span>密码不能为连续或相同的字符";
                    }
                    else {
                        if (user_rs.value != pwd.value) {
                            if (pass.value != pwd.value.length) {
                                uls.style.display = "block";
                                pwd_error.innerHTML = "<span></span>密码不能少于6个字符！";
                            }
                            else {
                                document.getElementById(inputId + "-fon").style.display = "none";
                                document.getElementById(inputId + "-error").style.display = "block";
                                pwd_error.innerHTML = "<span></span>密码不能与自己的注册邮箱相同。";
                            }
                        }
                        else {
                            document.getElementById(inputId + "-fon").style.display = "none";
                            document.getElementById(inputId + "-error").style.display = "block";
                            pwd_error.innerHTML = "<span></span>密码不能与自己的用户名相同。";
                        }
                    }
                }
            } else {
                usertit.style.display = "block";
                document.getElementById(inputId + "-rs").style.display = "none";
                document.getElementById(inputId + "-error").style.display = "block";
                if (inpthis.id == "user") { mess_link.className = "zc_message zc_messBorder"; }
            }
        }
    }
}

var authnCfg2 = {
    // CAPTCHA验证码获取地址
    captchaGetUrl: 'http://sso.tiexue.net/captcha/image',
    // AJAX(JSONP)注册请求地址
    jsonpRegisterUrl: 'http://sso.tiexue.net/account/jsonRegister',
    // 同步登录/登出请求地址
    syncAuthnUrl: 'http://sso.tiexue.net/account/sync?appid=1',
    //AJAX(JSONP)用户名检查地址
    jsonpUsernameCheckingUrl: 'http://sso.tiexue.net/account/jsonCheckUsername',
    // 同步登录/登出防阻塞所需的 iframe
    syncIFrame: '<iframe src="" id="__JSONP-LOGON-SYNC-IFRAME" style="display:none"></iframe>'
};

function checkform(fromid) {
    var f = document.getElementById(fromid);
    var isCheck = true;
    var user = f.user;
    var pwd = f.pwd;
    var pwd2 = f.pass;
    var yzmcheck = f.yzm;
    var igrai = document.getElementById("igrai");
    if (user.value == '') {
        user_rs.style.display = "none";
        user_error.style.display = "block";
        user_error.innerHTML = "<span></span>请输入用户名";
        isCheck = false;
    }
    if (pwd.value == '') {
        pwd_rs.style.display = "none";
        pwd_error.style.display = "block";
        pwd_error.innerHTML = "<span></span>请输入密码";
        isCheck = false;
    }
    if (pwd.value != pass.value) {
        pass_rs.style.display = "none";
        pass_error.style.display = "block";
        pass_error.innerHTML = "<span></span>两次输入的密码不一致";
        isCheck = false;
    } else if (pass.value == "") {
        pass_rs.style.display = "none";
        pass_error.style.display = "block";
        pass_error.innerHTML = "<span></span>请再次输入密码";
        isCheck = false;
    }


    if ($.trim($("#mobile").val()) == null || $.trim($("#mobile").val()).length<=0) {         
        $("#mobile-rs").hide();
        $("#mobile-error").show();
    }
    if (yzmcheck.value == "") {
        yzmErroMsg("请输入验证码")
    }
    else {
        $.ajax({
            url: 'http://sso.tiexue.net/captcha/ValidateImgCode',
            type: 'GET',
            dataType: 'jsonp',
            data: { text: yzmcheck.value },
            success: function (data) {
                if (data.Ok == false) {
                    yzmErroMsg("验证码有误")
                }
            }
        });
    }
    function yzmErroMsg(err) {
        yzm_rs.style.display = "none";
        yzm_error.style.display = "block";
        yzm_error.innerHTML = "<span></span>" + err;
        isCheck = false;
    }
    if (!igrai.checked) {
        isCheck = false;
        document.getElementById("greet").style.display = "block";
    }
    igrai.onclick = function () {
        if (igrai.checked) { document.getElementById("greet").style.display = "none"; }
    }

    var nextLoginBox = document.getElementById("ydfwxy");
    if (nextLoginBox.checked) {
        //下次登录选中接口

    }
    if (isCheck) {
        // 动态添加同步所用的iframe
        if ($("iframe#__JSONP-LOGON-SYNC-IFRAME").length == 0) {
            $('body').append(authnCfg2.syncIFrame);
        }
        var Domain = 'tiexue.net';
        var Appid = '1';
        //调用注册
        $.ajax({
            url: authnCfg2.jsonpRegisterUrl,
            type: 'GET',
            dataType: 'jsonp',
            data: { username: user.value, password: pwd.value, confirmPassword: pwd2.value, email: "", mobile: $.trim($("#mobile").val()), gender: 1, captcha: yzmcheck.value, site: Domain, appid: Appid },
            error: function (e) { alert("添加关联账号失败！") },
            success: function (data) {
                if (data.success == true) {
                    // 注册成功后亦需同步登录操作
                    $('iframe#__JSONP-LOGON-SYNC-IFRAME').load(function () { Tx_RegisterSuccess("0") });
                    $('iframe#__JSONP-LOGON-SYNC-IFRAME').attr('src', authnCfg2.syncAuthnUrl + "&t=" + Date.parse(new Date()));
                }
                else {
                    Tx_RegisterFail(data.errors);
                }
            }
        });
    }
}

function Tx_RegisterSuccess(data) {
    var url = "/regsuccess.aspx";
    setTimeout("window.location ='" + url + "'", 1000);
}

function Tx_RegisterFail(data) {
    GetValidateCode($("#RegCodeImage"));
    alert(data);
}
function ValidateUserNameIsExist(name) {
    $.ajax({
        url: authnCfg2.jsonpUsernameCheckingUrl,
        type: 'GET',
        dataType: 'jsonp',
        data: { 'username': name },
        success: function (data) {
            if (data.containsSensitiveWords || data.isDuplicate) {
                user_rs.style.display = "none";
                user_error.innerHTML = "<span></span>用户名已被注册！";
                user_error.style.display = "block";
                usertit.style.display = "block";
                mess_link.className = "zc_message zc_messBorder";
            } else {
                user_rs.style.display = "none";
                document.getElementById("user-fon").style.display = "block";
                usertit.style.display = "none";
                mess_link.className = "zc_message";
                user_error.innerHTML = "<span></span>用户名格式不正确！";
            }
        }
    });
}
