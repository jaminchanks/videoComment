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
  <link href="/tools/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
  <link href="/tools/bootstrap3/css/bootstrap-theme.min.css"
        rel="stylesheet">
  <link href="/tools/bootstrap3/css/carousel.css" rel="stylesheet">

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="/tools/bootstrap3/js/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="/tools/bootstrap3/js/bootstrap.min.js"></script>

</head>
<body style="background: #ffffff;">
<div class="container" >
  <div class="row clearfix">
    <div class="col-md-12 column"  >
      <br/>
      <h3>${videos[0].user.userName}分享的视频</h3>
      <hr/>
      <div class="row">
        <s:if test="%{videos.size() == 0}">
          <h5>然而该用户并没有上传过视频...</h5>
        </s:if>

        <s:iterator value="%{videos}" var="video">
          <a onclick="javascript:window.parent.location.href=
                  'videoToBeShow.action?videoId=<s:property value="%{#video.videoId}"/>' ">
            <div class="col-md-3 col-xs-3">
              <div class="thumbnail" >
                <img alt="300x200" src="/resources/img/wrap/<s:property value='%{#video.videoWrap}' />"
                     style="width: 210px; height: 100px; "/>
                <h4 align="center"><s:property value='%{#video.videoName}' /> </h4>
              </div>
            </div>
          </a>
        </s:iterator>
      </div>
      <!-- 分页处理 -->
      <!-- 这是装饰 -->
      <s:if test="%{videos.size() != 0}">
        <div class="row">
          <!-- 这是装饰 -->
          <h4 align="right"> 第1页/共1页&nbsp;&nbsp;
          </h4>
        </div>
      </s:if>
    </div>
  </div>
</div>
</body>
</html>
