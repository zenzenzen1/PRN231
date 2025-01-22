<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

    <!-- about-us32:04-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name='copyright' content=''>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Title Tag  -->
        <title>Group2Com</title>
        <!-- Favicon -->

        <!-- Web Font -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

        <!-- StyleSheet -->
        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.css">

        <link rel="stylesheet" href="css/magnific-popup.min.css">

        <link rel="stylesheet" href="css/font-awesome.css">

        <link rel="stylesheet" href="css/jquery.fancybox.min.css">

        <link rel="stylesheet" href="css/themify-icons.css">

        <link rel="stylesheet" href="css/niceselect.css">

        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/flex-slider.min.css">

        <link rel="stylesheet" href="css/owl-carousel.css">

        <link rel="stylesheet" href="css/slicknav.min.css">


        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/banner.css">
        <link rel="stylesheet" href="css/responsive.css">
        <link rel="stylesheet" href="css/style.css">


        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png">
        <!-- Material Design Iconic Font-V2.2.0 -->
        <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Font Awesome Stars-->
        <link rel="stylesheet" href="css/fontawesome-stars.css">
        <!-- Meanmenu CSS -->
        <link rel="stylesheet" href="css/meanmenu.css">
        <!-- owl carousel CSS -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <!-- Slick Carousel CSS -->
        <link rel="stylesheet" href="css/slick.css">
        <!-- Animate CSS -->
        <link rel="stylesheet" href="css/animate_1.css">
        <!-- Jquery-ui CSS -->
        <link rel="stylesheet" href="css/jquery-ui.min.css">
        <!-- Venobox CSS -->
        <link rel="stylesheet" href="css/venobox.css">
        <!-- Nice Select CSS -->
        <link rel="stylesheet" href="css/nice-select_1.css">
        <!-- Magnific Popup CSS -->
        <link rel="stylesheet" href="css/magnific-popup_1.css">
        <!-- Bootstrap V4.1.3 Fremwork CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Helper CSS -->
        <link rel="stylesheet" href="css/helper.css">
        <!-- Main Style CSS -->
        <link rel="stylesheet" href="css/style_3.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="css/responsive_1.css">
        <!-- Modernizr js -->
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
        <style>
            .account li:hover a{
                color: red;
            }

            .account li:hover{
                background: #eee;
            }
        </style>
    </head>
    <body class="js">


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
                                        <li><i class="ti-power-off"></i><a href="login">Đăng nhập</a></li>
                                        <li><i class="ti-power-off"></i><a href="login">Đăng ký</a></li>
                                            </c:if >
                                            <c:if test="${acc != null}">
                                        <!--                                        <li><i class="ti-location-pin"></i> Store location</li>
                                                                                <li><i class="ti-alarm-clock"></i> <a href="#">Daily deal</a></li>-->
                                        <c:if test="${roll==0}">
                                            <li><i class="ti-user"></i> <a href="#">${acc.getUserName()}</a></li>
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
                                <a href="Home">Group2Com</a>
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
                                <c:if test="${acc == null}">
                                    <div class="sinlge-bar shopping">
                                        <a href="login" class="single-icon">
                                            <i class="fa fa-user-circle-o" aria-hidden="true" style="font-size: 20px;"></i>
                                        </a>
                                        <div class="shopping-item" style="width: 150px;padding: 0;right: 10px;">
                                            <ul class="shopping-list account">
                                                <li onclick="ch()" style="border-bottom: none;padding: 10px;margin-bottom: 0px; cursor: pointer">
                                                    <a href="login">Đăng nhập</a>
                                                </li>
                                                <li onclick="ch()"  style="border-bottom: none;padding: 10px;margin-bottom: 0px; cursor: pointer">
                                                    <a href="login">Đăng ký</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </c:if >
                                <c:if test="${acc != null}">
                                    <div class="sinlge-bar shopping">
                                        <a href="updateUserClient" class="single-icon">
                                            <i class="fa fa-user-circle-o" aria-hidden="true" style="font-size: 20px;"></i>
                                        </a>
                                        <div class="shopping-item" style="width: 150px;padding: 0;right: 10px;">
                                            <ul class="shopping-list account">
                                                <li onclick="navigate('1')" style="border-bottom: none;padding: 10px;margin-bottom: 0px; cursor: pointer">
                                                    <a href="updateUserClient">Tài Khoản Của Tôi</a>
                                                </li>
                                                <li onclick="navigate('2')" style="border-bottom: none;padding: 10px;margin-bottom: 0px; cursor: pointer">
                                                    <a href="orderhistory">Đơn Mua</a>
                                                </li>
                                                <li onclick="navigate('3')" style="border-bottom: none;padding: 10px;margin-bottom: 0px; cursor: pointer">
                                                    <a href="logout">Đăng Xuất</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </c:if >
                                <div class="sinlge-bar shopping">
                                    <a href="showcart" class="single-icon"><i class="ti-bag"></i> <span class="total-count" id="sizeCart">${size}</span></a>
                                    <!-- Shopping Item -->
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
                                                        <a class="cart-img" href="/SWP391_LapTop/productDetail?id=${cart.getCart()[cart.getCart().size()-count].getProduct().getProductID()}"><img src="${pageContext.request.contextPath}/imageProduct/${cart.getCart()[cart.getCart().size()-count].getProduct().getLargeImage()}" alt="#"></a>
                                                        <h4><a href="/SWP391_LapTop/productDetail?id=${cart.getCart()[cart.getCart().size()-count].getProduct().getProductID()}">${cart.getCart()[cart.getCart().size()-count].getProduct().getProductName()}</a></h4>
                                                        <p class="quantity">${cart.getCart()[cart.getCart().size()-count].getQuantity()}x - <span class="amount">${cart.getCart()[cart.getCart().size()-count].getPrice()} đ</span></p>
                                                    </li>
                                                </c:if>
                                                <c:if test="${cart.getCart().size()!=1}">
                                                    <c:forEach begin="0" end="1">
                                                        <li>
                                                            <a onclick="deleteItem('${cart.getCart()[cart.getCart().size()-count].getProduct().getProductID()}'); CartShow()" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                            <a class="cart-img" href="/SWP391_LapTop/productDetail?id=${cart.getCart()[cart.getCart().size()-count].getProduct().getProductID()}"><img src="${pageContext.request.contextPath}/imageProduct/${cart.getCart()[cart.getCart().size()-count].getProduct().getLargeImage()}" alt="#"></a>
                                                            <h4><a href="/SWP391_LapTop/productDetail?id=${cart.getCart()[cart.getCart().size()-count].getProduct().getProductID()}">${cart.getCart()[cart.getCart().size()-count].getProduct().getProductName()}</a></h4>
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
                                            <a href="shopping.jsp" class="btn animate">Thanh toán</a>
                                        </div>
                                    </div>
                                    <!--/ End Shopping Item -->
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
                                <div class="all-category">

                                </div>
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
                                                    <li><a href="About-us.jsp">About Us</a></li>
                                                    <li><a href="showcart">Shop<i class="ti-angle-down"></i><span class="new">New</span></a>
                                                        <ul class="dropdown">
                                                            <li><a href="showcart">Cart</a></li>
                                                            <li><a href="checkout">Checkout</a></li>
                                                        </ul>
                                                    </li>

                                                    <li><a href="blogs">Blog</a>                                                    </li>
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
            <!-- Header Logo Area End Here -->
            <!-- Begin Header Middle Right Area -->

            <!-- Header Middle Area End Here -->
            <!-- Begin Header Bottom Area -->

            <!-- Header Bottom Area End Here -->
            <!-- Begin Mobile Menu Area -->
            <div class="mobile-menu-area d-lg-none d-xl-none col-12">
                <div class="container"> 
                    <div class="row">
                        <div class="mobile-menu">
                        </div>
                    </div>
                </div>
            </div>
            <!-- Mobile Menu Area End Here -->
        </header>
        <!-- Header Area End Here -->
        <!-- Begin Li's Breadcrumb Area -->

        <!-- Li's Breadcrumb Area End Here -->
        <!-- about wrapper start -->
        <div class="about-us-wrapper pt-60 pb-40">
            <div class="container">
                <div class="row">
                    <!-- About Text Start -->
                    <div class="col-lg-6 order-last order-lg-first">
                        <div class="about-text-wrap">
                            <h2><span>Provide Best</span>Product For You</h2>
                            <p>We provide the best Computer all over the world. We are the worldd best store in VietNamese for Computer-related electronics. You can buy our product without any hegitation because they trust us and buy our product without any hagitation because they belive and always happy buy our product.</p>
                            <p>Some of our customer say’s that they trust us and buy our product without any hagitation because they belive us and always happy to buy our product.</p>
                            <p>We provide the beshat they trusted us and buy our product without any hagitation because they belive us and always happy to buy.</p>
                        </div>
                    </div>
                    <!-- About Text End -->
                    <!-- About Image Start -->
                    <div class="col-lg-5 col-md-10">
                        <div class="about-image-wrap">
                            <img class="img-full" src="images/product/large-size/13.jpg" alt="About Us" />
                        </div>
                    </div>
                    <!-- About Image End -->
                </div>
            </div>
        </div>
        <!-- about wrapper end -->
        <!-- Begin Counterup Area -->

        <!-- Counterup Area End Here -->
        <!-- team area wrapper start -->
        <div class="team-area pt-60 pt-sm-44">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="li-section-title capitalize mb-25">
                            <h2><span>our team</span></h2>
                        </div>
                    </div>
                </div> <!-- section title end -->

                <div class="row">
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="team-member mb-60 mb-sm-30 mb-xs-30">
                            <div class="team-thumb">
                                <img src="images/team/1.png" alt="Our Team Member">
                            </div>
                            <div class="team-content text-center">
                                <h3>Mrs Ha</h3>
                                <p>IT Expert</p>
                                <a href="#">info@example.com</a>
                                <div class="team-social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-linkedin"></i></a>
                                    <a href="#"><i class="fa fa-google-plus"></i></a>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end single team member -->
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="team-member mb-60 mb-sm-30 mb-xs-30">
                            <div class="team-thumb">
                                <img src="images/team/2.png" alt="Our Team Member">
                            </div>
                            <div class="team-content text-center">
                                <h3>Mr Dat</h3>
                                <p>Web Designer</p>
                                <a href="#">info@example.com</a>
                                <div class="team-social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-linkedin"></i></a>
                                    <a href="#"><i class="fa fa-google-plus"></i></a>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end single team member -->
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="team-member mb-30 mb-sm-60">
                            <div class="team-thumb">
                                <img src="images/team/3.png" alt="Our Team Member">
                            </div>
                            <div class="team-content text-center">
                                <h3>Mr Tan</h3>
                                <p>Web Developer</p>
                                <a href="#">info@example.com</a>
                                <div class="team-social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-linkedin"></i></a>
                                    <a href="#"><i class="fa fa-google-plus"></i></a>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end single team member -->
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="team-member mb-30 mb-sm-60 mb-xs-60">
                            <div class="team-thumb">
                                <img src="images/team/4.png" alt="Our Team Member">
                            </div>
                            <div class="team-content text-center">
                                <h3>Mr Vinh </h3>
                                <p>Marketing officer</p>
                                <a href="#">info@example.com</a>
                                <div class="team-social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-linkedin"></i></a>
                                    <a href="#"><i class="fa fa-google-plus"></i></a>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end single team member -->
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="team-member mb-30 mb-sm-60 mb-xs-60">
                            <div class="team-thumb">
                                <img src="images/team/4.png" alt="Our Team Member">
                            </div>
                            <div class="team-content text-center">
                                <h3>Mr Son </h3>
                                <p>Marketing officer</p>
                                <a href="#">info@example.com</a>
                                <div class="team-social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-linkedin"></i></a>
                                    <a href="#"><i class="fa fa-google-plus"></i></a>
                                </div>
                            </div>
                        </div>
                    </div> 
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="team-member mb-30 mb-sm-60 mb-xs-60">
                            <div class="team-thumb">
                                <img src="images/team/4.png" alt="Our Team Member">
                            </div>
                            <div class="team-content text-center">
                                <h3>Mr Y </h3>
                                <p>Marketing officer</p>
                                <a href="#">info@example.com</a>
                                <div class="team-social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-linkedin"></i></a>
                                    <a href="#"><i class="fa fa-google-plus"></i></a>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end single team member --><!-- end single team member -->
                </div>
            </div>
        </div>

        <!-- team area wrapper end -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="ti-close" aria-hidden="true"></span></button>
                    </div>
                    <div class="modal-body">
                        <div class="row no-gutters">
                            <div class="col-lg-6 offset-lg-3 col-12">
                                <h4 style="margin-top:100px;font-size:14px; font-weight:500; color:#F7941D; display:block; margin-bottom:5px;">Computer Shop Group2</h4>
                                <h3 style="font-size:30px;color:#333;">About US<h3>
                                        <p style="display:block; margin-top:20px; color:#888; font-size:14px; font-weight:400;"></p>
                                        <div class="button" style="margin-top:30px;">
                                            <a href="image1/lg.jpg" target="_blank" class="btn" style="color:#fff;"></a>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        <!-- Modal end -->
                                        </div>
                                        </div>
                                        </div>
                                        <!-- Start Footer Area -->
                                        <footer class="footer">
                                            <!-- Footer Top -->
                                            <div class="footer-top section">
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-lg-5 col-md-6 col-12">
                                                            <!-- Single Widget -->
                                                            <div class="single-footer about">

                                                                <p class="text">.</p>
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
                                            function navigate(num) {
                                                if (parseInt(num) === 1) {
                                                    window.location = "updateUserClient";
                                                } else if (parseInt(num) === 2) {
                                                    window.location = "orderhistory";
                                                } else {
                                                    window.location = "logout";
                                                }
                                            }

                                            function ch() {
                                                window.location = "login";
                                            }
                                            function CartShow() {
                                                var xhr = new XMLHttpRequest();
                                                xhr.open("GET", "cartajaxhandle", true);
                                                xhr.onreadystatechange = () => {
                                                    if (xhr.readyState == 4 && xhr.status == 200) {
                                                        document.getElementById('cart').innerHTML = xhr.responseText;
                                                    }
                                                    ;
                                                };
                                                xhr.send();
                                            }

                                            function deleteItem(idp) {
                                                let txt = "";
                                                let temp = '';
                                                if (Cookies.get('cart') !== undefined && Cookies.get('cart') !== null) {
                                                    txt += Cookies.get('cart');
                                                    Cookies.remove('cart');
                                                }
                                                let id = [];
                                                let sl = [];
                                                let j = 0;
                                                let count = 0;
                                                if (txt !== '') {
                                                    if (txt.includes(":")) {
                                                        let pro = txt.split(":");
                                                        for (var i in pro) {
                                                            let str = pro[i].split("-");
                                                            id[j] = str[0];
                                                            sl[j] = str[1];
                                                            j++;
                                                            count++;
                                                        }
                                                    } else {
                                                        Cookies.remove('cart', {path: '/SWP391_LapTop'});
                                                        document.getElementById('sizeCart').innerHTML = 0;
                                                        return;
                                                    }
                                                    for (var i = 0; i < id.length; i++) {
                                                        if (parseInt(id[i]) === parseInt(idp)) {
                                                            id[i] = "";
                                                            sl[i] = "";
                                                            break;
                                                        }
                                                    }
                                                    for (var i = 0; i < id.length; i++) {
                                                        if (id[i] === "") {
                                                            continue;
                                                        }
                                                        if (temp === '') {
                                                            temp += id[i] + '-' + sl[i];
                                                        } else {
                                                            temp = temp + ':' + id[i] + '-' + sl[i];
                                                        }
                                                    }
                                                    document.getElementById('sizeCart').innerHTML = count - 1;
                                                }
                                                Cookies.set('cart', temp, {expires: 7, path: '/SWP391_LapTop'});
                                            }
                                        </script>
                                        <script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/3.0.1/js.cookie.min.js" 
                                                integrity="sha512-wT7uPE7tOP6w4o28u1DN775jYjHQApdBnib5Pho4RB0Pgd9y7eSkAV1BTqQydupYDB9GBhTcQQzyNMPMV3cAew==" 
                                        crossorigin="anonymous" referrerpolicy="no-referrer"></script>


                                        <!--Start add to cart-->
                                        </div>
                                        <!-- Body Wrapper End Here -->
                                        <!-- jQuery-V1.12.4 -->
                                        <script src="js/vendor/jquery-1.12.4.min.js"></script>
                                        <!-- Popper js -->
                                        <script src="js/vendor/popper.min.js"></script>
                                        <!-- Bootstrap V4.1.3 Fremwork js -->
                                        <script src="js/bootstrap.min.js"></script>
                                        <!-- Ajax Mail js -->
                                        <script src="js/ajax-mail.js"></script>
                                        <!-- Meanmenu js -->
                                        <script src="js/jquery.meanmenu.min.js"></script>
                                        <!-- Wow.min js -->
                                        <script src="js/wow.min.js"></script>
                                        <!-- Slick Carousel js -->
                                        <script src="js/slick.min.js"></script>
                                        <!-- Owl Carousel-2 js -->
                                        <script src="js/owl.carousel.min.js"></script>
                                        <!-- Magnific popup js -->
                                        <script src="js/jquery.magnific-popup.min.js"></script>
                                        <!-- Isotope js -->
                                        <script src="js/isotope.pkgd.min.js"></script>
                                        <!-- Imagesloaded js -->
                                        <script src="js/imagesloaded.pkgd.min.js"></script>
                                        <!-- Mixitup js -->
                                        <script src="js/jquery.mixitup.min.js"></script>
                                        <!-- Countdown -->
                                        <script src="js/jquery.countdown.min.js"></script>
                                        <!-- Counterup -->
                                        <script src="js/jquery.counterup.min.js"></script>
                                        <!-- Waypoints -->
                                        <script src="js/waypoints.min.js"></script>
                                        <!-- Barrating -->
                                        <script src="js/jquery.barrating.min.js"></script>
                                        <!-- Jquery-ui -->
                                        <script src="js/jquery-ui.min.js"></script>
                                        <!-- Venobox -->
                                        <script src="js/venobox.min.js"></script>
                                        <!-- Nice Select js -->
                                        <script src="js/jquery.nice-select.min.js"></script>
                                        <!-- ScrollUp js -->
                                        <script src="js/scrollUp.min.js"></script>
                                        <!-- Main/Activator js -->
                                        <script src="js/main.js"></script>
                                        </body>

                                        <!-- about-us32:14-->
                                        </html>
