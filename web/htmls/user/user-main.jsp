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
<body>
<s:include value="/include/top.jsp" />
<div class="container" >
  <div class="row clearfix">
    <!-- 这里要想办法抽离出去 -->
    <s:include value="user-left.jsp" />
    <!-- -->
    <div class="col-md-9 column"  style="background: #ffffff;">
      <iframe name="content" id="content"
              src="showVideosOfUser.action?id=${user.id}"
              width="100%" onload="this.height=content.document.body.scrollHeight"
              frameborder="0"></iframe>

    </div>
  </div>
</div>
</body>
</html>
