<%--
  Created by IntelliJ IDEA.
  User: jamin
  Date: 6/20/15
  Time: 9:13 PM
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
<body>
<form action="addComment.action" method="post">
  <!-- 发布评论 -->
        <input type="text" class="form-control" name="content">
        </input>
  <div align="right">
    <button type="submit" class="btn btn-primary">发布</button>
  </div>
</form>
  暂时还没有评论。
</body>
</html>
