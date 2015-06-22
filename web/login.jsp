<%--
  Created by IntelliJ IDEA.
  User: jamin
  Date: 6/7/15
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
  <title>login</title>
  <link href="/tools/bootstrap3/css/signin.css" rel="stylesheet">


</head>
<body style="padding-top: 40px; padding-bottom: 40px;
 background: url(/resources/img/chuyin.jpg) no-repeat; background-size: 100% auto; ">
<s:include value="/include/top.jsp" />
<!--生成验证码 -->
<script language="javascript" type="text/javascript">
  function refreshImage() {
    document.getElementById('checkcodeimgID').src = '${webPath}/user/servImgVal?'
            + Math.random();
  }
  //function verifyCheck(){
  //	document.getElementById('verifyCode').Text= "AjaxTest";
  //	}
</script>

<div class="container">
  <div class="row">
    <div class="col-md-8 column"></div>
    <div class="col-md-4" style="background: rgba(238, 238, 238, 0.8);">
      <h3><s:actionmessage /></h3>
      <form class="form-signin" role="form" method="post"
            action="login.action">
        <h2 class="form-signin-heading">用户登陆</h2>
        <input type="text" class="form-control" placeholder="请输入用户名"
               required autofocus name="user.account">
        <input type="password"  class="form-control" placeholder="请输入密码" name="user.password"
               required>
        <!--首次输入密码错误，要求输入验证码 --
          <div class="row">
            <div class="col-md-6 column">
              <input type="text" class="form-control" name="verifyCode" id="verifyCode" required
                     placeholder="请输入验证码" />
            </div>
            <div class="col-md-6 column">
              &nbsp;&nbsp;<img id="checkcodeimgID" src="${webPath}/servImgVal"
                               alt="请输入图中的数字" width="72px"> <a
                    href="JavaScript:refreshImage()"><img
                    src="${webPath}/img/refresh.png" width="27px"></a>
            </div>
          </div>
        <!-- 验证码部分结束 -->

        <div class="checkbox">
          <label> <input type="checkbox" value="rememberMe">
            记住我
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
      </form>
    </div>
  </div>
</div>
<!-- /container -->
<s:include value="include/bottom.jsp" />
</body>
</html>
