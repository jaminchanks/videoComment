<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: jamin
  Date: 6/7/15
  Time: 3:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title><link href="/tools/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
  <link href="/tools/bootstrap3/css/bootstrap-theme.min.css"
        rel="stylesheet">
  <link href="/tools/bootstrap3/css/carousel.css" rel="stylesheet">

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="/tools/bootstrap3/js/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="/tools/bootstrap3/js/bootstrap.min.js"></script>

  <!-- 控制超链接字体的颜色 -->
  <style type="text/css">
    html,body{
      background:  #7bc1ee;
    }
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
  </style>
</head>
<body >
<nav class="navbar" role="navigation"> </nav>
<div class="container">
  <div class="row clearfix">
    <div class="col-md-12 column">
      <nav class="navbar navbar-inverse navbar-fixed-top"
           role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse"
                  data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">导航条</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a href="/index.jsp">
            <img src="/resources/img/head/maiba2.png" width="160px"></a>
        </div>

        <div class="collapse navbar-collapse"
             id="bs-example-navbar-collapse-1">
          <!-- -------------------------注意这里action的跳转地址------------------------------------- -->
          <!-- 搜索功能，未完成-->
          <form class="navbar-form navbar-left" role="search" method="post" action="showResultOfVideos.action">
            <div class="form-group">
              <input name="video.videoName" type="text" class="form-control" placeholder="搜索视频"/>
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
          </form>
          <!-- 未登陆状态 -->
          <s:if test="%{#session.logonUser == null }">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/login.jsp">登录</a></li>
            <li><a href="/register.jsp">注册</a></li>
            <li>&nbsp;&nbsp;&nbsp;</li>
          </ul>
          </s:if>
          <!-- 未登陆状态结束 -->

          <!-- 已登陆状态 -->
          <s:if test="%{#session.logonUser != null }">
            <ul class="nav navbar-nav navbar-right">
              <li><a href="logOut.action">注销</a></li>
              <li>&nbsp;&nbsp;&nbsp;</li>
            </ul>
          <!--显示用户名 -->
          <ul class="nav navbar-nav navbar-right">
            <li><a href="showUserDetail.action?id=<s:property value='#session.logonUser.id'/> " >
              <s:property value="#session.logonUser.userName" /></a></li>
          </ul>
          <!-- 显示用户头像 -->
            <a href="showUserDetail.action?id=<s:property value='#session.logonUser.id'/> ">
              <ul class="nav navbar-nav navbar-right">
              <li><img alt="140x140" src="/resources/img/head/<s:property value='#session.logonUser.head'/> "
                       class="img-circle" width="45px" />&nbsp;&nbsp;</li>
            </ul></a>
          </s:if>
          <!-- 已登陆状态结束 -->
        </div>
      </nav>
    </div>
  </div>
</div>
</body>
</html>
