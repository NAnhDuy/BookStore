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
<c:import url="header.jsp" />

<div class="container mt-5 mb-5">
    <div class="d-flex justify-content-center row">
        <div class="col-md-8">
            <div class="p-2">
                <h4 class="alert alert-success"><a href="#" style="color: #1b5e20">Tiếp tục mua hàng</a></h4>
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
                <div class="d-flex flex-row align-items-center qty">
                    <h5 class="font-weight-bold mt-1 mr-1 ml-1">Số Lượng</h5>
                </div>
                <div>
                    <h5 class="font-weight-bold">Thành tiền</h5>
                </div>
                <div class="d-flex align-items-center"></div>
            </div>
            <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                <div class="mr-1"><img class="rounded" src="https://i.imgur.com/XiFJkhI.jpg" width="70"></div>
                <div class="d-flex flex-column align-items-center product-details"><span class="font-weight-bold">Basic T-shirt</span>
                    <div class="d-flex flex-row product-desc">
                        <div class="size mr-1"><span class="text-grey">Size:</span><span class="font-weight-bold">&nbsp;M</span></div>
                        <div class="color"><span class="text-grey">Color:</span><span class="font-weight-bold">&nbsp;Grey</span></div>
                    </div>
                </div>
                <div class="d-flex flex-row align-items-center qty">
                    <h5 class="text-grey mt-1 mr-1 ml-1">2</h5><i class="fa fa-mail-reply"></i><i class="fa fa-mail-reply"></i>
                </div>
                <div>
                    <h5 class="text-grey">$20.00</h5>
                </div>
                <div class="d-flex align-items-center"><i class="fa fa-trash mb-1 text-danger"></i></div>
            </div>
            <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                <div class="mr-1"><img class="rounded" src="https://i.imgur.com/XiFJkhI.jpg" width="70"></div>
                <div class="d-flex flex-column align-items-center product-details"><span class="font-weight-bold">Basic T-shirt</span>
                    <div class="d-flex flex-row product-desc">
                        <div class="size mr-1"><span class="text-grey">Size:</span><span class="font-weight-bold">&nbsp;M</span></div>
                        <div class="color"><span class="text-grey">Color:</span><span class="font-weight-bold">&nbsp;Grey</span></div>
                    </div>
                </div>
                <div class="d-flex flex-row align-items-center qty">
                    <h5 class="text-grey mt-1 mr-1 ml-1">2</h5><i class="fa fa-mail-reply"></i><i class="fa fa-mail-reply"></i>
                </div>
                <div>
                    <h5 class="text-grey">$20.00</h5>
                </div>
                <div class="d-flex align-items-center"><i class="fa fa-trash mb-1 text-danger"></i></div>
            </div>
            <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                <div class="mr-1"><img class="rounded" src="https://i.imgur.com/XiFJkhI.jpg" width="70"></div>
                <div class="d-flex flex-column align-items-center product-details"><span class="font-weight-bold">Basic T-shirt</span>
                    <div class="d-flex flex-row product-desc">
                        <div class="size mr-1"><span class="text-grey">Size:</span><span class="font-weight-bold">&nbsp;M</span></div>
                        <div class="color"><span class="text-grey">Color:</span><span class="font-weight-bold">&nbsp;Grey</span></div>
                    </div>
                </div>
                <div class="d-flex flex-row align-items-center qty">
                    <h5 class="text-grey mt-1 mr-1 ml-1">2</h5><i class="fa fa-mail-reply"></i><i class="fa fa-mail-reply"></i>
                </div>
                <div>
                    <h5 class="text-grey">$20.00</h5>
                </div>
                <div class="d-flex align-items-center"><i class="fa fa-trash mb-1 text-danger"></i></div>
            </div>
            <br>
            <div class="d-flex flex-row align-items-center mt-3 p-2 bg-white rounded"><button class="btn btn-warning btn-block btn-lg ml-2 pay-button" type="button">Thanh Toán</button></div>
        </div>
    </div>
</div>
<br><br><br>
<c:import url="footer.jsp" />
</body>
</html>
