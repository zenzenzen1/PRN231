<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>VNPAY RESPONSE</title>
        <base href="http://localhost:9999/SWP391_LapTop/"/>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"
                integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" 
                crossorigin="anonymous" 
        referrerpolicy="no-referrer"></script>
        <style>
            body{
                background-color: #eee;
            }

            .padding{
                padding: 2rem !important;
            }

            .card {
                margin-bottom: 30px;
                border: none;
                -webkit-box-shadow: 0px 1px 2px 1px rgba(154, 154, 204, 0.22);
                -moz-box-shadow: 0px 1px 2px 1px rgba(154, 154, 204, 0.22);
                box-shadow: 0px 1px 2px 1px rgba(154, 154, 204, 0.22);
            }

            .card-header {
                background-color: #fff;
                border-bottom: 1px solid #e6e6f2;
            }

            h3 {
                font-size: 20px;
            }

            h5 {
                font-size: 15px;
                line-height: 26px;
                color: #3d405c;
                margin: 0px 0px 15px 0px;
                font-family: 'Circular Std Medium';
            }

            .text-dark {
                color: #3d405c !important;
            }
            .account li:hover a{
                color: red;
            }

            .account li:hover{
                background: #eee;
            }
        </style>
    </head>
    <body>
        <header class="header shop">
            <!-- Topbar -->
            <div class="topbar">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-12 col-12">
                            <!-- Top Left -->
                            <div class="top-left">
                                <ul class="list-main">
                                    <c:forEach var="p" items="${phone}">
                                        <li><i class="ti-headphone-alt"></i>${p.getTitle()}</li>
                                        </c:forEach>
                                        <c:forEach var="z" items="${email}">
                                        <li><i class="ti-email"></i>${z.getTitle()}</li>
                                        </c:forEach>
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

        <!--Start Bill-->
        <div class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 padding">
            <div class="card" id="info_PDF">
                <h1 style="color: red;display: none" id="hide">Group2Com</h1>
                <div class="card-header p-4">
                    <a class="d-inline-block btn" onclick="generatePDF('${vnp_TxnRef}')" style="color: white;cursor: pointer">Xuất file PDF</a>
                    <div class="d-inline-block" style="padding-left: 11%">
                        <h2 class="mb-0" style="font-size: x-large; color: red">Thanh toán hóa đơn ${mess}</h2>
                    </div>
                    <div class="float-right"> <h3 class="mb-0">Hóa Đơn #${vnp_TxnRef}</h3>
                        Ngày: ${date}</div>
                </div>
                <div class="card-body">
                    <div class="row mb-4">
                        <div class="col-sm-6">
                            <h5 class="mb-3">Từ:</h5>
                            <h3 class="text-dark mb-1">${name}</h3>
                            <div>${address}</div>
                            <div>Email: contact@bbbootstrap.com</div>
                            <div>Phone: ${phoneN}</div>
                        </div>
                        <div class="col-sm-6 ">
                            <h5 class="mb-3">Tới:</h5>
                            <h3 class="text-dark mb-1">Nguyễn Văn A</h3>
                            <div>Khu Công nghệ cao Hòa Lạc, Km29, Đại lộ Thăng Long, H. Thạch Thất, Tp. Hà Nội</div>
                            <c:forEach var="z" items="${email}">
                                <div>Email: ${z.getTitle()}</div>
                            </c:forEach>
                            <c:forEach var="p" items="${phone}">
                                <div>Phone: ${p.getTitle()}</div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="table-responsive-sm">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th class="center">Mã</th>
                                    <th>Tên Sản phẩm</th>
                                    <th class="right" style="width: 15%">Giá</th>
                                    <th class="center" style="width: 10%">Số lượng</th>
                                    <th class="right" style="width: 15%">Tổng tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="c" items="${cartshow.getCart()}">
                                    <tr>
                                        <td class="center">${c.getProduct().getProductID()}</td>
                                        <td class="left strong">${c.getProduct().getProductName()}</td>
                                        <td class="right">${c.getPricediscount()} đ</td>
                                        <td class="center">${c.getQuantity()}</td>
                                        <td class="right">${c.getPrice()} đ</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-sm-5">
                        </div>
                        <div class="col-lg-4 col-sm-5 ml-auto">
                            <table class="table table-clear">
                                <tbody>
                                    <tr>
                                        <td class="left">
                                            <strong class="text-dark">Vận chuyển</strong>
                                        </td>
                                        <td class="right">Miễn phí</td>
                                    </tr>
                                    <tr>
                                        <td class="left">
                                            <strong class="text-dark">Tổng tiền</strong>
                                        </td>
                                        <td class="right">
                                            <strong class="text-dark">${total} đ</strong>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="card-footer bg-white">
                    <p class="mb-0">Group2Com</p>
                </div>
            </div>
        </div>
        <!--End Bill-->

        <footer class="footer">
            <!-- Footer Top -->
            <div class="footer-top section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer about">
                                <div class="logo">
                                    <a href="index.html"><img src="images/logo2.png" alt="#"></a>
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

            function generatePDF(id) {
                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth() + 1;
                var yyyy = today.getFullYear();
                if (dd < 10) {
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
                }
                today = dd + '/' + mm + '/' + yyyy;
                var element = document.getElementById('info_PDF');
                const {jsPDF} = window.jspdf;
                document.getElementById('hide').style.display = "block";
                var pdf = html2pdf();
                let body = document.body;
                let html = document.documentElement;
                let height = Math.max(body.scrollHeight, body.offsetHeight,
                        html.clientHeight, html.scrollHeight, html.offsetHeight);
                let heightCM = height / 32;
                var opt = {
                    margin: 2,
                    filename: 'bill#' + id + "_" + today + '.pdf',
                    image: {type: 'jpeg', quality: 1},
                    html2canvas: {scale: 4},
                    jsPDF: {unit: 'cm',
                        orientation: 'portrait',
                        format: [heightCM, 35]},
                    pagebreak: {mode: 'avoid-all'}
                };
                pdf.from(element).set(opt).save();
                setTimeout(function () {
                    document.getElementById('hide').style.display = "none";
                }, 1);
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
        <!-- Fancybox JS -->
        <script src="js/facnybox.min.js"></script>
        <!-- Waypoints JS -->
        <script src="js/waypoints.min.js"></script>
        <!-- Countdown JS -->
        <script src="js/finalcountdown.min.js"></script>
        <!-- Nice Select JS -->
        <script src="js/nicesellect.js"></script>
        <!-- Ytplayer JS -->
        <script src="js/ytplayer.min.js"></script>
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
