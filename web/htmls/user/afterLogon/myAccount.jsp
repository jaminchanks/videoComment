<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: jamin
  Date: 6/16/15
  Time: 4:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
</head>
<body style="background:  #7bc1ee;">
<s:include value="/include/top.jsp" />
<div class="container">
  <div class="row clearfix">

    <div class="col-md-3 column" >
      <s:include value="logonUser-left.jsp" />
  </div>


    <div class="col-md-9 column" style="background: #FFFFFF;">
      <h3>用户信息</h3>
      <div class="row">
        <div class="col-md-2 column"></div>
        <div class="col-md-8 column">
          <form action="updateUser.action" method="POST" enctype="multipart/form-data">
            <s:hidden name="user.head" value="%{#session.logonUser.head}" />
            <s:hidden name="user.id" value="%{#session.logonUser.id}" />
            <s:hidden name="user.account" value="%{#session.logonUser.account}" />
            <s:hidden name="user.identity" value="%{#session.logonUser.identity}" />
            <table class="table table-bordered table-hover">
              <thead>
              <tr bgcolor="#dddddd">
                <th colspan=2><div align="center">个人资料</div></th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <!-- 头像 -->
                <td width="32%">
                  <img name="user.head" src="/resources/img/head/<s:property value="#session.logonUser.head"/> "
                       width="64px" height="64px"></td>
                <td>
                  <div class="form-group">
                  <label for="exampleInputFile">选择头像</label>
                  <input type="file" name="file" value="<s:property value="#session.logonUser.head"/>" id="exampleInputFile" />
                </div></td>
              </tr>
              <tr>
                <td>用户</td>
                <td>
                  <s:property value="#session.logonUser.account" />
                </td>
              </tr>
              <tr>
                <td>密码</td>
                <td><input type="text" class="form-control" required
                           name="user.password" value="<s:property value='#session.logonUser.password'/>"></td>
              </tr>
              <tr>
                <td>昵称</td>
                <td><input type="text" class="form-control" required
                           name="user.userName" value="<s:property value='#session.logonUser.userName'/>"></td>
              </tr>
              <tr>
                <td>生日</td>
                <td><input type="datetime" class="form-control" required
                           name="user.birthday" value="<s:property value='#session.logonUser.birthday'/>"></td>
              </tr>
              <tr>
                <td>邮箱</td>
                <td><input type="text" class="form-control" required
                           name="user.email" value="<s:property value='#session.logonUser.email'/>"></td>
              </tr>
              <tr>
                <td>备注</td>
                <td>
                  <input type="text" class="form-control" required
                         name="user.marks" value="<s:property value='#session.logonUser.marks'/>">
                </td>
              </tr>
              <tr>
                <td colspan=2 align="center"><button type="submit"
                                                     class="btn btn-primary">确定</button>&nbsp;&nbsp;&nbsp;
                  <button type="reset" class="btn btn-default">取消</button></td>
              </tr>

              </tbody>
            </table>
          </form>
        </div>
        <div class="col-md-2 column"></div>
      </div>
      <div align="right">
        <ul class="pagination">
          <li><a href="#">Prev</a></li>
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">Next</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<s:include value="/include/bottom.jsp" />
</body>
</html>
