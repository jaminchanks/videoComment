<%--
  Created by IntelliJ IDEA.
  User: jamin
  Date: 6/7/15
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
  <title></title>
</head>
<body>
<s:include value="/include/top.jsp" />
<div class="container">
  <div class="row clearfix">
    <div class="col-md-1 column">
    </div>
    <div class="col-md-10 column" style="background: #ffffff;">
      <!-- 动漫分区 -->
      <h4>
        <!-- 视频 -->
        <ul class="nav nav-tabs">
          <li class="active"> <a style="color: rgba(33, 33, 33, 0.94)" href="searchVideosByName.action?whatToSearch=${whatToSearch}"> 相关视频 </a> </li>
          <li > <a style="color: rgba(33, 33, 33, 0.94)" href="searchUsersByUserName.action?whatToSearch=${whatToSearch}"> 相关用户 </a> </li>
        </ul>
      </h4>
      <div class="row">
        <s:iterator value="%{videos}" var="video">

            <div class="col-md-3">
              <div class="thumbnail">
                <a href="videoToBeShow.action?videoId=<s:property value='%{#video.videoId}'/> ">
                <img alt="300x200" src="/resources/img/wrap/<s:property value='%{#video.videoWrap}' />"
                     style="width: 210px; height: 100px; "/>
                <h4 align="center"><s:property value='%{#video.videoName}' /> </h4>
                </a>
                <s:if test="%{#session.logonUser.identity == 99}" >
                  <div align="right" style="background-color: rgba(0, 0, 0, 0.12)">
                    <a href="#">修改</a>&nbsp;&nbsp;
                    <a href="#">删除</a>
                  </div>
                </s:if>

              </div>
            </div>
        </s:iterator>

      </div>

      <div class="row">
        <!-- 这是装饰 -->
        <h4 align="right"> 第1页/共1页&nbsp;&nbsp;
        </h4>
      </div>
    </div>
  </div>
  <div class="col-md-1 column">
  </div>
</div>
<s:include value="/include/bottom.jsp" />
</body>
</html>
