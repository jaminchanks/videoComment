<%--
  Created by IntelliJ IDEA.
  User: jamin
  Date: 6/4/15
  Time: 10:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
  </head>
  <body>
<form action="login.action" method="post">
  <table>
    <tr>
      <td>账号:</td> <td><input type="text" name="user.userName"></td>
    </tr>
    <tr>
      <td>密码:</td> <td><input type="password" name="user.password"></td>
    </tr>
    <tr>
      <td><input type="submit" value="登陆"></td>
    </tr>
  </table>
</form>
  </body>
</html>
