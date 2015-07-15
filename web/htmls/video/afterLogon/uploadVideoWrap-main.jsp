<%--
  Created by IntelliJ IDEA.
  User: jamin
  Date: 7/5/15
  Time: 9:00 PM
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

  <!--提醒视频封面上传中-->
  <script type="text/javascript">
    $(document).ready(function () {
      $('#uploadBtn').click(function () {
        if ($('#inputFile2')[0].value == "") {
          alert('请选择视频封面.');
          return false;
        }
        $('#uploadBtn').after('<h5>正在上传...</h5>');
      });
    });

  </script>

</head>
<body>
<form action="uploadVideoWrap.action" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label for="inputFile2">选择视频封面</label>
    <input type="file" name="file" id="inputFile2" />
    <br/>
    <button class="btn btn-info" id="uploadBtn">开始上传</button><p></p>
  </div>
</form>
</body>
</html>
