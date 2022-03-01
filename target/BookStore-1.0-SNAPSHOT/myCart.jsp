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
        <div class="col-md-6">
            <div class="p-2">
            </div>
            <div class="p-2">
                <h4>GIỎ HÀNG(đã thanh toán)</h4>
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
            <c:forEach items="${sessionScope.orderCart}" var="i">
                <h5>${mess}</h5>
                <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                    <div class="mr-1"><img class="rounded" src="${i.img}" width="70"></div>
                    <div class="col-4 d-flex flex-column align-items-center product-details"><span class="font-weight-bold">${i.productName}</span>
                        <div class="d-flex flex-row product-desc">
                            <div class="size mr-1"><span class="text-grey">  </span><span class="font-weight-bold">  </span></div>
                            <div class="color"><span class="text-grey">  </span><span class="font-weight-bold">  </span></div>
                        </div>
                    </div>
                    <div class="col-1 d-flex flex-row align-items-center qty">
                        <h5 class="text-grey mt-1 ml-2">${i.productQuantity}</h5><i class="fa fa-mail-reply"></i><i class="fa fa-mail-reply"></i>
                    </div>
                    <div>
<%--                        <h5 class="mt-1 ml-5 text-grey">${i.productPrice * i.productQuantity}đ</h5>--%>

                        <c:set var = "salary" scope = "session" value = "${String.valueOf(i.productPrice * i.productQuantity)}"/>
                        <c:choose>

                            <%-- 1.000 --%>
                            <c:when test="${salary.length() == 4}">
                                <h5 class="mt-1 ml-5 text-grey">${salary.substring(0,1)}.${salary.substring(1)}đ</h5>
                            </c:when>
                            <%-- 10.000 --%>
                            <c:when test="${salary.length() == 5}">
                                <h5 class="mt-1 ml-5 text-grey">${salary.substring(0,2)}.${salary.substring(2)}đ</h5>
                            </c:when>
                            <%-- 100.000 --%>
                            <c:when test="${salary.length() == 6}">
                                <h5 class="mt-1 ml-5 text-grey">${salary.substring(0,3)}.${salary.substring(3)}đ</h5>
                            </c:when>
                            <%-- 1.000.000 --%>
                            <c:when test="${salary.length() == 7}">
                                <h5 class="mt-1 ml-5 text-grey">${salary.substring(0,1)}.${salary.substring(1,4)}.${salary.substring(4)}đ</h5>
                            </c:when>
                            <%-- 10.000.000 --%>
                            <c:when test="${salary.length() == 8}">
                                <h5 class="mt-1 ml-5 text-grey">${salary.substring(0,2)}.${salary.substring(2,5)}.${salary.substring(5)}đ</h5>
                            </c:when>

                        </c:choose>

                    </div>
                    <div class="d-flex align-items-center"><a href="CartController.html?id=${i.productId}&action=delete&number=${i.productQuantity}">
                        <i class="fa fa-android"></i></a></div>
                </div>
            </c:forEach>
            <%-- product DAO --%>

        </div>

        <div class="col-md-6">
            <div class="p-2">
            </div>
            <div class="p-2">
                <h4>GIỎ HÀNG(chưa thanh toán)</h4>
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
                <h5>${mess}</h5>
                <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                    <div class="mr-1"><img class="rounded" src="${i.img}" width="70"></div>
                    <div class="col-4 d-flex flex-column align-items-center product-details"><span class="font-weight-bold">${i.name}</span>
                        <div class="d-flex flex-row product-desc">
                            <div class="size mr-1"><span class="text-grey">  </span><span class="font-weight-bold">  </span></div>
                            <div class="color"><span class="text-grey">  </span><span class="font-weight-bold">  </span></div>
                        </div>
                    </div>
                    <div class="col-1 d-flex flex-row align-items-center qty">
                        <h5 class="text-grey mt-1 ml-2">${i.number}</h5><i class="fa fa-mail-reply"></i><i class="fa fa-mail-reply"></i>
                    </div>
                    <div>
                        <h5 class="mt-1 ml-5 text-grey">${i.price_sale * i.number}đ</h5>
                    </div>
                    <div class="d-flex align-items-center"><a href="MyCartController.html?id=${i.id}&action=delete">
                        <i class="fa fa-trash mb-1 text-danger"></i></a></div>
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
