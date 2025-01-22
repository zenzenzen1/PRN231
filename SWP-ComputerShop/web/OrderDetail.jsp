<%-- 
    Document   : JistoryOrder
    Created on : May 16, 2023, 8:56:12 AM
    Author     : wth0z
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta Tag -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name='copyright' content=''>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Title Tag  -->
        <title>Group2Com</title>
        <base href="http://localhost:9999/SWP391_LapTop/"/>
        <!-- Web Font -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

        <!-- StyleSheet -->
        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <!-- Magnific Popup -->
        <link rel="stylesheet" href="css/magnific-popup.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.css">
        <!-- Fancybox -->
        <link rel="stylesheet" href="css/jquery.fancybox.min.css">
        <!-- Themify Icons -->
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- Nice Select CSS -->
        <link rel="stylesheet" href="css/niceselect.css">
        <!-- Animate CSS -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Flex Slider CSS -->
        <link rel="stylesheet" href="css/flex-slider.min.css">
        <!-- Owl Carousel -->
        <link rel="stylesheet" href="css/owl-carousel.css">
        <!-- Slicknav -->
        <link rel="stylesheet" href="css/slicknav.min.css">

        <!-- Eshop StyleSheet -->
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/banner.css">
        <link rel="stylesheet" href="css/responsive.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/order-detail.css">
        <style>
            .account li:hover a{
                color: red;
            }

            .account li:hover{
                background: #eee;
            }
        </style>
    </head>
    <body style="background: #eee">
        <header class="header shop">
            <!-- Topbar -->
            <div class="topbar">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-12 col-12">
                            <!-- Top Left -->
                            <div class="top-left">
                                <ul class="list-main">
                                    <li><i class="ti-headphone-alt"></i> +(84)0392446665</li>
                                    <li><i class="ti-email"></i> Group2Com@gmail.com</li>
                                </ul>
                            </div>
                            <!--/ End Top Left -->
                        </div>
                        <div class="col-lg-7 col-md-12 col-12">
                            <!-- Top Right -->
                            <div class="right-content">
                                <ul class="list-main">
                                    <c:if test="${acc == null}">
                                        <li><i class="ti-user"></i> <a href="login">Tài Khoản</a></li>
                                        <li><i class="ti-power-off"></i><a href="login">Đăng nhập</a></li>
                                        <li><i class="ti-power-off"></i><a href="login">Đăng ký</a></li>
                                            </c:if >
                                            <c:if test="${acc != null}">
                                                <c:if test="${roll==0}">
                                            <li><i class="ti-user"></i> <a href="updateUserClient?id=${acc.getUserID()}">${acc.getUserName()}</a></li>
                                            <li><a href="changePassword?Email=${acc.getEmail()}">Thay đổi mật khẩu</a></li> 
                                            </c:if>
                                            <c:if test="${roll==1}">
                                            <li><i class="ti-user"></i> <a href="#">${acc.getAdminName()}</a></li>
                                            <li><a href="changePassword?Page=index?Email=${acc.getEmail()}">Thay đổi mật khẩu</a></li> 
                                            </c:if>
                                            <c:if test="${roll==2}">
                                            <li><i class="ti-user"></i> <a href="#">${acc.getAdminName()}</a></li>
                                            <li><a href="changePassword?page=index?Email=${acc.getEmail()}">Thay đổi mật khẩu</a></li> 
                                            </c:if>
                                        <li><a href="logout?page=index.jsp">Đăng xuất</a></li>                                                                
                                        </c:if >
                                </ul>
                            </div>
                            <!-- End Top Right -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Topbar -->
            <div class="middle-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-12">
                            <!-- Logo -->
                            <div class="logo">
                                Group2Com
                            </div>
                            <!--/ End Logo -->
                            <!-- Search Form -->
                            <div class="search-top">
                                <div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
                                <!-- Search Form -->
                                <div class="search-top">
                                    <form class="search-form">
                                        <input type="text" placeholder="Search here..." name="search">
                                        <button value="search" type="submit"><i class="ti-search"></i></button>
                                    </form>
                                </div>
                                <!--/ End Search Form -->
                            </div>
                            <!--/ End Search Form -->
                            <div class="mobile-nav"></div>
                        </div>
                        <div class="col-lg-8 col-md-7 col-12">
                            <div class="search-bar-top">
                                <div class="search-bar">
                                    <select>
                                        <option selected="selected">All Category</option>
                                        <option>watch</option>
                                        <option>mobile</option>
                                        <option>kid’s item</option>
                                    </select>
                                    <form>
                                        <input name="search" placeholder="Search Products Here....." type="search">
                                        <button class="btnn"><i class="ti-search"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-3 col-12">
                            <div class="right-bar">
                                <!-- Search Form -->
                                <div class="sinlge-bar shopping">
                                    <a href="#" class="single-icon">
                                        <i class="fa fa-user-circle-o" aria-hidden="true" style="font-size: 20px;"></i></a>
                                    <div class="shopping-item" style="width: 150px;height: 132px;padding: 0;right: 10px;" id="cart">
                                        <ul class="shopping-list account" style="margin: 0px;height: 132px">
                                            <li onclick="navigate('1')" style="border-bottom: none;padding: 10px;margin-bottom: 0px; cursor: pointer; height: 44px;">
                                                <a>Tài Khoản Của Tôi</a>
                                            </li>
                                            <li onclick="navigate('2')" style="border-bottom: none;padding: 10px;margin-bottom: 0px; cursor: pointer; height: 44px;">
                                                <a href="orderhistory">Đơn Mua</a>
                                            </li>
                                            <li onclick="navigate('3')" style="border-bottom: none;padding: 10px;margin-bottom: 0px; cursor: pointer; height: 44px;">
                                                <a href="logout">Đăng Xuất</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="sinlge-bar shopping">
                                    <a href="showcart" class="single-icon"><i class="ti-bag"></i> <span class="total-count" id="sizeCart">${size}</span></a>
                                    <!--Shopping Item--> 
                                    <div class="shopping-item" id="cart">
                                        <div class="dropdown-cart-header">
                                            <span>${size} sản phẩm</span>
                                            <a href="showcart">Giỏ hàng</a>
                                        </div>
                                        <c:if test="${cart != null && cart.getCart().size() > 0}">
                                            <c:set value="1" var="count"/>
                                            <ul class="shopping-list">
                                                <c:if test="${cart.getCart().size()==1}">
                                                    <li>
                                                        <a onclick="deleteItem('${cart.getCart()[cart.getCart().size()-count].getProduct().getProductID()}'); CartShow()" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                        <a class="cart-img" href="productDetail/${cart.getCart()[cart.getCart().size()-count].getProduct().getProductName().replaceAll(" ","-")}"><img src="imageProduct/${cart.getCart()[cart.getCart().size()-count].getProduct().getLargeImage()}" alt="#"></a>
                                                        <h4><a href="productDetail/${cart.getCart()[cart.getCart().size()-count].getProduct().getProductName().replaceAll(" ","-")}">${cart.getCart()[cart.getCart().size()-count].getProduct().getProductName()}</a></h4>
                                                        <p class="quantity">${cart.getCart()[cart.getCart().size()-count].getQuantity()}x - <span class="amount">${cart.getCart()[cart.getCart().size()-count].getPrice()} đ</span></p>
                                                    </li>
                                                </c:if>
                                                <c:if test="${cart.getCart().size()!=1}">
                                                    <c:forEach begin="0" end="1">
                                                        <li>
                                                            <a onclick="deleteItem('${cart.getCart()[cart.getCart().size()-count].getProduct().getProductID()}'); CartShow()" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                            <a class="cart-img" href="productDetail/${cart.getCart()[cart.getCart().size()-count].getProduct().getProductName().replaceAll(" ","-")}"><img src="imageProduct/${cart.getCart()[cart.getCart().size()-count].getProduct().getLargeImage()}" alt="#"></a>
                                                            <h4><a href="productDetail/${cart.getCart()[cart.getCart().size()-count].getProduct().getProductName().replaceAll(" ","-")}">${cart.getCart()[cart.getCart().size()-count].getProduct().getProductName()}</a></h4>
                                                            <p class="quantity">${cart.getCart()[cart.getCart().size()-count].getQuantity()}x - <span class="amount">${cart.getCart()[cart.getCart().size()-count].getPrice()} đ</span></p>
                                                        </li>
                                                        <c:set value="${count + 1}" var="count"/>
                                                    </c:forEach>
                                                </c:if>
                                            </ul>
                                        </c:if>
                                        <div class="bottom">
                                            <div class="total">
                                                <span>Total</span>
                                                <span class="total-amount">${totalCart} đ</span>
                                            </div>
                                            <a href="checkout" class="btn animate">Thanh toán</a>
                                        </div>
                                    </div>
                                    <!--/ End Shopping Item--> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header Inner -->
            <div class="header-inner">
                <div class="container">
                    <div class="cat-nav-head">
                        <div class="row">
                            <div class="col-lg-3">
                            </div>
                            <div class="col-lg-9 col-12">
                                <div class="menu-area">
                                    <!-- Main Menu -->
                                    <nav class="navbar navbar-expand-lg">
                                        <div class="navbar-collapse">	
                                            <div class="nav-inner">	
                                                <ul class="nav main-menu menu navbar-nav">
                                                    <li class="active"><a href="Home">Home</a></li>
                                                    <li><a href="product">Product</a></li>												
                                                    <li><a href="#">Service</a></li>
                                                    <li><a href="showcart">Shop<i class="ti-angle-down"></i><span class="new">New</span></a>
                                                        <ul class="dropdown">
                                                            <li><a href="showcart">Cart</a></li>
                                                            <li><a href="checkout.jsp">Checkout</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="#">Pages</a></li>									
                                                    <li><a href="#">Blog<i class="ti-angle-down"></i></a>
                                                        <ul class="dropdown">
                                                            <li><a href="blog-single-sidebar.jsp">Blog Single Sidebar</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="contact.jsp">Contact Us</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </nav>
                                    <!--/ End Main Menu -->	
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!--/ End Header Inner -->

        <!--Start Order Detail-->
        <div class="container" style="margin-top:50px;margin-bottom: 50px">
            <article class="card">
                <header class="card-header"><strong> CHI TIẾT ĐƠN HÀNG </strong></header>
                <div class="card-body">
                    <h6 class="mb-3">Mã đơn hàng: ${list[0].getOrder().getOrderID()}</h6>
                    <article class="card">
                        <div class="card-body row">
                            <div class="col"> <strong>Người nhận:</strong> <br>${list[0].getOrder().getUserName()}</div>
                            <div class="col"> <strong>Số điện thoại:</strong> <br> <i class="fa fa-phone"></i> ${list[0].getOrder().getPhone()} </div>
                            <div class="col"> <strong>Tình trạng:</strong> <br> 
                                <c:if test="${list[0].getOrder().getStatus() == 'Delivered'}">
                                    <span>Đã hoàn thành</span>
                                </c:if>
                                <c:if test="${list[0].getOrder().getStatus() == 'Reject'}">
                                    <span>Đã hủy</span>
                                </c:if>
                                <c:if test="${list[0].getOrder().getStatus() == 'On delivery'}">
                                    <span>
                                        Đang vận chuyển
                                    </span>
                                </c:if>
                                <c:if test="${list[0].getOrder().getStatus() == 'New'}">
                                    <span>
                                        Chờ xử lý
                                    </span>
                                </c:if>
                            </div>
                            <div class="col"> <strong>Địa chỉ nhận hàng: </strong> <br> ${list[0].getOrder().getShipAddress()} </div>
                        </div>
                    </article>
                    <div class="track">
                        <c:if test="${!empty list[0].getOrder().getOrderDate()}">
                            <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Đã Xác Nhận <br>${list[0].getOrder().getOrderDate()}</span> </div>
                                </c:if>
                                <c:if test="${empty list[0].getOrder().getOrderDate()}">
                            <div class="step"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Đã Xác Nhận</span> </div>
                        </c:if>
                        <c:if test="${!empty list[0].getOrder().getShipDate()}">
                            <div class="step active"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> Đang Vận Chuyển <br>${list[0].getOrder().getShipDate()}</span> </div>
                        </c:if>
                        <c:if test="${empty list[0].getOrder().getShipDate()}">
                            <div class="step"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> Đang Vận Chuyển</span> </div>
                        </c:if>
                        <c:if test="${empty list[0].getOrder().getReceiveDate()}">
                            <div class="step"> <span class="icon"> <i class="fas fa-box"></i> </span> <span class="text"> Đã Nhận Được Hàng </span> </div>
                            <div class="step"> <span class="icon"> <i class="fas fa-star"></i> </span> <span class="text">Đơn Hàng Đã Hoàn Thành</span> </div>
                        </c:if>
                        <c:if test="${!empty list[0].getOrder().getReceiveDate()}">
                            <div class="step active"> <span class="icon"> <i class="fas fa-box"></i> </span> <span class="text"> Đã Nhận Được Hàng <br>${list[0].getOrder().getReceiveDate()}</span> </div>
                            <div class="step active"> <span class="icon"> <i class="fas fa-star"></i> </span> <span class="text">Đơn Hàng Đã Hoàn Thành <br>${list[0].getOrder().getReceiveDate()}</span> </div>
                        </c:if>

                    </div>
                    <hr>
                    <ul class="row">
                        <c:forEach items="${list}" var="l">
                            <li onclick="detailProduct('${l.getSp().getProductID()}')" class="col-md-4" style="cursor: pointer">
                                <figure class="itemside mb-3">
                                    <div class="aside"><img src="imageProduct/${l.getSp().getLargeImage()}" class="img-sm border"></div>
                                    <figcaption class="info align-self-center">
                                        <p class="title">${l.getSp().getProductName()} <br> x${l.getQuantity()}</p> 
                                        <span class="text-muted">${l.getToltalPrice()} đ</span>
                                    </figcaption>
                                </figure>
                            </li>
                        </c:forEach>
                    </ul>
                    <hr>
                    <a href="orderhistory" class="btn btn-warning" data-abc="true"> <i class="fa fa-chevron-left"></i> Quay lại</a>
                </div>
            </article>
        </div>
        <!--End Order Detail-->

        <!-- Start Footer Area -->
        <footer class="footer">
            <!-- Footer Top -->
            <div class="footer-top section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer about">
                                <div class="logo">
                                    <a href="index.jsp"><img src="images/logo2.png" alt="#"></a>
                                </div>
                                <p class="text">Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue,  magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.</p>
                                <p class="call">Got Question? Call us 24/7<span><a href="tel:123456789">+0123 456 789</a></span></p>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                        <div class="col-lg-2 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer links">
                                <h4>Information</h4>
                                <ul>
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Faq</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Help</a></li>
                                </ul>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                        <div class="col-lg-2 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer links">
                                <h4>Customer Service</h4>
                                <ul>
                                    <li><a href="#">Payment Methods</a></li>
                                    <li><a href="#">Money-back</a></li>
                                    <li><a href="#">Returns</a></li>
                                    <li><a href="#">Shipping</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                </ul>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                        <div class="col-lg-3 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer social">
                                <h4>Get In Tuch</h4>
                                <!-- Single Widget -->
                                <div class="contact">
                                    <ul>
                                        <li>NO. 342 - London Oxford Street.</li>
                                        <li>012 United Kingdom.</li>
                                        <li>info@eshop.com</li>
                                        <li>+032 3456 7890</li>
                                    </ul>
                                </div>
                                <!-- End Single Widget -->
                                <ul>
                                    <li><a href="#"><i class="ti-facebook"></i></a></li>
                                    <li><a href="#"><i class="ti-twitter"></i></a></li>
                                    <li><a href="#"><i class="ti-flickr"></i></a></li>
                                    <li><a href="#"><i class="ti-instagram"></i></a></li>
                                </ul>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Footer Top -->
            <div class="copyright">
                <div class="container">
                    <div class="inner">
                        <div class="row">
                            <div class="col-lg-6 col-12">
                                <div class="left">
                                    <p>Copyright © 2020 <a href="http://www.wpthemesgrid.com" target="_blank">Wpthemesgrid</a>  -  All Rights Reserved.</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="right">
                                    <img src="images/payments.png" alt="#">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- /End Footer Area -->

        <script>
            function detailProduct(id) {
                window.location = "productDetail?id=" + id;
            }

            function navigate(num) {
                if (parseInt(num) === 1) {

                } else if (parseInt(num) === 2) {
                    window.location = "orderhistory";
                } else {
                    window.location = "logout";
                }
            }
        </script>
        <!-- Jquery -->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.0.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <!-- Popper JS -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Color JS -->
        <script src="js/colors.js"></script>
        <!-- Slicknav JS -->
        <script src="js/slicknav.min.js"></script>
        <!-- Owl Carousel JS -->
        <script src="js/owl-carousel.js"></script>
        <!-- Magnific Popup JS -->
        <script src="js/magnific-popup.js"></script>
        <!-- Waypoints JS -->
        <script src="js/waypoints.min.js"></script>
        <!-- Countdown JS -->
        <script src="js/finalcountdown.min.js"></script>
        <!-- Nice Select JS -->
        <script src="js/nicesellect.js"></script>
        <!-- Flex Slider JS -->
        <script src="js/flex-slider.js"></script>
        <!-- ScrollUp JS -->
        <script src="js/scrollup.js"></script>
        <!-- Onepage Nav JS -->
        <script src="js/onepage-nav.min.js"></script>
        <!-- Easing JS -->
        <script src="js/easing.js"></script>
        <!-- Active JS -->
        <script src="js/active.js"></script>
    </body>
</html>
