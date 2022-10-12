<%--
  Created by IntelliJ IDEA.
  User: 青 庐
  Date: 2022/10/12
  Time: 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用戶注冊</title>
    <style>
        h1 {
            text-align: center;
            color: red;
        }

        input:focus, textarea:focus {
            border: 1px solid #f00;
            background: #fcc;
        }

        textarea {
            width: 400px;
            height: 50px;
        }

        div {
            margin: 5px;
            width: 600px;
            hegight: 40px;
        }

        body {
            font-size: 12px;
            font-family: Microsoft YaHei;
        }

        .left {
            display: block;
            float: left;
            width: 80px;
            padding-left: 2px;
            font-family: Microsoft YaHei;
            alignment-baseline: middle;
        }

        .mytable {
            margin: auto;
        }

        .submit {
            margin-top: 40px;
            margin-left: 250px;
            alignment-adjust: central;
        }

        .button {
            font-family: Microsoft YaHei;
            color: #FFF;
            background-color: #03C;
        }

        select option {
            font-size: 10px;
            font-family: Microsoft YaHei;
        }
    </style>
    <script type="text/javascript">
        function checkGender() {
            var genderNum = document.getElementByName('gender');
            var gender = '';
            for (var i = 0; i < genderNum.length; ++i) {
                if (genderNum[i].checked)
                    gender = genderNum[i].value;
            }
            if (gender == '') {
                document.getElementById("tips_gender").innerHTML = "<em style='color:#FF0000'>至少选择其中一项</em>";
                return false;
            } else {
                document.getElementById('tips_gender').innerHTML = "OK!";
                return true;
            }
        }

        function checkUser() {
            if (document.getElementById('txtUser').value.length < 6 ||
                document.getElementById("txtUser").value.length > 18) {
                document.getElementById("tips_username").innerHTML = "<em style='color:#FF0000'>用户名由6-18个字符组成</em>";
                document.getElementById("txtUser").focus();
                return false;
            } else {
                document.getElementById("tips_username").innerHTML = "OK!";
                return true;
            }
        }

        function checkPsssword1() {
            var reg = /[^A-Za-z0-9_]+/;
            var regs = /^[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
            if (document.getElementById("txtPwd").value.length < 6
                || document.getElementById("txtPwd").value.length > 18
                || regs.test(document.getElementById("txtPwd").value)) {
                document.getElementById("tips_password").innerHTML = "<em style='color:red'>密码由6-18个字符、数字和标点符号组成</em>"
                document.getElementById("txtPwd").focus();
                return false;
            } else {
                document.getElementById("tips_password").innerHTML = "OK!";
                return true;
            }
        }

        function checkPsssword2() {
            if (document.getElementById('txtPwd').value == '') {
                document.getElementById("tips_repeat").innerHTML = "<em style='color:red'>密码由6-18个字符、数字和标点符号组成</em>";
                return false;
            }
            if (document.getElementById("txtRpt").value != document
                .getElementById("txtPwd").value) {
                document.getElementById("tips_repeat").innerHTML = "<em style='color:#FF0000'>两次输入的密码不一致</em>";
                return false;
            } else {
                document.getElementById("tips_repeat").innerHTML = "OK!";
                return true;
            }
        }

        function checkeUserType() {
            if (document.getElementById("selUser").selectedIndex == 0) {
                document.getElementById("tips_usertype").innerHTML = "<em style='color:#FF0000'>没有选择用户类型</em>";
                return false;
            } else {
                document.getElementById("tips_usertype").innerHTML = "OK!";
                return true;
            }
        }

        function checkDate() {
            if (document.getElementById("txtDate"), value == '') {
                document.getElementById("tips_birthdate").innerHTML = "<em style='color:#FF0000'>没有填写出生日期</em>";
                return false;
            } else {
                document.getElementById("tips_birthdate").innerHTML = "OK!";
                return true;
            }
        }

        function checkEmail() {
            var email = document.getElementById('txtMail').value;
            var pattern = /^[a-zA-Z0-9#_\^\$\.\*\+\-\?\=\!\:\|\\\/\(\)\[\]\{\}]+@[a-zA-Z0-9]+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
            if (email.length == 0) {
                document.getElementById("tips_email").innerHTML = "<em style='color:#FF0000'>电子邮箱不能为空</em>";
                return false;
            } else if (!pattern.test(email)) {
                document.getElementById("tips_email").innerHTML = "<em style='color:#FF0000'>Email不合法</em>";
                return false;
            } else {
                document.getElementById("tips_email").innerHTML = "OK!";
                return true;
            }
        }

        function checkIntro() {
            if (document.getElementById("txtIntro").value.length > 100) {
                document.getElementById("tips_introduction").innerHTML = "<em style='color:#FF0000'>长度不能超过100个字符</em>";
                return false;
            }
            if (document.getElementById("txtIntro").value.length < 1) {
                document.getElementById("tips_introduction").innerHTML = "<em style='color:#FF0000'>自我介绍不能为空</em>";
                return false;
            } else {
                document.getElementById("tips_introduction").innerHTML = "OK!";
                return true;
            }
        }

        function checkHobby() {
            var hobby = 0;
            var objNum = document.getElementsByName("hobby");
            for (var i = 0; i < objNum.length; ++i) {
                if (objNum[i].checked == true)
                    hobby++;
            }
            if (hobby >= 1) {
                document.getElementById("tips_hobby").innerHTML = "OK!";
                return true;
            } else {
                document.getElementById("tips_hobby").innerHTML = "<em style='color:#FF0000'>至少选择其中一项</em>";
                return false;
            }
        }

        function checkForm() {
            return checkUser() && checkPsssword1() && checkPsssword2() && checkeUserType() && checkDate() && checkEmail() && checkIntro() && checkHobby();
        }
    </script>
</head>
<body>
<form id="userForm" action="NULL" method="post" onsubmit="return checkForm()">
    <h1>用户注册界面</h1>
    <table style=" " class="mytable">
        <tr>
            <td> 用户名</td>
            <td><input name="username" type="text" id="txtUser" onblur="checkUser()"></td>
            <td><span id="tips_username"><sup>
                <font color="red">*</font>
            </sup>用户名由3-5个字符组成</span>
            </td>
        </tr>
        <tr>
            <td>密&nbsp;&nbsp;码</td>
            <td><input type="password" name='password' id="txtPwd" onblur="checkPassword1()"></td>
            <td><span id='tips_password'>*
                密码由6-18个字符、数字和标点符号组成
            </span></td>
        </tr>
        <tr>
            <td>确认密码</td>
            <td><input name="pwdrepeat" type="password" id="txtRpt" onBlur="checkPassword2()"></td>
            <td><span id="tips_repeat">* 请再次输入你的密码</span></td>
        </tr>

        <tr>
            <td>性&nbsp;&nbsp;别</td>
            <td><input name="gender" type="radio" value="male" onClick="checkGender()"/>男
                <input name="gender" type="radio" value="female" onClick="checkGender()"/>女
            </td>
            <td><span id="tips_gender">* 请选择你的性别</span></td>
        </tr>
        <tr>
            <td>出生日期</td>
            <td><input name="birthdate" type="date" id="txtDate" onBlur="checkDate()"/></td>
            <td><span id="tips_birthdate">* 请选择你的出生日期</span></td>
        </tr>
        <tr>
            <td>兴趣爱好</td>
            <td><input name="hobby" type="checkbox" value="reading" onClick="changeHobby()"/>Java
                <input name="hobby" type="checkbox" value="music" onClick=" changeHobby()"/>.Net
                <input name="hobby" type="checkbox" value="sports" onClick=" changeHobby()"/>PHP

            </td>
            <td><span id="tips_hobby">* 请选择兴趣爱好</span></td>
        </tr>
        <tr>
            <td>电子邮件</td>
            <td><input name="email" type="email" id="txtMail" onBlur="checkEmail()"></input></td>
            <td><span id="tips_email">* 请填写常用的EMAIL，将用于密码找回</span></td>
        </tr>
        <tr>
            <td>自我介绍</td>
            <td><textarea name="introduction" cols="40" rows="5" id="txtIntro" onBlur=" checkIntro()"></textarea>
            </td>
            <td><span id="tips_introduction">* 限100字以内</span></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" name="submit" value="提交"/>
                <input type="reset" name="reset" value="重置"/>
            </td>
        </tr>
        <tr>
            <td>省份</td>
            <td><select name="usertype" id="selUser" onBlur="checkUserType()">
                <option>请选择</option>
                <option value="1">河北省</option>
                <option value="2">山东省</option>
                <option value="3">辽宁省</option>
                <option value="4">黑龙江省</option>
                <option value="5">吉林省</option>
                <option value="6">甘肃省</option>
                <option value="7">青海省</option>
                <option value="8">河南省</option>
                <option value="9">江苏省</option>
                <option value="10">湖北省</option>
                <option value="11">湖南省</option>
                <option value="12">江西省</option>
                <option value="13">浙江省</option>
                <option value="14">广东省</option>
                <option value="15">云南省</option>
                <option value="16">福建省</option>
                <option value="17">台湾省</option>
                <option value="18">海南省</option>
                <option value="19">山西省</option>
                <option value="20">四川省</option>
                <option value="21">陕西省</option>
                <option value="22">贵州省</option>
                <option value="23">安徽省</option>
                <option value="24">重庆市</option>
                <option value="25">北京市</option>
                <option value="26">上海市</option>
                <option value="27">天津市</option>
                <option value="28">广西壮族自治区</option>
                <option value="29">内蒙古自治区</option>
                <option value="30">西藏自治区</option>
                <option value="31">新疆维吾尔自治区</option>
                <option value="32">宁夏回族自治区</option>
                <option value="33">澳门特别行政区</option>
                <option value="34">香港特别行政区</option>
            </select>
            </td>
            <td><span id="tips_usertype">*请选择省份</span></td>
        </tr>
    </table>
</form>
</body>
</html>
