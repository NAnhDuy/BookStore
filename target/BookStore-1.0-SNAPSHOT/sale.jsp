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
    <h5 style="color: black">ĐANG GIẢM GIÁ - <a href="allSalePage.jsp">tất cả</a></h5>
    <div class="row">
        <c:forEach items="${lists.listSale}" var="i" >
            <div class="col-md-4 col-sm-6">
                <div class="card mb-30"><a class="card-img-tiles" href="#" data-abc="true">
                    <div class="inner">
                        <div class="main-img"><img src="${i.img}" alt="Category"></div>
                        <div class="thumblist"><img src="${i.img}" alt="Category"><img src="${i.img}" alt="Category"></div>
                    </div>
                </a>
                    <div class="card-body text-center">
                        <h4 class="card-title">${i.name}</h4>
                        <p class="text-muted"><strike>${i.price}đ</strike> - ${i.price_sale}đ</p>
                        <a class="btn btn-outline-primary btn-sm" href="#" data-abc="true">Thêm vào giỏ hàng</a>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
</div>
<br>
</body>
</html>