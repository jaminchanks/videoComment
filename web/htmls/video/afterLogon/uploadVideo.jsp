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
  <title>上传视频</title>

</head>
<body>
<s:include value="/include/top.jsp" />

<!--获取iframe中的值 -->
<script type="text/javascript">
  $(document).ready(function(){
    $('#submit1').click(function () {
      var savedWrapFileName = $(window.frames["iframe1"].document).find("#savedFileName").html();
      if (savedWrapFileName == null) {
        alert('请上传封面');
        return false;
      }
      $('#videoWrap').attr('value', savedWrapFileName);

      var savedVideoFileName = $(window.frames["iframe2"].document).find("#savedFileName").html();
      if (savedVideoFileName == null) {
        alert('请上传视频');
        return false;
      }
      $('#videoSrc').attr('value', savedVideoFileName);
    });
  });
</script>




<div class="container" >
  <div class="row clearfix">
    <!-- 这里要想办法抽离出去 -->
    <div class="col-md-3">
      <s:include value="/htmls/user/afterLogon/logonUser-left.jsp" />
    </div>
    <!-- -->
    <div class="col-md-9 column"  style="background: #ffffff;">
      <!--上传视频的表格数据填写 -->
      <div class="row">
        <div class="col-md-2 column"></div>
        <div class="col-md-8 column">
          <br/>
          <form action="addVideo.action" method="POST">
            <!-- 测试 -->
            <s:hidden name="video.user.id" value="%{#session.logonUser.id}" />
            <s:hidden name="video.videoWrap" id="videoWrap" />
            <s:hidden name="video.videoSrc" id="videoSrc" />

            <table class="table table-bordered table-hover">
              <thead>
              <tr bgcolor="#dddddd">
                <th colspan=2><div align="center">视频上传</div></th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <!-- 视频封面 -->
                <td width="25%">
                  <img name="user.head" src="/resources/img/wrap/download.png"
                       width="64px" height="64px"></td>
                <td>
                  <iframe src="uploadVideoWrap-main.jsp" width="100%" name="iframe1" id="iframe1" frameborder="0"
                          height="100%" scrolling="no">
                  </iframe>
                </td>
              </tr>
              <tr>
                <!-- 视频源 -->
                <td>
                  <img name="user.head" src="/resources/img/wrap/video.png"
                       width="64px" height="64px"></td>
                <td>
                  <iframe src="uploadVideo-main.jsp" width="100%" name="iframe2" id="iframe2" frameborder="0"
                          height="100%" scrolling="no">
                  </iframe>
                </td>
              </tr>
              <tr>
                <td>标题</td>
                <td><input type="text" class="form-control" required
                           name="video.videoName" ></td>
              </tr>
              <tr>
                <td>分类</td>
                <td>
                  <select name="video.catalog" class="form-control">
                    <option value="comic">动漫</option>
                    <option value="IT">IT</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td colspan=2 align="center">
                  <button type="submit"  class="btn btn-primary" id="submit1">上传</button>&nbsp;&nbsp;&nbsp;
                  <button type="reset" class="btn btn-default">取消</button></td>
              </tr>
              </tbody>
            </table>
          </form>


        </div>
        <div class="col-md-2 column"></div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
