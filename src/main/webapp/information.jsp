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
    <link rel="stylesheet" href="css/information.css">
</head>
<body>
<c:import url="${sessionScope.header}" />

<div class="pd-wrap">
    <div class="container">
        <h5 style="color: #0f6674">${mess}</h5>
        <div class="row">
            <div class="col-md-6">
                <div id="slider" class="owl-carousel product-slider">
                    <div class="item"><img src="${product.img}"/></div>
                    <div class="item"><img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" /></div>
                    <div class="item"><img src="${product.img}" /></div>
                    <div class="item"><img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" /></div>
                    <div class="item"><img src="${product.img}" /></div>
                    <div class="item"><img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" /></div>
                    <div class="item"><img src="${product.img}" /></div>
                </div>
                <div id="thumb" class="owl-carousel product-thumb">
                    <div class="item"><img src="${product.img}" /></div>
                    <div class="item"><img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" /></div>
                    <div class="item"><img src="${product.img}" /></div>
                    <div class="item"><img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" /></div>
                    <div class="item"><img src="${product.img}" /></div>
                    <div class="item"><img src="https://i.ytimg.com/vi/PJ_zomNMK_s/maxresdefault.jpg" /></div>
                    <div class="item"><img src="${product.img}" /></div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="product-dtl">
                    <div class="product-info">
                        <div class="product-name">${product.name}</div>
                        <div class="reviews-counter">
                            <div class="rate">
                                <input type="radio" id="star5" name="rate" value="5" checked />
                                <label for="star5" title="text">5 stars</label>
                                <input type="radio" id="star4" name="rate" value="4" checked />
                                <label for="star4" title="text">4 stars</label>
                                <input type="radio" id="star3" name="rate" value="3" checked />
                                <label for="star3" title="text">3 stars</label>
                                <input type="radio" id="star2" name="rate" value="2" />
                                <label for="star2" title="text">2 stars</label>
                                <input type="radio" id="star1" name="rate" value="1" />
                                <label for="star1" title="text">1 star</label>
                            </div>
                            <span>0 Reviews</span>
                        </div>
<%--                        <div class="product-price-discount"><span>${product.price}??</span><span class="line-through">--%>
<%--                            ${product.price_sale}??</span></div--%>

                        <div class="product-price-discount">
                            <c:set var = "salaryy" scope = "session" value = "${String.valueOf(product.price)}"/>
                            <c:set var = "salaryyInt" scope = "session" value = "${product.price}"/>
                            <c:set var = "salary" scope = "session" value = "${String.valueOf(product.price_sale)}"/>
                            <c:set var = "salaryInt" scope = "session" value = "${product.price_sale}"/>

                            <%--  if sale  --%>
                            <c:if test = "${salaryInt < salaryyInt}">
                                <c:choose>
                                    <%-- 1.000 --%>
                                    <c:when test="${salary.length() == 4}">
                                        <span>${salary.substring(0,1)}.${salary.substring(1)}??</span>
                                        <span class="line-through">${salaryy.substring(0,1)}.${salaryy.substring(1)}??</strike></span>
                                    </c:when>
                                    <%-- 10.000 --%>
                                    <c:when test="${salary.length() == 5}">
                                        <span>${salary.substring(0,2)}.${salary.substring(2)}??</span>
                                        <span class="line-through">${salaryy.substring(0,2)}.${salaryy.substring(2)}??</span>
                                    </c:when>
                                    <%-- 100.000 --%>
                                    <c:when test="${salary.length() == 6}">
                                        <span>${salary.substring(0,3)}.${salary.substring(3)}??</span>
                                        <span class="line-through">${salaryy.substring(0,3)}.${salaryy.substring(3)}??</span>
                                    </c:when>
                                    <%-- 1.000.000 --%>
                                    <c:when test="${salary.length() == 7}">
                                        <span>${salary.substring(0,1)}.${salary.substring(1,4)}.${salary.substring(4)}??</span>
                                        <span class="line-through">$${salaryy.substring(0,1)}.${salaryy.substring(1,4)}.${salaryy.substring(4)}??</span>
                                    </c:when>
                                    <%-- 10.000.000 --%>
                                    <c:when test="${salary.length() == 8}">
                                        <span>${salary.substring(0,2)}.${salary.substring(2,5)}.${salary.substring(5)}??</span>
                                        <span class="line-through">${salaryy.substring(0,2)}.${salaryy.substring(2,5)}.${salaryy.substring(5)}??</span>
                                    </c:when>
                                </c:choose>
                            </c:if>

                            <%--  if don't sale  --%>
                            <c:if test = "${salaryInt == salaryyInt}">
                                <c:choose>
                                    <%-- 1.000 --%>
                                    <c:when test="${salary.length() == 4}">
                                        <span>${salary.substring(0,1)}.${salary.substring(1)}??</span>
                                    </c:when>
                                    <%-- 10.000 --%>
                                    <c:when test="${salary.length() == 5}">
                                        <span>${salary.substring(0,2)}.${salary.substring(2)}??</span>
                                    </c:when>
                                    <%-- 100.000 --%>
                                    <c:when test="${salary.length() == 6}">
                                        <span>${salary.substring(0,3)}.${salary.substring(3)}??</span>
                                    </c:when>
                                    <%-- 1.000.000 --%>
                                    <c:when test="${salary.length() == 7}">
                                        <span>${salary.substring(0,1)}.${salary.substring(1,4)}.${salary.substring(4)}??</span>
                                    </c:when>
                                    <%-- 10.000.000 --%>
                                    <c:when test="${salary.length() == 8}">
                                        <span>${salary.substring(0,2)}.${salary.substring(2,5)}.${salary.substring(5)}??</span>
                                    </c:when>
                                </c:choose>
                            </c:if>
                        </div>
                    </div>
                    <p><b>T??c gi???: </b>${product.author}</p>
                    <div class="row">
                        <div class="col-md-6">
                            <h5 class="">Nh?? Cung C???p: </h5>
                            <p ><a href="#">${product.supplier}</a></p>
                        </div>
                        <div class="col-md-6">
                            <h5 class="">Lo???i b??a: </h5>
                            <p >${product.cover_form}</p>
                        </div>
                    </div>
                    <div class="product-count">
                        <h5>S??? l?????ng</h5>
                        <form action="#" class="display-flex">
                            <div class="qtyminus">-</div>
                            <input type="text" name="quantity" value="1" class="qty">
                            <div class="qtyplus">+</div>
                            <br>
                        </form>
                        <form action="CartController.html" class="display-flex">
                            <input type="hidden" name="id" value="${product.id}">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="number" value="1" class="qty">
                            <button type="submit" class="round-black-btn">Th??m v??o gi??? h??ng</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    <br><br><br>

        <div class="product-info-tabs">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
                       aria-controls="description" aria-selected="true">Th??ng Tin Ch??nh S??ch</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
                       aria-selected="false">????nh Gi?? (0)</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                    Ch??nh s??ch gi?? (% chi???t kh???u gi???m gi??). ????y l?? ch??nh s??ch chung ch??? mang t??nh t????ng ?????i. Xin qu?? kh??ch vui
                    l??ng li??n l???c v???i Bookstore ????? c?? ch??nh s??ch gi?? ch??nh x??c nh???t:<br>
                    - ?????i v???i Nh??m h??ng s??ch kinh t???, V??n h???c: ??p d???ng m???c gi???m gi?? tr??n web t???i ??a kh??ng v?????t qu?? 30%.<br>
                    - ?????i v???i Nh??m h??ng s??ch thi???u nhi v?? t??m l?? k??? n??ng: ??p d???ng m???c gi???m gi?? tr??n web t???i ??a kh??ng v?????t qu?? 20%.<br>
                    - ?????i v???i Nh??m h??ng s??ch t??? ??i???n v?? s??ch ngo???i v??n : ??p d???ng m???c gi???m gi?? tr??n web t???i ??a kh??ng v?????t qu?? 10%.<br>
                    - ?????i v???i Nh??m h??ng v??n ph??ng ph???m, ????? ch??i, d???ng c??? h???c sinh: ??p d???ng m???c gi???m gi?? tr??n web t???i ??a kh??ng v?????t qu?? 15%.<br>
                    - ?????i v???i Nh??m h??ng gi???y photo, s???n ph???m ??i???n t???, v??n h??a ph???m: ??p d???ng m???c gi???m gi?? tr??n web t???i ??a kh??ng v?????t qu?? 5%.
                    <br>
                    Qu?? kh??ch c?? nhu c???u mua s???, vui l??ng li??n h??? ph??ng kinh doanh Bookstore.com: 1900 00 00 00  ho???c Email: info@Bookstore.com.
                </div>
                <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
                    <div class="review-heading">????NH GI?? S???N PH???M</div>
                    <p class="mb-20">Hi???n t???i kh??ng c?? ????nh gi?? n??o</p>
                    <form class="review-form">
                        <div class="form-group">
                            <label>????nh gi?? c???a b???n</label>
                            <div class="reviews-counter">
                                <div class="rate">
                                    <input type="radio" id="vote5" name="rate" value="5" />
                                    <label for="vote5" title="text">5 stars</label>
                                    <input type="radio" id="vote4" name="rate" value="4" />
                                    <label for="vote4" title="text">4 stars</label>
                                    <input type="radio" id="vote3" name="rate" value="3" />
                                    <label for="vote3" title="text">3 stars</label>
                                    <input type="radio" id="vote2" name="rate" value="2" />
                                    <label for="vote2" title="text">2 stars</label>
                                    <input type="radio" id="vote1" name="rate" value="1" />
                                    <label for="vote1" title="text">1 star</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Ph???n h???i</label>
                            <textarea class="form-control" rows="10"></textarea>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" name="" class="form-control" placeholder="T??n*">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" name="" class="form-control" placeholder="Email*">
                                </div>
                            </div>
                        </div>
                        <button class="round-black-btn">G???i ????nh Gi??</button>
                    </form>
                </div>
            </div>
        </div>
</div>

<c:import url="footer.jsp" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        var slider = $("#slider");
        var thumb = $("#thumb");
        var slidesPerPage = 4; //globaly define number of elements per page
        var syncedSecondary = true;
        slider.owlCarousel({
            items: 1,
            slideSpeed: 2000,
            nav: false,
            autoplay: false,
            dots: false,
            loop: true,
            responsiveRefreshRate: 200
        }).on('changed.owl.carousel', syncPosition);
        thumb
            .on('initialized.owl.carousel', function() {
                thumb.find(".owl-item").eq(0).addClass("current");
            })
            .owlCarousel({
                items: slidesPerPage,
                dots: false,
                nav: true,
                item: 4,
                smartSpeed: 200,
                slideSpeed: 500,
                slideBy: slidesPerPage,
                navText: ['<svg width="18px" height="18px" viewBox="0 0 11 20"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M9.554,1.001l-8.607,8.607l8.607,8.606"/></svg>', '<svg width="25px" height="25px" viewBox="0 0 11 20" version="1.1"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M1.054,18.214l8.606,-8.606l-8.606,-8.607"/></svg>'],
                responsiveRefreshRate: 100
            }).on('changed.owl.carousel', syncPosition2);
        function syncPosition(el) {
            var count = el.item.count - 1;
            var current = Math.round(el.item.index - (el.item.count / 2) - .5);
            if (current < 0) {
                current = count;
            }
            if (current > count) {
                current = 0;
            }
            thumb
                .find(".owl-item")
                .removeClass("current")
                .eq(current)
                .addClass("current");
            var onscreen = thumb.find('.owl-item.active').length - 1;
            var start = thumb.find('.owl-item.active').first().index();
            var end = thumb.find('.owl-item.active').last().index();
            if (current > end) {
                thumb.data('owl.carousel').to(current, 100, true);
            }
            if (current < start) {
                thumb.data('owl.carousel').to(current - onscreen, 100, true);
            }
        }
        function syncPosition2(el) {
            if (syncedSecondary) {
                var number = el.item.index;
                slider.data('owl.carousel').to(number, 100, true);
            }
        }
        thumb.on("click", ".owl-item", function(e) {
            e.preventDefault();
            var number = $(this).index();
            slider.data('owl.carousel').to(number, 300, true);
        });


        $(".qtyminus").on("click",function(){
            var now = $(".qty").val();
            if ($.isNumeric(now)){
                if (parseInt(now) -1> 0)
                { now--;}
                $(".qty").val(now);
            }
        })
        $(".qtyplus").on("click",function(){
            var now = $(".qty").val();
            if ($.isNumeric(now)){
                $(".qty").val(parseInt(now)+1);
            }
        });
    });
</script>
</body>
</html>
