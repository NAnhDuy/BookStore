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
    <div class="d-flex justify-content-left row">
        <div class="col-md-12">
            <div class="p-2">
                <h4><a href="home.jsp" style="color: #1b5e20; text-align: center">${payMess}</a></h4>
                <br>
<%--                <h4 class="alert alert-success"><a href="home.jsp" style="color: #1b5e20">Tiếp tục mua hàng</a></h4>--%>
            </div>
            <div class="">
                <h4>ĐƠN HÀNG HIỆN CÓ</h4>
                <div class="d-flex flex-row align-items-center pull-right">
                    <span class="mr-1"></span><span class="mr-1 font-weight-bold"></span>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-2">
                    <span class="font-weight-bold"><h5>tài khoản</h5></span>
                </div>
                <div class="col-2">
                    <span class="font-weight-bold"><h5>Số điện thoại</h5></span>
                </div>
                <div class="col-2 sm-6">
                    <span class="font-weight-bold"><h5>Địa chỉ</h5></span>
                </div>
                <div class="col-2 sm-6">
                    <span class="font-weight-bold"><h5>Sản phẩm</h5></span>
                </div>
                <div class="col-2 sm-6 pl-3">
                    <span class="font-weight-bold "><h5>Giá tiền</h5></span>
                </div>
                <div class="col-2 sm-6">
                    <span class="font-weight-bold"><h5>Ngày mua hàng</h5></span>
                </div>
            </div>

            <%-- product DAO --%>
            <c:forEach items="${listO}" var="i">
                <div class="row mt-3">
                    <div class="col-md-2 col-1">
                        <span class="">${i.mail}</span>
                    </div>
                    <div class="col-2 sm-6">
                        <span class="">${i.phone}</span>
                    </div>
                    <div class="col-2 sm-6">
                        <span class="">${i.address}</span>
                    </div>
                    <div class="col-2 sm-6">
                        <span class="">${i.productName}</span>
                    </div>
                    <div class="col-2 pl-3">
                        <span class="">
                            <c:set var = "salary" scope = "session" value = "${String.valueOf(i.productPrice)}"/>
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
                                    ${salary.substring(0,1)}.${salary.substring(1,4)}.${salary.substring(4)}đ
                                </c:when>
                                <%-- 10.000.000 --%>
                                <c:when test="${salary.length() == 8}">
                                    ${salary.substring(0,2)}.${salary.substring(2,5)}.${salary.substring(5)}đ
                                </c:when>

                            </c:choose>
                        </span>
                    </div>
                    <div class="col-2 sm-6">
                        <span class="">${i.order_date}</span>
                    </div>
                </div>
            </c:forEach>
            <%-- product DAO --%>

            <br>
            <div class="d-flex flex-row align-items-center mt-3 p-2 bg-white rounded">
            </div>
        </div>
    </div>
</div>
<br><br><br><br><br><br>
<c:import url="footer.jsp" />
</body>
</html>
