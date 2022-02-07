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
<c:import url="header.jsp" />

<div class="pd-wrap">
    <div class="container">
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
                        <div class="product-price-discount"><span>${product.price}đ</span><span class="line-through">
                            ${product.price_sale}đ</span></div>
                    </div>
                    <p><b>Tác giả: </b>${product.author}</p>
                    <div class="row">
                        <div class="col-md-6">
                            <h5 class="">Nhà Cung Cấp: </h5>
                            <p ><a href="#">${product.supplier}</a></p>
                        </div>
                        <div class="col-md-6">
                            <h5 class="">Loại bìa: </h5>
                            <p >${product.cover_form}</p>
                        </div>
                    </div>
                    <div class="product-count">
                        <h5>Số lượng</h5>
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
                            <button type="submit" class="round-black-btn">Thêm vào giỏ hàng</button>
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
                       aria-controls="description" aria-selected="true">Thông Tin Chính Sách</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
                       aria-selected="false">Đánh Giá (0)</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                    Chính sách giá (% chiết khấu giảm giá). Đây là chính sách chung chỉ mang tính tương đối. Xin quý khách vui
                    lòng liên lạc với Bookstore để có chính sách giá chính xác nhất:<br>
                    - Đối với Nhóm hàng sách kinh tế, Văn học: áp dụng mức giảm giá trên web tối đa không vượt quá 30%.<br>
                    - Đối với Nhóm hàng sách thiếu nhi và tâm lý kỹ năng: áp dụng mức giảm giá trên web tối đa không vượt quá 20%.<br>
                    - Đối với Nhóm hàng sách từ điển và sách ngoại văn : áp dụng mức giảm giá trên web tối đa không vượt quá 10%.<br>
                    - Đối với Nhóm hàng văn phòng phẩm, đồ chơi, dụng cụ học sinh: áp dụng mức giảm giá trên web tối đa không vượt quá 15%.<br>
                    - Đối với Nhóm hàng giấy photo, sản phẩm điện tử, văn hóa phẩm: áp dụng mức giảm giá trên web tối đa không vượt quá 5%.
                    <br>
                    Quý khách có nhu cầu mua sỉ, vui lòng liên hệ phòng kinh doanh Bookstore.com: 1900 00 00 00  hoặc Email: info@Bookstore.com.
                </div>
                <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
                    <div class="review-heading">ĐÁNH GIÁ SẢN PHẨM</div>
                    <p class="mb-20">Hiện tại không có đánh giá nào</p>
                    <form class="review-form">
                        <div class="form-group">
                            <label>Đánh giá của bạn</label>
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
                            <label>Phản hồi</label>
                            <textarea class="form-control" rows="10"></textarea>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" name="" class="form-control" placeholder="Tên*">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" name="" class="form-control" placeholder="Email*">
                                </div>
                            </div>
                        </div>
                        <button class="round-black-btn">Gửi Đánh Giá</button>
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
