<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: jamin
  Date: 7/4/15
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
  <link href="/tools/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
  <link href="/tools/bootstrap3/css/bootstrap-theme.min.css"
        rel="stylesheet">
  <link href="/tools/bootstrap3/css/carousel.css" rel="stylesheet">

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="/tools/bootstrap3/js/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="/tools/bootstrap3/js/bootstrap.min.js"></script>

</head>
<body  style="background:  #7bc1ee;">
<div class="list-group">
  <div class="list-group-item">
    <a href="#">
      <img src=/resources/img/head/<s:property value='#session.logonUser.head'/>
             width="86px" height="86px" class="img-rounded"/>
    </a>
    <div style="font-size: x-large;">  <s:property value="#session.logonUser.userName" /></div>
    <div style="font-size: small;">  简介：<s:property value="#session.logonUser.marks"/></div>
  </div>

  <a href="/htmls/user/user-main.jsp" class="list-group-item" id="userM"><h4>用户主页</h4></a>
  <a href="/htmls/video/afterLogon/uploadVideo.jsp" class="list-group-item" id="videoU"><h4>发布视频</h4></a>
  <a href="#" class="list-group-item" id="videoM"><h4>视频管理</h4></a>
  <s:if test="%{#session.logonUser.identity == 99}">
    <a href="#" class="list-group-item" id="videoM"><h4>视频管理(super)</h4></a>
    <a href="/htmls/user/afterLogon/superManager.jspManager.jsp" class="list-group-item" id="userM"><h4>用户管理(super)</h4></a>
  </s:if>
  <a href="/htmls/user/afterLogon/myAccount.jspAccount.jsp" class="list-group-item" id="accountM"><h4>我的账号</h4></a>
</div>


</body>
</html>
