<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>sign in</title>
  <!-- https://bootsnipp.com/snippets/dldxB -->
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <link rel="stylesheet" href="css/login.css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <!------ Include the above in your HEAD tag ---------->
</head>
<body>

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="https://flyclipart.com/thumb2/login-935679.png" style="height: 20%; width: 20%; padding-top: 10px; padding-bottom: 30px" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
    <form action="SignInController.html" method="get">
      <span style="color: red">${error}</span>
      <input type="text" class="fadeIn second" name="name" placeholder="Nhập tên người dùng">
      <input type="text" class="fadeIn second" name="username" placeholder="Nhập Email">
      <input type="password" class="fadeIn third" name="password" placeholder="Nhập Mật khẩu">
      <input type="password" class="fadeIn third" name="password2" placeholder="Nhập lại Mật khẩu">
      <input type="text" class="fadeIn third" name="phone" placeholder="Số điện thoại">
      <br>
      <input type="submit" class="fadeIn fourth" value="Đăng ký">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="login.jsp">Đăng nhập &ensp;</a>
      <a class="underlineHover" href="#">&ensp; Quên mật khẩu?</a>
    </div>

  </div>
</div>
</body>
</html>
