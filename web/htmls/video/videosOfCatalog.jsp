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
            <h2>
                <a style="color: rgba(33, 33, 33, 0.94)" href="#"> 动漫社区 </a>
            </h2>
            <div align="right">
                <a href="showAllVideosOfCatalog.action?catalog=comic&orderBy=upTime">按上传时间</a>||
                <a href="showAllVideosOfCatalog.action?catalog=comic&orderBy=watchNumbers">按播放次数</a>
            </div>
            <hr size=3 />
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
