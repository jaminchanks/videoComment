<%--
  Created by IntelliJ IDEA.
  User: jamin
  Date: 6/5/15
  Time: 11:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link href="/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
  <link href="/bootstrap3/css/bootstrap-theme.min.css"
        rel="stylesheet">
  <link href="/bootstrap3/css/carousel.css" rel="stylesheet">

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="/bootstrap3/js/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="/bootstrap3/js/bootstrap.min.js"></script>

  <!-- 控制超链接字体的颜色 -->
  <style type="text/css">
    <!--
    a:link {
      text-decoration: none;
    }

    a:visited {
      text-decoration: none;
    }

    a:hover {
      text-decoration: none;
    }

    a:active {
      text-decoration: none;
    }
    -->
  </style>
  <link href="/bootstrap3/css/signin.css" rel="stylesheet">

</head>
<body style="padding-top: 40px; padding-bottom: 40px; background-color: #eee;">
<div class="container">
  <div class="row">
    <div class="col-md-3 column"></div>
    <div class="col-md-6">
      <form class="form-signin" role="form" method="post"
            action="LogonHandle">
        <h2 class="form-signin-heading">用户登录</h2>
        <input type="text" class="form-control" placeholder="请输入帐号"
               required autofocus name="account"> <input type="password"
                                                         class="form-control" placeholder="请输入密码" name="password"
                                                         required>
          <div class="row">
            <div class="col-md-6 column">
              <input type="text" class="form-control" name="verifyCode" id="verifyCode" required
                     placeholder="输入验证码" />
            </div>
            <div class="col-md-6 column">
              &nbsp;&nbsp;<img id="checkcodeimgID" src="${webPath}/servImgVal"
                               alt="输入图中数字" width="72px"> <a
                    href="JavaScript:refreshImage()"><img
                    src="${webPath}/img/refresh.png" width="27px"></a>
            </div>
          </div>
        <div class="checkbox">
          <label> <input type="checkbox" value="rememberMe">
            记住我
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
      </form>
    </div>
    <div class="col-md-3 column"></div>
  </div>
</div>
<!-- /container -->
</body>
</html>