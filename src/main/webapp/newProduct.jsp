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
                <div class="row p-2 mt-3 justify-content-between mx-sm-2 text-center">
                    <div class="col">
                        <p class="text-muted space mb-0 shop"></p>
                        <p class="text-muted space mb-0 shop"></p>
                    </div>
                    <div class="col">
                        <div class="row justify-content-start text-left">
                            <h5 style="color:#1c7430;">${mess}</h5>
<%--                            <div class="col"> <img class="irc_mi img-fluid cursor-pointer " src="https://courses.funix.edu.vn/static/public.site/images/logo.png" width="70" height="70"> </div>--%>
                        </div>
                    </div>
                </div>
                <div class="row mx-auto justify-content-center text-center">
                    <div class="col-12 mt-3 ">
                        <nav aria-label="breadcrumb" class="second ">
                            <ol class="breadcrumb indigo lighten-6 first ">
                                <li class="breadcrumb-item font-weight-bold "><a class="white-text text-uppercase " href="adminHome.jsp"><span class="mr-md-3 mr-1">DANH M???C S???N PH???M</span></a><i class="fa fa-angle-double-right " aria-hidden="true"></i></li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="row justify-content-around">
                    <div class="col-md-5">
                        <div class="card border-0">
                            <div class="card-header pb-0">
                                <h2 class="card-title space ">Th??m s???n ph???m m???i</h2>
                                <hr class="my-0">
                            </div>
                            <div class="card-body">
                                <div class="row justify-content-between">
                                    <div class="col-auto mt-0">
                                        <h5 style="color:#0da9ef;">${mess}</h5>
                                    </div>
                                    <div class="col-auto">
                                    </div>
                                </div>

                                <div class="row mt-4">
                                    <div class="col">
                                        <p class="mb-2">CHI TI???T S???N PH???M</p>
                                        <hr class="mt-0">
                                    </div>
                                </div>
                                <%--form--%>
                                <form action="NewProductController.html" method="get">
                                    <div class="form-group">
                                        <p class="text-muted mb-1"><b>T??n S???n Ph???m</b></p>
                                        <input type="text" class="form-control form-control-sm" style="height: 40px" name="name"
                                               placeholder="( vd: D??? M??n Phi??u L??u K?? (T??i B???n 2020) )">
                                    </div>
                                    <div class="form-group">
                                        <p class="text-muted mb-1"><b>T??c Gi???</b></p>
                                        <input type="text" class="form-control form-control-sm" style="height: 40px" name="author"
                                               placeholder="( vd: T?? Ho??i )">
                                    </div>
                                    <span class="form-group">
                                        <p class="text-muted mb-1"><b>Gi?? Ti???n</b></p>
                                        <input type="text" style="width: 40%; height: 40px" class="form-control form-control-sm" name="price"
                                                     placeholder="( vd: 135000 )">
                                    </span>
                                    <div class="form-group">
                                        <p class="text-muted mb-1"><b>Gi?? Ti???n Sau Khi gi???m(n???u c??)</b></p>
                                        <input type="text" style="width: 40%; height: 40px" class="form-control form-control-sm" name="price_sale"
                                                     placeholder="( vd: 130000(n???u c??) - 135000(n???u kh??ng) )">
                                    </div>
                                    <div class="form-group">
                                        <p class="text-muted mb-1"><b>Url ???nh B??a</b></p>
                                        <input type="text" style="height: 40px" class="form-control form-control-sm" name="img"
                                                     placeholder="( vd: https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x.....jpg )">
                                    </div>
                                    <div class="form-group">
                                        <p class="text-muted mb-1"><b>Nh?? Xu???t B???n</b></p>
                                        <select class="browser-default custom-select" name="supplier">
                                            <option selected value="9">Nh?? Xu???t B???n Kim ?????ng</option>
                                            <option value="1">1980 Books</option>
                                            <option value="2">Alpha Books</option>
                                            <option value="3">AZ Vi???t Nam</option>
                                            <option value="4">B??o Sinh Vi??n VN - Hoa H???c Tr??</option>
                                            <option value="5">Cty V??n H??a V??n Lang</option>
                                            <option value="6">IPM</option>
                                            <option value="7">Minh Long</option>
                                            <option value="8">Nh?? Nam</option>
                                            <option value="10">NXB T???ng H???p TPHCM</option>
                                            <option value="11">NXB Tr???</option>
                                            <option value="12">Saigon Books</option>
                                            <option value="13">Skybooks</option>
                                            <option value="14">T??n Vi???t</option>
                                            <option value="15">Th??i H??</option>
                                            <option value="16">??inh T???</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <p class="text-muted mb-1"><b>L???ai B??a</b></p>
                                        <select class="browser-default custom-select" name="cover_form">
                                            <option selected value="1">B??a m???m</option>
                                            <option value="2">B??a C???ng</option>
                                            <option value="3">B??? h???p</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <p class="text-muted mb-1"><b>Th??? Lo???i</b></p>
                                        <select class="browser-default custom-select" name="category">
                                            <option selected value="6">V??n H???c</option>
                                            <option value="1">khoa h???c k??? thu???t</option>
                                            <option value="2">Kinh T???</option>
                                            <option value="3">MANGA - LIGHT NOVEL</option>
                                            <option value="4">N??? C??ng Gia Ch??nh</option>
                                            <option value="5">thi???u nhi</option>
                                        </select>
                                    </div>
                                    <div class="row mb-md-5">
                                        <div class="col">
                                            <button type="submit" class="btn btn-primary btn-lg btn-block">
                                                Th??m s???n ph???m</button>
                                        </div>
                                    </div>
                                </form>
                                <%--form--%>

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
