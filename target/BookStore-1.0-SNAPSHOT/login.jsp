<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
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
      <img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQDhVbnLoLzbmK1VF2oSnpkO3jwH-Z3AFexQWBO2wDPtm9D2zJb"
           style="height: 20%; width: 20%; padding-top: 30px; padding-bottom: 30px" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
    <form action="LoginController.html" method="post">
      <span style="color: red">${error}</span>
      <input type="text" class="fadeIn second" name="username" placeholder="Nhập Tài khoản">
      <input type="password" class="fadeIn third" name="password" placeholder="Nhập Mật khẩu">
      <br>
      <input type="submit" class="fadeIn fourth" value="Đăng Nhập">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="signIn.jsp">Đăng ký &ensp;</a>
      <a class="underlineHover" href="#">&ensp; Quên mật khẩu?</a>
    </div>

  </div>
</div>
</body>
</html>
