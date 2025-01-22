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
        <!-- Favicon -->
        <base href="http://localhost:9999/SWP391_LapTop/"/>
        <!-- Web Font -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

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
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <style>
            .tile {
                position: relative;
                background: #ffffff;
                border-radius: .6rem;
                padding: 20px;
                -webkit-box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
                box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
                margin-bottom: 30px;
                -webkit-transition: all 0.3s ease-in-out;
                -o-transition: all 0.3s ease-in-out;
                transition: all 0.3s ease-in-out;
            }

            .element-button {
                position: relative;
                background: red;
                border-bottom: 1px solid #ddd;
                margin-bottom: 2rem;
                padding: 3rem;
                outline-color: red
            }
            tr:nth-child(even) {
                background-color: #dddddd;
            }

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
                                        <li><i class="ti-power-off"></i><a href="login">Đăng nhập</a></li>
                                        <li><i class="ti-power-off"></i><a href="login">Đăng ký</a></li>
                                            </c:if >
                                            <c:if test="${acc != null}">
                                        <!--                                        <li><i class="ti-location-pin"></i> Store location</li>
                                                                                <li><i class="ti-alarm-clock"></i> <a href="#">Daily deal</a></li>-->
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

                                                    <li><a href="blogs">Blog</a>  
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

        <c:if test="${list.size() > 0}">
            <!--Start History Order -->
            <main class="container" style="margin: 30px auto">
                <div class="row">
                    <div class="col-md-12">
                        <div class="tile p-0" style="overflow: hidden">
                            <div class="tile-body pb-4">
                                <div class="row element-button">
                                    <h2 style="color: white">ĐƠN MUA</h2>
                                </div>


                                <div class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer" style="width: 95%">
                                    <!--bang thong tin-->
                                    <table class="table table-hover table-bordered mb-2" id="sampleTable">
                                        <thead>
                                            <tr style="background: #eee">
                                                <th class="text-center">Mã đơn hàng</th>
                                                <th class="text-center" style="width:10%">Ngày đặt hàng</th>
                                                <th class="text-center" style="width:25%">Địa chỉ</th>
                                                <th class="text-center" style="width:14%">Tổng tiền</th>
                                                <th class="text-center">Tình trạng</th>
                                                <th class="text-center" style="width:9%">Xem chi tiết</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${list}" var="l">
                                                <tr>
                                                    <td class="text-center">${l.getOrderID()}</td>
                                                    <td class="text-center">${l.getOrderDate()}</td>
                                                    <td class="text-center">${l.getShipAddress()}</td>
                                                    <td class="text-center">${l.getTotalPrice()} đ</td>
                                                    <td class="text-center">
                                                        <c:if test="${l.getStatus() == 'Delivered'}">
                                                            <span class="btn btn-success">
                                                                Đã hoàn thành
                                                            </span>
                                                        </c:if>
                                                        <c:if test="${l.getStatus() == 'Reject'}">
                                                            <span class="btn btn-danger">
                                                                Đã hủy
                                                            </span>
                                                        </c:if>
                                                        <c:if test="${l.getStatus() == 'On delivery'}">
                                                            <span class="btn btn-warning">
                                                                Đang vận chuyển
                                                            </span>
                                                        </c:if>
                                                        <c:if test="${l.getStatus() == 'New'}">
                                                            <span class="btn btn-info">
                                                                Chờ xử lý
                                                            </span>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <button class="btn" type="button" title="Xem chi tiết" onclick="detail('${l.getOrderID()}')">Xem chi tiết</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <!--End bang thong tin-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </main>
            <!--End History Order -->
        </c:if>

        <c:if test="${list.size() == 0}">
            <div id="none" class="shopping-cart section" style="padding: 150px 0px">
                <div class="container">
                    <div class="text-center"><img style="width: 10%" src="image1/cart.png" alt="alt"/></div>
                    <div class="text-center mb-3" style="color: rgb(0 0 0 / 60%); font-weight: bold">Bạn chưa có đơn mua nào</div>
                    <div class="button5 text-center">
                        <a href="product" class="btn" style="color: white">MUA NGAY</a>
                    </div>
                </div>
            </div>
        </c:if>

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
            function detail(id) {
                window.location = "orderdetail?id=" + id;
            }

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
