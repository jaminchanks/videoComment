<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: jamin
  Date: 6/16/15
  Time: 5:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
123
<s:iterator value="#session.videosOfIT" var="video">
<img src="/resources/img/wrap/<s:property value='%{#video.videoWrap}' />"
        width="100px"/>
</s:iterator>
</body>
</html>
