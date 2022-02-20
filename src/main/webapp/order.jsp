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
    <%--    <link rel="stylesheet" href="css/cart.css">--%>
</head>
<body>
<c:import url="${sessionScope.header}" />

<div class=" container-fluid my-5 ">
    <div class="row justify-content-center ">
        <div class="col-xl-10">
            <div class="card shadow-lg ">
                <div class="row p-2 mt-3 justify-content-between mx-sm-2">
                    <div class="col">
                        <p class="text-muted space mb-0 shop"></p>
                        <p class="text-muted space mb-0 shop"></p>
                    </div>
                    <div class="col">
                        <div class="row justify-content-start ">
                            <div class="col"> <img class="irc_mi img-fluid cursor-pointer " src="https://courses.funix.edu.vn/static/public.site/images/logo.png" width="70" height="70"> </div>
                        </div>
                    </div>
                    <div class="col-auto"> <img class="irc_mi img-fluid bell" src="https://i.imgur.com/uSHMClk.jpg" width="30" height="30"> </div>
                </div>
                <div class="row mx-auto justify-content-center text-center">
                    <div class="col-12 mt-3 ">
                        <nav aria-label="breadcrumb" class="second ">
                            <ol class="breadcrumb indigo lighten-6 first ">
                                <li class="breadcrumb-item font-weight-bold "><a class="white-text text-uppercase " href="home.jsp"><span class="mr-md-3 mr-1">DANH MỤC SẢN PHẨM</span></a><i class="fa fa-angle-double-right " aria-hidden="true"></i></li>
                                <li class="breadcrumb-item font-weight-bold"><a class="white-text text-uppercase" href="#"><span class="mr-md-3 mr-1">GIỎ HÀNG</span></a><i class="fa fa-angle-double-right text-uppercase " aria-hidden="true"></i></li>
                                <li class="breadcrumb-item font-weight-bold"><a class="white-text text-uppercase active-2" href="#"><span class="mr-md-3 mr-1">THANH TOÁN</span></a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="row justify-content-around">
                    <div class="col-md-5">
                        <div class="card border-0">
                            <div class="card-header pb-0">
                                <h2 class="card-title space ">Thanh Toán</h2>
                                <p class="card-text mt-4 space">CHI TIẾT VẬN CHUYỂN</p>
                                <hr class="my-0">
                            </div>
                            <div class="card-body">
                                <div class="row justify-content-between">
                                    <div class="col-auto mt-0">
                                        <p><b>Vận chuyển từ: 35 - Phú Thủy, Phan thiết - Bình Thuận</b></p>
                                    </div>
                                    <div class="col-auto">
                                        <p><b>Bookstore@gmail.com</b> </p>
                                    </div>
                                </div>

                                <div class="row mt-4">
                                    <div class="col">
                                        <p class="mb-2">CHI TIẾT THANH TOÁN</p>
                                        <hr class="mt-0">
                                    </div>
                                </div>
                                <%--form--%>
                                <form action="PayController.html" method="post">
                                    <div class="form-group">
                                        <p class="text-muted mb-1">Họ Tên Người Nhận</p>
                                        <input type="text" class="form-control form-control-sm" name="username" placeholder="họ và tên..">
                                    </div>
                                    <div class="form-group">
                                        <p class="text-muted mb-1"><b>Địa Chỉ Người Nhận</b></p>
                                        <textarea wrap="soft" style="width: 100%; height: 200%; resize: none" class="form-control form-control-sm"
                                                  name="address" placeholder="Thành phố/Tỉnh.."></textarea>
                                    </div>
                                    <div class="form-group">
                                        <p class="text-muted mb-1">Phương Thức Thanh Toán</p>
                                        <select class="browser-default custom-select">
                                            <option selected>Thanh toán khi nhận hàng</option>
                                            <option value="1">VNPAY</option>
                                            <option value="2">Ví MOMO</option>
                                            <option value="3">Ví ShopeePay</option>
                                            <option value="4">Ví Moca Trên Ứng Dụng Grab</option>
                                        </select>
                                    </div>
                                    <div class="row mb-md-5">
                                        <div class="col">
                                            <button type="submit" class="btn btn-lg btn-block">
                                            Thanh Toán Sản Phẩm</button>
                                        </div>
                                    </div>
                                </form>
                                <%--form--%>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="card border-0 ">
                            <div class="card-header card-2">
                                <p class="card-text mt-md-4 mb-2 space">
                                    Xem Lại Giỏ Hàng <span class=" small text-muted ml-2 cursor-pointer"></span> </p>
                            </div>
                            <br>
                            <div class="card-body pt-0">
                                <c:forEach var="i" items="${sessionScope.cart}">
                                <div class="row justify-content-between">
                                    <div class="col-auto col-md-7">
                                        <div class="media flex-column flex-sm-row">
                                            <img class=" img-fluid" src="${i.img}" width="62" height="62">
                                            <div class="media-body my-auto">
                                                <div class="row ">
                                                    <div class="col-auto">
                                                        <p class="mb-0"><b>${i.name}</b></p>
                                                        <small class="text-muted">${i.author}</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class=" pl-0 flex-sm-col col-auto my-auto">
                                        <p class="boxed-1">${i.number}</p>
                                    </div>
                                    <div class=" pl-0 flex-sm-col col-auto my-auto ">
                                        <p><b>${i.price_sale * i.number}đ</b></p>
                                    </div>
                                </div>
                                <hr class="my-2">
                                </c:forEach>
                                <div class="row ">
                                    <div class="col">
                                        <div class="row justify-content-between">
                                            <div class="col-4">
                                                <p class="mb-1"><b>Giá tiền sản phẩm: </b></p>
                                            </div>
                                            <div class="flex-sm-col col-auto">
                                                <p class="mb-1"><b>${sessionScope.total}đ</b></p>
                                            </div>
                                        </div>
                                        <div class="row justify-content-between">
                                            <div class="col">
                                                <p class="mb-1"><b>Phí vận chuyển: </b></p>
                                            </div>
                                            <div class="flex-sm-col col-auto">
                                                <p class="mb-1"><b>0đ</b></p>
                                            </div>
                                        </div>
                                        <div class="row justify-content-between">
                                            <div class="col-4">
                                                <p><b>Tổng giá tiền: </b></p>
                                            </div>
                                            <div class="flex-sm-col col-auto">
                                                <p class="mb-1"><b>${sessionScope.total}đ</b></p>
                                            </div>
                                        </div>
                                        <hr class="my-0">
                                    </div>
                                </div>
                                <div class="row mb-5 mt-4 ">
                                    <div class="col-md-7 col-lg-6 mx-auto">
                                        <button type="button" class="btn btn-block btn-outline-primary btn-lg">Mã Giảm Giá</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<c:import url="footer.jsp" />
</body>
</html>
