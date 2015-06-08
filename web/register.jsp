<%--
  Created by IntelliJ IDEA.
  User: jamin
  Date: 6/7/15
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>regist</title>
  <link href="/tools/bootstrap3/css/signin.css" rel="stylesheet">

<!-- js验证 --
  <script language="javascript" type="text/javascript">
    function check() {//校验用户输入信息的格式
      var acnt = document.getElementsByName("account")[0].value;
      var pwd = document.getElementsByName("password")[0].value;
      var name = document.getElementsByName("userName")[0].value;
      var age = document.getElementsByName("age")[0].value;
      var email = document.getElementsByName("email")[0].value;
      var emlreg = new RegExp("\\w+[@]{1}\\w+[.]{1}\\w+");
      var ageReg = new RegExp("[0-9]+");
      if (acnt == ""){
        alert("帐户不能为空");
        return false;
      }
      else if (pwd == "" || pwd.length <6 ){
        alert("密码不能为空 且必须6位以上字符");
        return false;
      }
      else if (name == ""){
        alert("昵称不能为空");
        return false;
      }
      else if (age == "" ||!ageReg.test(age)|| !(age <150 && age >0)){
        alert("年龄不能为空且 数字为0～150");
        return false;
      }
      else if (email =="" || !(emlreg.test(email))){
        alert("邮箱不能为空，正式格式xxx@yyy.zzz");
        return false;
      }
      else
        return true;
    }

  </script>
  <!-- js验证 -->
</head>
<body style="background-color: #eee;">
<s:include value="/include/top.jsp" />
<div class="container">
  <div class="row">
    <div class="col-md-3 column"></div>
    <div class="col-md-6 column">
      <form class="form-signin" role="form" action="RegisterHandle" method="post">
        <h2 class="form-signin-heading">用户注册</h2>
        帐号 <input type="text" class="form-control" placeholder="account"
                  required autofocus name="account"> 密码 <input
              type="password" class="form-control" placeholder="Password"
              required name="password"> 昵称 <input type="text"
                                                  class="form-control" placeholder="user name" required autofocus
                                                  name="userName"> 年龄 <input type="text"
                                                                             class="form-control" placeholder="age from 1-150" required
                                                                             autofocus name="age"> 电子邮箱 <input type="email"
                                                                                                               class="form-control" placeholder="Email address" required
                                                                                                               autofocus name="email">
        <br/>
        <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="">注册</button>
      </form>
    </div>
    <div class="col-md-3 column"></div>
  </div>
</div>
<!-- /container -->
<s:include value="/include/bottom.jsp" />
</body>
</html>
