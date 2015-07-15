<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: jamin
  Date: 6/15/15
  Time: 10:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title><s:property value="#request.userToShow.userName" />的个人主页</title>
  <!--点击事件 -->
  <script type="text/javascript">
    window.onload=function(){
      var oclick;
      var obj = new Array();
      obj[0] = document.getElementById("userMain");
      obj[1] = document.getElementById("videoU");
      obj[2] = document.getElementById("videoM");
      obj[3] = document.getElementById("userM");
      obj[4] = document.getElementById("accountM");

      for(var i=0;i<obj.length;i++){
        obj[i].style.color="#000";
        obj[i].onclick=function(){
          if(oclick){
            oclick.style.color="#000";
          }
          this.style.color="#4181FF";
          oclick=this;
        };
      }
    };
  </script>
  <s:if test="%{user == null}">
    <s:set name="user" value="%{#session.logonUser}" />
  </s:if>
</head>
<body>
<div class="col-md-3 column">
  <div class="list-group">
    <div class="list-group-item">
      <a href="#">
        <img src=/resources/img/head/${user.head} "
             width="86px" height="86px" class="img-rounded"/>
      </a>
      <div style="font-size: x-large;">  ${user.userName}</div>
      <div style="font-size: small;">  简介：${user.marks}</div>
    </div>

    <a href="showUserDetail.action?id=${user.id}" class="list-group-item" id="userMain"><h4>用户主页</h4></a>
    <s:if test="%{#session.logonUser != null }">
      <a href="/htmls/video/afterLogon/uploadVideo.jsp" class="list-group-item" id="videoU"><h4>发布视频</h4></a>
      <a href="#" class="list-group-item" id="videoM"><h4>视频管理</h4></a>
      <s:if test="%{#session.logonUser.identity == 99}">
        <a href="/htmls/user/afterLogon/superManager.jsp" class="list-group-item" id="userM"><h4>用户管理(super)</h4></a>
      </s:if>
      <a href="/htmls/user/afterLogon/myAccount.jsp" class="list-group-item" id="accountM"><h4>我的账号</h4></a>
    </s:if>
  </div>
</div>
</body>
</html>
