<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shopping</title>
    <!-- Roboto Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700&display=swap">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="css/mdb-pro.min.css">
    <!-- Material Design Bootstrap Ecommerce -->
    <link rel="stylesheet" href="css/mdb.ecommerce.min.css">
</head>
<c:import url="header.jsp" />
<c:import url="sale.jsp" />

<body class="skin-light">

<main>
    <div class="container">

        <!--Grid row-->
        <div class="row mt-5">

            <!--Grid column-->
            <div class="col-md-4 mb-4">

                <!-- Section: Sidebar -->
                <section>

                    <!-- Section: search -->
                    <h5 class="pt-2 mb-4">Tìm kiếm</h5>

                    <section class="mb-4">

                        <div class="md-form md-outline mt-0 d-flex justify-content-between align-items-center">
                            <form>
                                <input type="text" id="search12" class="form-control mb-0" placeholder="Search...">
                                <button type="submit" class="btn btn-flat btn-md px-3 waves-effect"><i class="fas fa-search fa-lg"></i></button>
                            </form>
                        </div>

                    </section>
                    <!-- Section: search -->

                    <!-- Section: Categories -->
                    <section>

                        <h5>Thể loại sách</h5>

                        <div class="text-muted small text-uppercase mb-5">
                            <p class="mb-3"><a href="#!" class="card-link-secondary">Thiếu Nhi</a></p>
                            <p class="mb-3"><a href="#!" class="card-link-secondary">Manga - Light novel</a></p>
                            <p class="mb-3"><a href="#!" class="card-link-secondary">Kinh Tế</a></p>
                            <p class="mb-3"><a href="#!" class="card-link-secondary">Văn Học</a></p>
                            <p class="mb-3"><a href="#!" class="card-link-secondary">Khoa Học Kỹ Thuật</a></p>
                            <p class="mb-3"><a href="#!" class="card-link-secondary">Nữ Công Gia Chánh</a></p>
                        </div>

                    </section>
                    <!-- Section: Categories -->

                    <!-- Section: Filters -->
                    <section>

                        <!-- Section: Supplier -->
                        <section class="mb-4">

                            <h6 class="font-weight-bold mb-3">Nhà Cung Cấp</h6>

                            <a href="#" class="form-check pl-0 mb-3" style="color: black; font-size: medium">Nhà Xuất Bản Kim Đồng</a>
                            <a href="#" class="form-check pl-0 mb-3" style="color: black; font-size: medium">NXB Trẻ</a>
                            <a href="#" class="form-check pl-0 mb-3" style="color: black; font-size: medium">Alpha Books</a>
                            <a href="#" class="form-check pl-0 mb-3" style="color: black; font-size: medium">Tân Việt</a>
                            <a href="#" class="form-check pl-0 mb-3" style="color: black; font-size: medium">Đinh tị</a>
                            <a href="#" class="form-check pl-0 mb-3" style="color: black; font-size: medium">Nhã Nam</a>

                        </section>
                        <!-- Section: Supplier -->

                        <!-- Section: Price -->
                        <section class="mb-4">

                            <h6 class="font-weight-bold mb-3">Giá</h6>
                            <a href="#" class="form-check pl-0 mb-3" style="color: black">0đ - 150,000đ</a>
                            <a href="#" class="form-check pl-0 mb-3" style="color: black">150,000đ - 300,000đ</a>
                            <a href="#" class="form-check pl-0 mb-3" style="color: black">300,000đ - 500,000đ</a>
                            <a href="#" class="form-check pl-0 mb-3" style="color: black">500,000đ TRỞ LÊN</a>

                        </section>
                        <!-- Section: Price -->

                    </section>
                    <!-- Section: Filters -->

                </section>
                <!-- Section: Sidebar -->

            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-md-8 mb-4">

                <!-- Section: Block Content -->
                <section class="mb-3">

                    <div class="row d-flex justify-content-around align-items-center">
                        <%--                        <div class="col-12 col-md-3 text-center text-md-left">--%>
                        <%--                            <a href="#!" class="text-reset"><i class="fas fa-th-list fa-lg mr-1"></i></a>--%>
                        <%--                            <a href="#!" class="text-reset"><i class="fas fa-th-large fa-lg"></i></a>--%>
                        <%--                        </div>--%>
                        <div class="col-12 col-md-5">
                            <div class="d-flex flex-wrap">
                                <div class="select-outline position-relative w-100">
                                    <label>Xu Hướng - </label>
                                    <label>Mới nhất - </label>
                                    <label>Bán chạy</label>
                                    <button class="btn-save btn btn-primary btn-sm mt-2">Save</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-4 text-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination pagination-circle justify-content-center float-md-right mb-0">
                                    <li class="page-item"><a class="page-link"><i class="fas fa-chevron-left"></i></a></li>
                                    <c:forEach var="i" begin="1" end="6">
                                        <li class="page-item"><a href="NumberPageController?index=${i}" class="page-link">
                                                ${i}</a></li>
                                    </c:forEach>
                                    <li class="page-item"><a class="page-link"><i class="fas fa-chevron-right"></i></a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                </section>
                <!-- Section: Block Content -->

                <!--Section: Block Content-->
                <section>

                    <!-- Grid row -->
                    <div class="row">

                        <c:forEach items="${listP}" var="i">
                            <!-- Grid column -->
                            <div class="col-md-4 mb-5">

                                <!-- Card -->
                                <div class="">

                                    <div class="view zoom overlay rounded z-depth-2">
                                        <img class="img-fluid w-100"
                                             src="${i.img}" alt="Sample">
                                        <a href="#!"></a>
                                        <div class="mask">
                                            <img class="img-fluid w-100"
                                                 src="${i.img}">
                                            <div class="mask rgba-black-slight"></div>
                                        </div>
                                        </a>
                                    </div>

                                    <div class="text-center pt-4">

                                        <h5>${i.name}</h5>
                                        <p><span class="mr-1"><strong>${i.price_sale}đ</strong></span></p>
                                        <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                        <span>0 ratings & 0 reviews</span>

                                    </div>

                                </div>
                                <!-- Card -->

                            </div>
                            <!-- Grid column -->

                        </c:forEach>

                    </div>
                    <!-- Grid row -->

                </section>
                <!--Section: Block Content-->

                <!-- Section: Block Content -->
                <section>

                    <div class="row d-flex justify-content-around align-items-center">
                        <div class="col-12 col-md-4 text-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination pagination-circle justify-content-center float-md-right mb-0">
                                    <li class="page-item"><a class="page-link"><i class="fas fa-chevron-left"></i></a></li>
                                    <c:forEach var="i" begin="1" end="6">
                                        <li class="page-item"><a href="NumberPageController?index=${i}" class="page-link">${i}</a></li>
                                    </c:forEach>
                                    <li class="page-item"><a class="page-link"><i class="fas fa-chevron-right"></i></a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                </section>
                <!-- Section: Block Content -->

            </div>
            <!--Grid column-->

        </div>
        <!--Grid row-->

    </div>
</main>
<br><br><br>

<c:import url="footer.jsp" />
<!-- SCRIPTS -->
<!-- JQuery -->
<script src="js/jquery-3.4.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="js/bootstrap.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="js/mdb.min.js"></script>
<!-- MDB Ecommerce JavaScript -->
<script type="text/javascript" src="js/mdb.ecommerce.min.js"></script>
<script>
    $('#multi').mdbRange({
        single: {
            active: true,
            multi: {
                active: true,
                rangeLength: 1
            },
        }
    });

    $(document).ready(function () {
        $('.mdb-select').materialSelect();
        $('.select-wrapper.md-form.md-outline input.select-dropdown').bind('focus blur', function () {
            $(this).closest('.select-outline').find('label').toggleClass('active');
            $(this).closest('.select-outline').find('.caret').toggleClass('active');
        });
    });
</script>
</body>

</html>