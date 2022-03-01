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
                        <div class="row justify-content-start ">
                            <div class="col"> <img class="irc_mi img-fluid cursor-pointer " src="https://courses.funix.edu.vn/static/public.site/images/logo.png" width="70" height="70"> </div>
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
                <div class="">
                    <div class="col-md-8 text-left ml-5">
                        <div class="card border-0">
                            <div class="card-header pb-0">
                                <h2 class="card-title space ">Chỉnh Sửa Sản Phẩm</h2>
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

                                <div class="row mt-3">
                                    <div class="col">
                                        <p class="mb-2">CHI TIẾT SẢN PHẨM</p>
                                        <hr class="mt-0">
                                    </div>
                                </div>
                                <%--form--%>
                                <form action="EditUpdateController.html" method="get">

                                    <div class="form-group row mb-4">
                                        <p class="col-3 col-form-label"><b>Tên Sản Phẩm: </b></p>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control form-control-sm" style="height: 40px" name="product_name"
                                                    value="${product.name}">
                                        </div>
                                    </div>
                                    <div class="form-group row mb-4">
                                        <p class="col-3 col-form-label"><b>Tác Giả: </b></p>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control form-control-sm" style="height: 40px" name="product_author"
                                                   value="${product.author}">
                                        </div>
                                    </div>
                                    <div class="form-group row mb-4">
                                        <p class="col-3 col-form-label"><b>Giá Tiền: </b></p>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control form-control-sm" style="height: 40px" name="product_price"
                                                   value="${product.price}">
                                        </div>
                                    </div>
                                    <div class="form-group row mb-4">
                                        <p class="col-3 col-form-label"><b>Giá Tiền(sau khi giảm): </b></p>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control form-control-sm" style="height: 40px" name="product_price_sale"
                                                   value="${product.price_sale}">
                                        </div>
                                    </div>
                                    <div class="form-group row mb-4">
                                        <p class="col-3 col-form-label"><b>URL ảnh bìa: </b></p>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control form-control-sm" style="height: 40px" name="product_img_source"
                                                   value="${product.img}">
                                        </div>
                                    </div>
                                    <div class="form-group row mb-4">
                                        <p class="col-3 col-form-label"><b>Nhà Xuất Bản</b></p>
                                        <div class="col-sm-9">
                                        <select class="browser-default custom-select" name="supplier">
                                            <option selected value="${product.supplier}">${product.supplier}</option>
                                            <option value="1980 Books">1980 Books</option>
                                            <option value="Alpha Books">Alpha Books</option>
                                            <option value="AZ Việt Nam">AZ Việt Nam</option>
                                            <option value="Báo Sinh Viên VN - Hoa Học Trò">Báo Sinh Viên VN - Hoa Học Trò</option>
                                            <option value="Cty Văn Hóa Văn Lang">Cty Văn Hóa Văn Lang</option>
                                            <option value="IPM">IPM</option>
                                            <option value="Minh Long">Minh Long</option>
                                            <option value="Nhã Nam">Nhã Nam</option>
                                            <option value="Nhà Xuất Bản Kim Đồng">Nhà Xuất Bản Kim Đồng</option>
                                            <option value="NXB Tổng Hợp TPHCM">NXB Tổng Hợp TPHCM</option>
                                            <option value="NXB Trẻ">NXB Trẻ</option>
                                            <option value="Saigon Books">Saigon Books</option>
                                            <option value="Skybooks">Skybooks</option>
                                            <option value="Tân Việt">Tân Việt</option>
                                            <option value="Thái Hà">Thái Hà</option>
                                            <option value="Đinh Tị">Đinh Tị</option>
                                        </select>
                                        </div>
                                    </div>
                                    <div class="form-group row mb-4">
                                        <p class="col-3 col-form-label"><b>Lọai Bìa</b></p>
                                        <div class="col-sm-9">
                                        <select class="browser-default custom-select" name="cover_form">
                                            <option selected value="${product.cover_form}">${product.cover_form}</option>
                                            <option value="Bìa Cứng">Bìa Cứng</option>
                                            <option value="Bìa Cứng">Bìa Cứng</option>
                                            <option value="Bộ hộp">Bộ hộp</option>
                                        </select>
                                        </div>
                                    </div>
                                    <div class="form-group row mb-4">
                                        <p class="col-3 col-form-label"><b>Thể Loại</b></p>
                                        <div class="col-sm-9">
                                        <select class="browser-default custom-select" name="category">
                                            <option selected value="${product.category}">${product.category}</option>
                                            <option value="khoa học kỹ thuật">khoa học kỹ thuật</option>
                                            <option value="Kinh Tế">Kinh Tế</option>
                                            <option value="MANGA - LIGHT NOVEL">MANGA - LIGHT NOVEL</option>
                                            <option value="Nữ Công Gia Chánh">Nữ Công Gia Chánh</option>
                                            <option value="thiếu nhi">thiếu nhi</option>
                                        </select>
                                        </div>
                                    </div>
                                    <input type="hidden" name="product_id" value="${product.id}">
                                    <br>
                                    <div class="row mb-md-5 mt-4">
                                            <button type="submit" class="btn btn-primary btn-lg btn-block">
                                                Xác Nhận Chỉnh Sửa</button>
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
