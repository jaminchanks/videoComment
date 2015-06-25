<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: jamin
  Date: 6/23/15
  Time: 11:48 PM
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
<div class="container">
  <div class="row clearfix">
    <div class="col-md-12 column">

      <div class="row">
        <s:iterator value="%{videos}" var="video">
          <a href="videoToBeShow.action?videoId=<s:property value='%{#video.videoId}'/> ">
            <div class="col-md-3">
              <div class="thumbnail">
                <img alt="300x200" src="/resources/img/wrap/<s:property value='%{#video.videoWrap}' />"
                     style="width: 210px; height: 100px; "/>
                <h4 align="center"><s:property value='%{#video.videoName}' /> </h4>
              </div>
            </div>
          </a>
        </s:iterator>

      </div>

      <div class="row">
        <!-- 这是装饰 -->
          <h4 align="right"> 第1页/共1页 &nbsp;&nbsp;
          </h4>
      </div>
    </div>
    </div>


    </div>
</body>
</html>
