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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%--    <link rel="stylesheet" href="css/cart.css">--%>
</head>
<body>
<c:import url="${sessionScope.header}" />

<div class="container mt-5 mb-5">
    <div class="d-flex justify-content-center row">
        <div class="col-md-8">
            <div class="p-2">
                <h4><a href="home.jsp" style="color: #1b5e20; text-align: center">${payMess}</a></h4>
                <br>
                <h4 class="alert alert-success"><a href="home.jsp" style="color: #1b5e20">Tiếp tục mua hàng</a></h4>
            </div>
            <div class="p-2">
                <h4>GIỎ HÀNG</h4>
                <div class="d-flex flex-row align-items-center pull-right">
                    <span class="mr-1"></span><span class="mr-1 font-weight-bold"></span>
                </div>
            </div>
            <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                <div class="d-flex flex-column align-items-center product-details">
                    <span class="font-weight-bold"><h5>Sản Phẩm</h5></span>
                </div>
                <div class="mr-1"></div>
                <div class="d-flex flex-column align-items-center product-details">
                    <span class="font-weight-bold"><h5></h5></span>
                </div>
                <div class="d-flex flex-column align-items-center product-details">
                    <span class="font-weight-bold"><h5></h5></span>
                </div>
                <div class="d-flex flex-column align-items-center product-details">
                    <span class="font-weight-bold"><h5></h5></span>
                </div>
                <div class="d-flex flex-column align-items-center product-details">
                    <span class="font-weight-bold"><h5></h5></span>
                </div>
                <div class="d-flex flex-row align-items-center qty">
                    <h5 class="font-weight-bold"></h5>
                </div>
                <div class="d-flex flex-row align-items-center qty">
                    <h5 class="font-weight-bold">Số Lượng</h5>
                </div>
                <div>
                    <h5 class="font-weight-bold">Thành tiền</h5>
                </div>
                <div class="d-flex align-items-center"></div>
            </div>

           <%-- product DAO --%>
            <c:forEach items="${sessionScope.cart}" var="i">
            <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                <div class="mr-1"><img class="rounded" src="${i.img}" width="70"></div>
                <div class="col-4 d-flex flex-column align-items-center product-details">
                    <span class="font-weight-bold">${i.name}</span>

                </div>
                <div class="col-1">
                    <h5 class="text-grey"><i class="fa fa-android"></i>${i.number}</h5>
                    <i class="fa fa-mail-reply"></i><i class="fa fa-mail-reply"></i>
                </div>
                <div class="d-flex flex-row">
                    <h5 class="mb-3 text-grey">${i.price_sale * i.number}đ</h5>

                    <c:set var = "salary" scope = "session" value = "${String.valueOf(i.price_sale * i.number)}"/>
                    <c:choose>

                        <%-- 1.000 --%>
                        <c:when test="${salary.length() == 4}">
                            ${salary.substring(0,1)}.${salary.substring(1)}đ
                        </c:when>
                        <%-- 10.000 --%>
                        <c:when test="${salary.length() == 5}">
                            ${salary.substring(0,2)}.${salary.substring(2)}đ
                        </c:when>
                        <%-- 100.000 --%>
                        <c:when test="${salary.length() == 6}">
                            ${salary.substring(0,3)}.${salary.substring(3)}đ
                        </c:when>
                        <%-- 1.000.000 --%>
                        <c:when test="${salary.length() == 7}">
                            ${salary.substring(0,1)}.${salary.substring(1,3)}.${salary.substring(3)}đ
                        </c:when>
                        <%-- 10.000.000 --%>
                        <c:when test="${salary.length() == 8}">
                            ${salary.substring(0,2)}.${salary.substring(2,3)}.${salary.substring(4)}đ
                        </c:when>
                        <c:otherwise>
                            No comment sir...
                        </c:otherwise>

                    </c:choose>

                </div>
                <div class="d-flex flex-row align-items-center"><a href="CartController.html?id=${i.id}&action=delete&number=${i.number}">
                    <i class="fa fa-trash mb-3 text-danger"></i></a></div>
            </div>
            </c:forEach>
            <%-- product DAO --%>

            <br>
            <div class="d-flex flex-row align-items-center mt-3 p-2 bg-white rounded">
                <a href="OrderController.html" class="btn btn-warning btn-block btn-lg ml-2 pay-button" type="button">Thanh Toán</a>
            </div>
        </div>
    </div>
</div>
<br><br><br>
<c:import url="footer.jsp" />
</body>
</html>
