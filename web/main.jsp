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
        动漫社区
      </h2>
      <hr size=3 />
      <div class="row">
        <s:iterator var="videoOfComic" value="#session.videoOfComic" >
          <a href="videoToBeShow.action?videoId=<s:property value='%{#videoOfComic.videoId}'/> ">
            <div class="col-md-3">
              <div class="thumbnail">
                <img alt="300x200" src="/resources/img/wrap/<s:property value='%{#videoOfComic.videoWrap}' />"
                     width="200px"/>
                <h4 align="center"><s:property value='%{#videoOfComic.videoName}' /> </h4>
              </div>
            </div>
          </a>
        </s:iterator>
      </div>

      <hr />
      <!-- IT技术分区-->
      <h2>
        IT天空
      </h2>
      <hr size=3 />
      <div class="row">
        <s:iterator var="videoOfIT" value="#session.videoOfIT" >
          <a href="videoToBeShow.action?videoId=<s:property value='%{#videoOfIT.videoId}'/> ">
            <div class="col-md-3">
              <div class="thumbnail">
                <img alt="300x200" src="/resources/img/wrap/<s:property value='%{#videoOfIT.videoWrap}' />"
                     width="200px"/>
                <h4 align="center"><s:property value='%{#videoOfIT.videoName}' /> </h4>
              </div>
            </div>
          </a>
        </s:iterator>
      </div>



    </div>
  </div>
  <div class="col-md-1 column">
  </div>
</div>
<s:include value="/include/bottom.jsp" />
</body>
</html>
