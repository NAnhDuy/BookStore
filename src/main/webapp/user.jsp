<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Bookstore</title>
    <!--Important link from https://bootsnipp.com/snippets/XqvZr-->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/information.css">
</head>
<body>
<c:import url="${sessionScope.header}" />

<div class="pd-wrap">
    <div class="container">

        <div class="product-info-tabs">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="#description" style="font-size: medium;">Thông Tin Tài khoản</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="changePassword.jsp">Đổi mật khẩu</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                    <h5 class="mb-3">Tên đăng nhập :   ${sessionScope.user.name}</h5>
                    <h5 class="mb-3">Số điện thoại :   ${sessionScope.user.phone}</h5>
                    <h5 class="mb-3">Email đăng nhập :   ${sessionScope.user.user}</h5>
                </div>
            </div>
        </div>
    </div>

    <br><br><br><br><br>

    <c:import url="footer.jsp" />

</body>
</html>
