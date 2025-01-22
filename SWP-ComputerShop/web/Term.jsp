<%-- 
    Document   : Term
    Created on : Jun 26, 2023, 2:17:21 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Terms & Conditions</title
        
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
        <link rel="stylesheet" href="css/term.css">

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
         <link rel="stylesheet" href="css/style_3.css">


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
                                        <!--                                        <li><i class="ti-location-pin"></i> Store location</li>
                                                                                <li><i class="ti-alarm-clock"></i> <a href="#">Daily deal</a></li>-->
                                        <li><i class="ti-user"></i> <a href="login">Tài Khoản</a></li>
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
                                <div class="sinlge-bar">
                                    <a href="#" class="single-icon"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
                                </div>
                                <div class="sinlge-bar">
                                    <a href="#" class="single-icon"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
                                </div>
                                <div class="sinlge-bar shopping">
                                    <a href="#" class="single-icon"><i class="ti-bag"></i> <span class="total-count">2</span></a>
                                    <!-- Shopping Item -->
                                    <div class="shopping-item">
                                        <div class="dropdown-cart-header">
                                            <span>2 Items</span>
                                            <a href="#">View Cart</a>
                                        </div>
                                        <ul class="shopping-list">
                                            <li>
                                                <a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                <a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
                                                <h4><a href="#">Woman Ring</a></h4>
                                                <p class="quantity">1x - <span class="amount">$99.00</span></p>
                                            </li>
                                            <li>
                                                <a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                <a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
                                                <h4><a href="#">Woman Necklace</a></h4>
                                                <p class="quantity">1x - <span class="amount">$35.00</span></p>
                                            </li>
                                        </ul>
                                        <div class="bottom">
                                            <div class="total">
                                                <span>Total</span>
                                                <span class="total-amount">$134.00</span>
                                            </div>
                                            <a href="checkout.jsp" class="btn animate">Checkout</a>
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
                                                    <li class="active"><a href="#">Home</a></li>
                                                    <li><a href="Product.jsp">Product</a></li>												
                                                    <li><a href="About-us.jsp">About Us</a></li>
                                                    <li><a href="">Shop<i class="ti-angle-down"></i><span class="new">New</span></a>
                                                        <ul class="dropdown">
                                                            <li><a href="cart.jsp">Cart</a></li>
                                                            <li><a href="checkout.jsp">Checkout</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="#">Pages</a></li>									
                                                    <li><a href="blogs">Blog<i class="ti-angle-down"></i></a>
                                                        <ul class="dropdown">
                                                            <li><a href="blogs">Blog</a></li>
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
            <!-- Header Logo Area End Here -->
            <!-- Begin Header Middle Right Area -->

            <h1>Terms & Conditions</h1>
            <p>Welcome to our online store. Please read these Terms & Conditions carefully before using our website. By accessing and using this website, you agree to be bound by the following terms and conditions. If you do not agree with any of these terms, please do not continue to use this website.</p>

            <h2>1. Use of the Website</h2>
            <p>1.1 You must be of legal age to use this website and engage in transactions.</p>
            <p>1.2 You shall not use this website for any unlawful purposes or to harm our company or other users.</p>

            <h2>2. Products and Transactions</h2>
            <p>2.1 We strive to provide accurate and up-to-date information and images of our products. However, we do not guarantee the accuracy, reliability, or completeness of the information on the website.</p>
            <p>2.2 The prices and other product information displayed on the website are for reference only and may change without prior notice.</p>

            <h2>3. Payment</h2>
            <p>3.1 We accept payment methods as displayed on the website. You agree to use valid and lawful payment methods.</p>
            <p>3.2 All payment transactions are processed through secure and encrypted payment gateways.</p>

            <h2>4. Delivery</h2>
            <p>4.1 We will provide information regarding shipping fees and estimated delivery times. However, these are for reference only and may vary depending on the delivery address and other factors.</p>
            <p>4.2 We will make every effort to deliver the products on time and ensure the security of the packages. However, we are not responsible for any loss, damages, or disruptions that may occur after the packages have been shipped.</p>

            <h2>5. Returns and Refunds</h2>
            <p>5.1 We accept product returns within a specified period from the date of receipt. Please refer to our Return and Refund Policy on the website for detailed information.</p>
            <p>5.2 To qualify for a product return, you must ensure that the product is undamaged and in its original condition. We may apply specific terms and conditions regarding returns.</p>

            <h2>6. Intellectual Property Rights</h2>
            <p>6.1 This website and all content, images, trademarks, and intellectual property related to this website are the property of our company or respective owners.</p>
            <p>6.2 You are not allowed to copy, distribute, reproduce, or use any content or intellectual property from this website without written permission from us or the respective owners.</p>

            <h2>7. Security and Privacy</h2>
            <p>7.1 We are committed to protecting your personal information in accordance with our Privacy Policy. Please refer to our Privacy Policy for more details.</p>

            <h2>8. Limitation of Liability</h2>
            <p>8.1 To the maximum extent permitted by law, we shall not be liable for any loss, damages, or disruptions arising from the use of this website or transactions made on this website.</p>

            <h2>9. General Terms</h2>
            <p>9.1 We reserve the right to change, modify, or update these Terms & Conditions at any time without prior notice. Your continued use of the website after the changes implies your acceptance of those changes.</p>
            <p>9.2 Any disputes arising from or related to the use of this website shall be resolved in accordance with the applicable laws.</p>
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
                                            <!--Start add to cart-->
                                            
                                            </body>
                                            </html>

