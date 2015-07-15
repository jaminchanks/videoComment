<%--
  Created by IntelliJ IDEA.
  User: jamin
  Date: 6/5/15
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
  <title></title>
</head>
<body style="background: #ffffff">
<s:include value="/include/top.jsp" />
<h3>
  欢迎回来！
  <div align="center">
    <s:property value="#session.user.userName"/>
    <s:property value="#session.user.head"/>
  </div>
</h3>
<div align="center"><h4> 登陆成功！ </h4></div>
<meta http-equiv=refresh content="0.5;url=<%=session.getAttribute("forwardURL")%>">
<s:include value="/include/bottom.jsp" />
</body>
</html>
