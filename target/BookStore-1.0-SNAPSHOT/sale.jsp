<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:useBean id="lists" class="dao.ListProductDAO" scope="request"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/rate.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container mt-100">
    <h5 style="color: black">ĐANG GIẢM GIÁ - <a href="SearchPriceSaleController.html?index=1">tất cả</a></h5>
    <div class="row">
        <c:forEach items="${lists.listSale}" var="i" >
            <div class="col-md-4 col-sm-6">
                <div class="card mb-30"><a class="card-img-tiles" href="InformationProductController.html?id=${i.id}"
                                           data-abc="true"><div class="inner">
                        <div class="main-img"><img src="${i.img}" alt="Category"></div>
                        <div class="thumblist"><img src="${i.img}" alt="Category"><img src="${i.img}" alt="Category"></div>
                    </div>
                </a>
                    <div class="card-body text-center">
                        <h4 class="card-title"><a style="color: #0b2e13" href="InformationProductController.html?id=${i.id}">${i.name}</a></h4>
                        <p class="text-muted">
<%--                        <p class="text-muted"><strike>${i.price}đ</strike> - ${i.price_sale}đ</p>--%>
                        <c:set var = "salaryy" scope = "session" value = "${String.valueOf(i.price)}"/>
                        <c:set var = "salary" scope = "session" value = "${String.valueOf(i.price_sale)}"/>

                            <%--  if sale  --%>
                            <c:choose>
                                <%-- 1.000 --%>
                                <c:when test="${salary.length() == 4}">
                                    ${salary.substring(0,1)}.${salary.substring(1)}đ -
                                    <strike>${salaryy.substring(0,1)}.${salaryy.substring(1)}đ</strike>
                                </c:when>
                                <%-- 10.000 --%>
                                <c:when test="${salary.length() == 5}">
                                    ${salary.substring(0,2)}.${salary.substring(2)}đ -
                                    <strike>${salaryy.substring(0,2)}.${salaryy.substring(2)}đ</strike>
                                </c:when>
                                <%-- 100.000 --%>
                                <c:when test="${salary.length() == 6}">
                                    ${salary.substring(0,3)}.${salary.substring(3)}đ -
                                    <strike>${salaryy.substring(0,3)}.${salaryy.substring(3)}đ</strike>
                                </c:when>
                                <%-- 1.000.000 --%>
                                <c:when test="${salary.length() == 7}">
                                    ${salary.substring(0,1)}.${salary.substring(1,4)}.${salary.substring(4)}đ -
                                    <strike>$${salaryy.substring(0,1)}.${salaryy.substring(1,4)}.${salaryy.substring(4)}đ</strike>
                                </c:when>
                                <%-- 10.000.000 --%>
                                <c:when test="${salary.length() == 8}">
                                    ${salary.substring(0,2)}.${salary.substring(2,5)}.${salary.substring(5)}đ -
                                    <strike>${salaryy.substring(0,2)}.${salaryy.substring(2,5)}.${salaryy.substring(5)}đ</strike>
                                </c:when>
                            </c:choose>
                        </p>

                        <a class="btn btn-outline-primary btn-sm" href="CartController.html?id=${i.id}&action=add&number=1" data-abc="true">
                            Thêm vào giỏ hàng</a>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
</div>
<br>
</body>
</html>