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
  <style type="text/css">
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
<body>
<div class="container">
  <div class="row clearfix">
    <div class="col-md-12 column">

      <form action="addComment.action" method="post">
        <!-- 发布评论 -->
        <input type="text" class="form-control" name="content" required>
        <div align="right">
          <button type="submit" class="btn btn-primary">发布</button>
        </div>
      </form>
      <s:iterator value="commentsWatching" var="comment">
        <h3>

          <a href="" onclick="javascript:window.parent.location.href='showUserDetail.action?id=${comment.user.id}' ">

            <img src="/resources/img/head/${comment.user.head}" width="32px" height="32px"/>
              ${comment.user.userName}

          </a>
        </h3>
        <s:if test="%{#comment.isBaned == 1}">
          <pre style="font-size: medium; color: rgba(255, 0, 0, 0.91)">评论已被删除!</pre>
        </s:if>
        <s:else>
          <pre style="font-size: medium;">${comment.content}</pre>
        </s:else>
        <div align="right">
          <small>${comment.commentTime}</small>
          <s:if test="%{#comment.user.id == #session.logonUser.id || #session.logonUser.identity == 99}">
            <a href="deleteComment.action?commentId=${comment.commentId}"> 删除 </a>&nbsp;
          </s:if>

        </div>
        <hr/>
      </s:iterator>

      <!-- 分页 -->
      <div align="right">
        <ul class="pagination">
          <s:if test="%{pageNo != 1}">
            <li><a href="showVideoComment.action?pageNo=${pageNo - 1}"><< 上一页</a></li>
          </s:if>
          <s:if test="%{pageNo <= maxPageSize}">
            <li><a href="showVideoComment.action?pageNo=${pageNo + 1}">下一页 >></a></li>
          </s:if>
        </ul>
        <form action="showVideoComment.action" >
          <h4> 第${pageNo}页/共${maxPageSize}页 第<input type="text" name="pageNo" size="2">页
            <input type="submit" class="btn btn-default" value="跳转">
          </h4>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>
