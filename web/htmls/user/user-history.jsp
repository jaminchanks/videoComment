<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: jamin
  Date: 6/15/15
  Time: 11:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
</head>
<body style="background: #7bc1ee">
<s:include value="/include/top.jsp" />
<div class="container" >
  <div class="row clearfix">
  <s:include value="user-left.jsp" />
    <div class="col-md-9 column"  style="background: #ffffff;">
      <ul class="nav nav-tabs">
        <li><a href="/htmls/user/user-up.jsp">上传的视频</a></li>
        <!--
        <li class="active"><a href="/htmls/user/user-history.jsp">观看记录</a></li>
        <li><a href="/htmls/user/user-collect.jsp">收藏的视频</a></li>
        -->
      </ul>
      <h3>这里放置你的浏览历史</h3>

      <!-- 分页处理 -->
      <div align="right">
        <ul class="pagination">
          <li>
            <a href="#">Prev</a>
          </li>
          <li>
            <a href="#">1</a>
          </li>
          <li>
            <a href="#">2</a>
          </li>
          <li>
            <a href="#">3</a>
          </li>
          <li>
            <a href="#">Next</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
</body>
</html>
