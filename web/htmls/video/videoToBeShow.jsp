<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: jamin
  Date: 6/16/15
  Time: 6:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
  <script type="text/javascript">
    document.createElement('video');document.createElement('audio');document.createElement('track');
  </script>
  <link href="http://vjs.zencdn.net/4.12/video-js.css" rel="stylesheet">
  <script src="http://vjs.zencdn.net/4.12/video.js"></script>
  <style type="text/css">
    .vjs-default-skin .vjs-control-bar,
    .vjs-default-skin .vjs-big-play-button { background: rgba(0,0,0,0.58) }
    .vjs-default-skin .vjs-slider { background: rgba(0,0,0,0.19333333333333333) }
  </style>
</head>
<body>
<s:include value="/include/top.jsp" />
<div class="container">
  <div class="row">
    <div class="col-md-9 column" style="background: #FFFFFF" >
      <h3>${videoWatching.videoName} </h3>
      <video id="example_video_1" class="video-js vjs-default-skin"
             controls preload="auto" width="100%" height="480"
             poster="/resources/img/wrap/${videoWatching.videoWrap}"
             data-setup='{"example_option":true}'>
        <source src="/resources/videos/${videoWatching.videoSrc} " type='video/mp4' />
      </video>
      <div align="right" >
        <h4>
          <a href="showUserDetail.action?id=${videoWatching.user.id}">
           ${videoWatching.user.userName} </a>
          上传于:${videoWatching.upTime}<br/>
        </h4>
      </div><hr/>
      <h3>评论区</h3>
      <iframe name="content" id="content"
              src="showVideoComment.action?videoId=${videoWatching.videoId}"
              width="100%" onload="this.height=content.document.body.scrollHeight"
              scrolling="no" frameborder="0">
      </iframe>
    </div>
  </div>
</div>
</body>
</html>