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
                                <li class="breadcrumb-item font-weight-bold "><a class="white-text text-uppercase " href="adminHome.jsp"><span class="mr-md-3 mr-1">DANH MỤC SẢN PHẨM</span></a><i class="fa fa-angle-double-right " aria-hidden="true"></i></li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="row justify-content-around">
                    <div class="col-md-5">
                        <div class="card border-0">
                            <div class="card-header pb-0">
                                <h2 class="card-title space ">Thêm sản phẩm mới</h2>
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
                                        <p class="mb-2">CHI TIẾT SẢN PHẨM</p>
                                        <hr class="mt-0">
                                    </div>
                                </div>
                                <%--form--%>
                                <form action="NewProductController.html" method="get">
                                    <div class="form-group">
                                        <p class="text-muted mb-1"><b>Tên Sản Phẩm</b></p>
                                        <input type="text" class="form-control form-control-sm" style="height: 40px" name="name"
                                               placeholder="( vd: Dế Mèn Phiêu Lưu Ký (Tái Bản 2020) )">
                                    </div>
                                    <div class="form-group">
                                        <p class="text-muted mb-1"><b>Tác Giả</b></p>
                                        <input type="text" class="form-control form-control-sm" style="height: 40px" name="author"
                                               placeholder="( vd: Tô Hoài )">
                                    </div>
                                    <span class="form-group">
                                        <p class="text-muted mb-1"><b>Giá Tiền</b></p>
                                        <input type="text" style="width: 40%; height: 40px" class="form-control form-control-sm" name="price"
                                                     placeholder="( vd: 135000 )">
                                    </span>
                                    <div class="form-group">
                                        <p class="text-muted mb-1"><b>Giá Tiền Sau Khi giảm(nếu có)</b></p>
                                        <input type="text" style="width: 40%; height: 40px" class="form-control form-control-sm" name="price_sale"
                                                     placeholder="( vd: 130000(nếu có) - 135000(nếu không) )">
                                    </div>
                                    <div class="form-group">
                                        <p class="text-muted mb-1"><b>Url Ảnh Bìa</b></p>
                                        <input type="text" style="height: 40px" class="form-control form-control-sm" name="img"
                                                     placeholder="( vd: https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x.....jpg )">
                                    </div>
                                    <div class="form-group">
                                        <p class="text-muted mb-1"><b>Nhà Xuất Bản</b></p>
                                        <select class="browser-default custom-select" name="supplier">
                                            <option selected value="9">Nhà Xuất Bản Kim Đồng</option>
                                            <option value="1">1980 Books</option>
                                            <option value="2">Alpha Books</option>
                                            <option value="3">AZ Việt Nam</option>
                                            <option value="4">Báo Sinh Viên VN - Hoa Học Trò</option>
                                            <option value="5">Cty Văn Hóa Văn Lang</option>
                                            <option value="6">IPM</option>
                                            <option value="7">Minh Long</option>
                                            <option value="8">Nhã Nam</option>
                                            <option value="10">NXB Tổng Hợp TPHCM</option>
                                            <option value="11">NXB Trẻ</option>
                                            <option value="12">Saigon Books</option>
                                            <option value="13">Skybooks</option>
                                            <option value="14">Tân Việt</option>
                                            <option value="15">Thái Hà</option>
                                            <option value="16">Đinh Tị</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <p class="text-muted mb-1"><b>Lọai Bìa</b></p>
                                        <select class="browser-default custom-select" name="cover_form">
                                            <option selected value="1">Bìa mềm</option>
                                            <option value="2">Bìa Cứng</option>
                                            <option value="3">Bộ hộp</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <p class="text-muted mb-1"><b>Thể Loại</b></p>
                                        <select class="browser-default custom-select" name="category">
                                            <option selected value="6">Văn Học</option>
                                            <option value="1">khoa học kỹ thuật</option>
                                            <option value="2">Kinh Tế</option>
                                            <option value="3">MANGA - LIGHT NOVEL</option>
                                            <option value="4">Nữ Công Gia Chánh</option>
                                            <option value="5">thiếu nhi</option>
                                        </select>
                                    </div>
                                    <div class="row mb-md-5">
                                        <div class="col">
                                            <button type="submit" class="btn btn-primary btn-lg btn-block">
                                                Thêm sản phẩm</button>
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
