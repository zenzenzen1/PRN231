<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

    <!-- contact32:04-->
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
            <!-- Li's Breadcrumb Area End Here -->     
            <!-- Begin Contact Main Page Area -->
            <div class="contact-main-page mt-60 mb-40 mb-md-40 mb-sm-40 mb-xs-40">
                <div class="container mb-60">
                    <div id="google-map"></div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 offset-lg-1 col-md-12 order-1 order-lg-2">
                            <div class="contact-page-side-content">

                                <div class="single-contact-block">
                                    <h4><i class="fa fa-fax"></i> Address</h4>
                                    <p>Km29, National Highway 1A, Hoa Lac Hi-Tech Park, Thach That District, Hanoi, Vietnam</p>
                                </div>
                                <div class="single-contact-block">
                                    <h4><i class="fa fa-phone"></i> Phone</h4>
                                    <p>Mobile: (+84) 392446665</p>
                                    <p>Hotline: 1009 678 456</p>
                                </div>
                                <div class="single-contact-block last-child">
                                    <h4><i class="fa fa-envelope-o"></i> Email</h4>
                                    <p>yourmail@domain.com</p>
                                    <p>support@hastech.company</p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- Contact Main Page Area End Here -->
            <!-- Begin Footer Area -->
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

                                                                    <table>
                                                                        <tr onclick="window.open('tel:0962883597');">
                                                                            <td class="bi bi-telephone-fill"> +84 962883597</td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                                <!-- End Single Widget -->
                                                            </div>
                                                            <div class="col-lg-2 col-md-6 col-12">
                                                                <!-- Single Widget -->
                                                                <div class="single-footer links">
                                                                    <h4>Information</h4>
                                                                    <ul>
                                                                        <li><a href="About-us.jsp">About Us</a></li>
                                                                        <li><a href="Term.jsp">Terms & Conditions</a></li>
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
                                            <!--Start add to cart-->
                                            <script type="text/javascript">
                                                var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
                                                (function () {
                                                    var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
                                                    s1.async = true;
                                                    s1.src = 'https://embed.tawk.to/6482066c94cf5d49dc5c9261/1h2dui7gl';
                                                    s1.charset = 'UTF-8';
                                                    s1.setAttribute('crossorigin', '*');
                                                    s0.parentNode.insertBefore(s1, s0);
                                                })();
                                            </script>
                                            <!-- Footer Links Area End Here -->
                                            <!-- Begin Footer Payment Area -->
                                            <div class="copyright text-center">
                                                <a href="#">
                                                    <img src="images/payment/1.png" alt="">
                                                </a>
                                            </div>
                                            <!-- Footer Payment Area End Here -->
                                            <!-- Begin Copyright Area -->
                                            <div class="copyright text-center pt-25">
                                                <span><a href="https://www.templatespoint.net" target="_blank">Templates Point</a></span>
                                            </div>
                                            <!-- Copyright Area End Here -->
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            <!-- Footer Static Bottom Area End Here -->
                                            </div>
                                            <!-- Footer Area End Here -->
                                            </div>
                                            <!-- Body Wrapper End Here -->
                                            <!-- jQuery-V1.12.4 -->
                                            <script src="js/vendor/jquery-1.12.4.min.js"></script>
                                            <!-- Popper js -->
                                            <script src="js/vendor/popper.min.js"></script>
                                            <!-- Bootstrap V4.1.3 Fremwork js -->
                                            <script src="js/bootstrap.mi.js"></script>
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
                                            <script src="js/waypoints.mi.js"></script>
                                            <!-- Barrating -->
                                            <script src="js/jquery.barrating.mi.js"></script>
                                            <!-- Jquery-ui -->
                                            <script src="js/jquery-ui.mi.js"></script>
                                            <!-- Venobox -->
                                            <script src="js/venobox.min.js"></script>
                                            <!-- Nice Select js -->
                                            <script src="js/jquery.nice-select.min.js"></script>
                                            <!-- ScrollUp js -->
                                            <script src="js/scrollUp.min.js"></script>
                                            <!-- Main/Activator js -->
                                            <script src="js/main_1.js"></script>

                                            <!-- Google Map -->
                                            <script src="https://maps.google.com/maps/api/js?sensor=false&amp;libraries=geometry&amp;v=3.22&amp;key=AIzaSyChs2QWiAhnzz0a4OEhzqCXwx_qA9ST_lE"></script>

                                            <script>
                                                // When the window has finished loading create our google map below
                                                google.maps.event.addDomListener(window, 'load', init);
                                                function init() {
                                                    // Basic options for a simple Google Map
                                                    // For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
                                                    var mapOptions = {
                                                        // How zoomed in you want the map to start at (always required)
                                                        zoom: 12,
                                                        scrollwheel: false,
                                                        // The latitude and longitude to center the map (always required)
                                                        center: new google.maps.LatLng(21.013393, 105.527061), // New York
                                                        //21.004860, 105.313750"E
                                                        // How you would like to style the map. 
                                                        // This is where you would paste any style found on
                                                        styles: [{
                                                                "featureType": "water",
                                                                "elementType": "geometry",
                                                                "stylers": [{
                                                                        "color": "#e9e9e9"
                                                                    },
                                                                    {
                                                                        "lightness": 17
                                                                    }
                                                                ]
                                                            },
                                                            {
                                                                "featureType": "landscape",
                                                                "elementType": "geometry",
                                                                "stylers": [{
                                                                        "color": "#f5f5f5"
                                                                    },
                                                                    {
                                                                        "lightness": 20
                                                                    }
                                                                ]
                                                            },
                                                            {
                                                                "featureType": "road.highway",
                                                                "elementType": "geometry.fill",
                                                                "stylers": [{
                                                                        "color": "#ffffff"
                                                                    },
                                                                    {
                                                                        "lightness": 17
                                                                    }
                                                                ]
                                                            },
                                                            {
                                                                "featureType": "road.highway",
                                                                "elementType": "geometry.stroke",
                                                                "stylers": [{
                                                                        "color": "#ffffff"
                                                                    },
                                                                    {
                                                                        "lightness": 29
                                                                    },
                                                                    {
                                                                        "weight": 0.2
                                                                    }
                                                                ]
                                                            },
                                                            {
                                                                "featureType": "road.arterial",
                                                                "elementType": "geometry",
                                                                "stylers": [{
                                                                        "color": "#ffffff"
                                                                    },
                                                                    {
                                                                        "lightness": 18
                                                                    }
                                                                ]
                                                            },
                                                            {
                                                                "featureType": "road.local",
                                                                "elementType": "geometry",
                                                                "stylers": [{
                                                                        "color": "#ffffff"
                                                                    },
                                                                    {
                                                                        "lightness": 16
                                                                    }
                                                                ]
                                                            },
                                                            {
                                                                "featureType": "poi",
                                                                "elementType": "geometry",
                                                                "stylers": [{
                                                                        "color": "#f5f5f5"
                                                                    },
                                                                    {
                                                                        "lightness": 21
                                                                    }
                                                                ]
                                                            },
                                                            {
                                                                "featureType": "poi.park",
                                                                "elementType": "geometry",
                                                                "stylers": [{
                                                                        "color": "#dedede"
                                                                    },
                                                                    {
                                                                        "lightness": 21
                                                                    }
                                                                ]
                                                            },
                                                            {
                                                                "elementType": "labels.text.stroke",
                                                                "stylers": [{
                                                                        "visibility": "on"
                                                                    },
                                                                    {
                                                                        "color": "#ffffff"
                                                                    },
                                                                    {
                                                                        "lightness": 16
                                                                    }
                                                                ]
                                                            },
                                                            {
                                                                "elementType": "labels.text.fill",
                                                                "stylers": [{
                                                                        "saturation": 36
                                                                    },
                                                                    {
                                                                        "color": "#333333"
                                                                    },
                                                                    {
                                                                        "lightness": 40
                                                                    }
                                                                ]
                                                            },
                                                            {
                                                                "elementType": "labels.icon",
                                                                "stylers": [{
                                                                        "visibility": "off"
                                                                    }]
                                                            },
                                                            {
                                                                "featureType": "transit",
                                                                "elementType": "geometry",
                                                                "stylers": [{
                                                                        "color": "#f2f2f2"
                                                                    },
                                                                    {
                                                                        "lightness": 19
                                                                    }
                                                                ]
                                                            },
                                                            {
                                                                "featureType": "administrative",
                                                                "elementType": "geometry.fill",
                                                                "stylers": [{
                                                                        "color": "#fefefe"
                                                                    },
                                                                    {
                                                                        "lightness": 20
                                                                    }
                                                                ]
                                                            },
                                                            {
                                                                "featureType": "administrative",
                                                                "elementType": "geometry.stroke",
                                                                "stylers": [{
                                                                        "color": "#fefefe"
                                                                    },
                                                                    {
                                                                        "lightness": 17
                                                                    },
                                                                    {
                                                                        "weight": 1.2
                                                                    }
                                                                ]
                                                            }
                                                        ]
                                                    };

                                                    // Get the HTML DOM element that will contain your map 
                                                    // We are using a div with id="map" seen below in the <body>
                                                    var mapElement = document.getElementById('google-map');

                                                    // Create the Google Map using our element and options defined above
                                                    var map = new google.maps.Map(mapElement, mapOptions);

                                                    // Let's also add a marker while we're at it
                                                    var marker = new google.maps.Marker({
                                                        position: new google.maps.LatLng(21.013393, 105.527061),
                                                        map: map,
                                                        title: 'Limupa',
                                                        animation: google.maps.Animation.BOUNCE
                                                    });
                                                }
                                            </script>
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

                                            </body>

                                            <!-- contact32:04-->
                                            </html>
