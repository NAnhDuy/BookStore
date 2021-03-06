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
                                <li class="breadcrumb-item font-weight-bold "><a class="white-text text-uppercase " href="home.jsp"><span class="mr-md-3 mr-1">DANH M???C S???N PH???M</span></a><i class="fa fa-angle-double-right " aria-hidden="true"></i></li>
                                <li class="breadcrumb-item font-weight-bold"><a class="white-text text-uppercase" href="#"><span class="mr-md-3 mr-1">GI??? H??NG</span></a><i class="fa fa-angle-double-right text-uppercase " aria-hidden="true"></i></li>
                                <li class="breadcrumb-item font-weight-bold"><a class="white-text text-uppercase active-2" href="#"><span class="mr-md-3 mr-1">THANH TO??N</span></a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="row justify-content-around">
                    <div class="col-md-5">
                        <div class="card border-0">
                            <div class="card-header pb-0">
                                <h2 class="card-title space ">Thanh To??n</h2>
                                <p class="card-text mt-4 space">CHI TI???T V???N CHUY???N</p>
                                <hr class="my-0">
                            </div>
                            <div class="card-body">
                                <div class="row justify-content-between">
                                    <div class="col-auto mt-0">
                                        <p><b>V???n chuy???n t???: 35 - Ph?? Th???y, Phan thi???t - B??nh Thu???n</b></p>
                                    </div>
                                    <div class="col-auto">
                                        <p><b>Bookstore@gmail.com</b> </p>
                                    </div>
                                </div>

                                <div class="row mt-4">
                                    <div class="col">
                                        <p class="mb-2">CHI TI???T THANH TO??N</p>
                                        <hr class="mt-0">
                                    </div>
                                </div>
                                <%--form--%>
                                <form action="PayController.html" method="post">
                                    <div class="form-group">
                                        <p class="text-muted mb-1">H??? T??n Ng?????i Nh???n</p>
                                        <input type="text" class="form-control form-control-sm" name="username" placeholder="h??? v?? t??n..">
                                    </div>
                                    <div class="form-group">
                                        <p class="text-muted mb-1"><b>?????a Ch??? Ng?????i Nh???n</b></p>
                                        <textarea wrap="soft" style="width: 100%; height: 200%; resize: none" class="form-control form-control-sm"
                                                  name="address" placeholder="Th??nh ph???/T???nh.."></textarea>
                                    </div>
                                    <div class="form-group">
                                        <p class="text-muted mb-1">Ph????ng Th???c Thanh To??n</p>
                                        <select class="browser-default custom-select">
                                            <option selected>Thanh to??n khi nh???n h??ng</option>
                                            <option value="1">VNPAY</option>
                                            <option value="2">V?? MOMO</option>
                                            <option value="3">V?? ShopeePay</option>
                                            <option value="4">V?? Moca Tr??n ???ng D???ng Grab</option>
                                        </select>
                                    </div>
                                    <div class="row mb-md-5">
                                        <div class="col">
                                            <button type="submit" class="btn btn-lg btn-block">
                                            Thanh To??n S???n Ph???m</button>
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
                                    Xem L???i Gi??? H??ng <span class=" small text-muted ml-2 cursor-pointer"></span> </p>
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
<%--                                        <p><b>${i.price_sale * i.number}??</b></p>--%>

                                        <c:set var = "salary" scope = "session" value = "${String.valueOf(i.price_sale * i.number)}"/>
                                        <c:choose>

                                            <%-- 1.000 --%>
                                            <c:when test="${salary.length() == 4}">
                                                <p><b>${salary.substring(0,1)}.${salary.substring(1)}??</b></p>
                                            </c:when>
                                            <%-- 10.000 --%>
                                            <c:when test="${salary.length() == 5}">
                                                <p><b>${salary.substring(0,2)}.${salary.substring(2)}??</b></p>
                                            </c:when>
                                            <%-- 100.000 --%>
                                            <c:when test="${salary.length() == 6}">
                                                <p><b>${salary.substring(0,3)}.${salary.substring(3)}??</b></p>
                                            </c:when>
                                            <%-- 1.000.000 --%>
                                            <c:when test="${salary.length() == 7}">
                                                <p><b>${salary.substring(0,1)}.${salary.substring(1,4)}.${salary.substring(4)}??</b></p>
                                            </c:when>
                                            <%-- 10.000.000 --%>
                                            <c:when test="${salary.length() == 8}">
                                                <p><b>${salary.substring(0,2)}.${salary.substring(2,5)}.${salary.substring(5)}??</b></p>
                                            </c:when>

                                        </c:choose>

                                    </div>
                                </div>
                                <hr class="my-2">
                                </c:forEach>
                                <div class="row ">
                                    <div class="col">
                                        <div class="row justify-content-between">
                                            <div class="col-4">
                                                <p class="mb-1"><b>Gi?? ti???n s???n ph???m: </b></p>
                                            </div>
                                            <div class="flex-sm-col col-auto">
<%--                                                <p class="mb-1"><b>${sessionScope.total}??</b></p>--%>

                                                <c:set var = "salary" scope = "session" value = "${String.valueOf(sessionScope.total)}"/>
                                                <c:choose>

                                                    <%-- 1.000 --%>
                                                    <c:when test="${salary.length() == 4}">
                                                        <p><b>${salary.substring(0,1)}.${salary.substring(1)}??</b></p>
                                                    </c:when>
                                                    <%-- 10.000 --%>
                                                    <c:when test="${salary.length() == 5}">
                                                        <p><b>${salary.substring(0,2)}.${salary.substring(2)}??</b></p>
                                                    </c:when>
                                                    <%-- 100.000 --%>
                                                    <c:when test="${salary.length() == 6}">
                                                        <p><b>${salary.substring(0,3)}.${salary.substring(3)}??</b></p>
                                                    </c:when>
                                                    <%-- 1.000.000 --%>
                                                    <c:when test="${salary.length() == 7}">
                                                        <p><b>${salary.substring(0,1)}.${salary.substring(1,4)}.${salary.substring(4)}??</b></p>
                                                    </c:when>
                                                    <%-- 10.000.000 --%>
                                                    <c:when test="${salary.length() == 8}">
                                                        <p><b>${salary.substring(0,2)}.${salary.substring(2,5)}.${salary.substring(5)}??</b></p>
                                                    </c:when>

                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="row justify-content-between">
                                            <div class="col">
                                                <p class="mb-1"><b>Ph?? v???n chuy???n: </b></p>
                                            </div>
                                            <div class="flex-sm-col col-auto">
                                                <p class="mb-1"><b>0??</b></p>
                                            </div>
                                        </div>
                                        <div class="row justify-content-between">
                                            <div class="col-4">
                                                <p><b>T???ng gi?? ti???n: </b></p>
                                            </div>
                                            <div class="flex-sm-col col-auto">
<%--                                                <p class="mb-1"><b>${sessionScope.total}??</b></p>--%>

                                                <c:set var = "salary" scope = "session" value = "${String.valueOf(sessionScope.total)}"/>
                                                <c:choose>

                                                    <%-- 1.000 --%>
                                                    <c:when test="${salary.length() == 4}">
                                                        <p><b>${salary.substring(0,1)}.${salary.substring(1)}??</b></p>
                                                    </c:when>
                                                    <%-- 10.000 --%>
                                                    <c:when test="${salary.length() == 5}">
                                                        <p><b>${salary.substring(0,2)}.${salary.substring(2)}??</b></p>
                                                    </c:when>
                                                    <%-- 100.000 --%>
                                                    <c:when test="${salary.length() == 6}">
                                                        <p><b>${salary.substring(0,3)}.${salary.substring(3)}??</b></p>
                                                    </c:when>
                                                    <%-- 1.000.000 --%>
                                                    <c:when test="${salary.length() == 7}">
                                                        <p><b>${salary.substring(0,1)}.${salary.substring(1,4)}.${salary.substring(4)}??</b></p>
                                                    </c:when>
                                                    <%-- 10.000.000 --%>
                                                    <c:when test="${salary.length() == 8}">
                                                        <p><b>${salary.substring(0,2)}.${salary.substring(2,5)}.${salary.substring(5)}??</b></p>
                                                    </c:when>

                                                </c:choose>
                                            </div>
                                        </div>
                                        <hr class="my-0">
                                    </div>
                                </div>
                                <div class="row mb-5 mt-4 ">
                                    <div class="col-md-7 col-lg-6 mx-auto">
                                        <button type="button" class="btn btn-block btn-outline-primary btn-lg">M?? Gi???m Gi??</button>
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
