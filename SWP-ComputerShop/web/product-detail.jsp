<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
    <head>
        <!-- Meta Tag -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name='copyright' content=''>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Title Tag  -->
        <base href="http://localhost:9999/SWP391_LapTop/"/>
        <title>${nametab}</title>
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="images/favicon.png">
        <!-- Web Font -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <!-- StyleSheet -->
        <script src="httpsz//cdn.jsdelivr.net/npm/jqueryQB.5.1/dist/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
        <script src="https://cdn.jsdelivr.net/gh/fancyapps/fancybonB.5.7/dist/jquery.fancybox.min.js"></script>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-zoom/1.7.21/jquery.zoom.min.js"></script>

        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/style_1.css"><!--
        -->        <link rel="stylesheet" href="css/responsive.css"><!--
        -->       <link rel="stylesheet" href="css/product.css">
        <!--<link rel="stylesheet" href="css/style_3.css">-->
        <style>
            table {
                border-collapse: collapse;
                margin: 25px 0;
                font-size: 18px;
                font-family: sans-serif;
                min-width: 400px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
            }


            table tr:first-child {
                background-color: red;
                color: white;
                text-align: left;
            }

            th,td {
                padding: 12px 15px;
            }
            tbody tr {
                border-bottom: 1px solid #dddddd;
            }

            tbody tr:nth-of-type(even) {
                background-color: #f3f3f3;
            }

            tbody tr:last-of-type {
                border-bottom: 2px solid red;
            }

            tbody tr.active-row {
                font-weight: bold;
                color: red;
            }

            .single-add-to-cart {
                float: left;
                width: 100%;
            }

            .sp-carousel-content .single-add-to-cart {
                width: 100%;
            }

            .cart-quantity {
                margin-top: 25px;
                overflow: hidden;
                float: left;
                width: 100%;
            }
            .cart-quantity label {
                display: block;
                font-size: 16px;
                font-weight: 600;
            }
            .cart-quantity .add-to-cart {
                border: none;
                font-size: 14px;
                color: white;
                position: relative;
                background: red;
                cursor: pointer;
                font-weight: 500;
                text-transform: capitalize;
                padding: 13px 70px;
                border-radius: 2px;
                transition: all 0.3s ease-in-out;
            }
            .cart-quantity .add-to-cart:hover {
                background: #242424;
                color: #ffffff;
            }

            .sp-carousel-content .cart-quantity label {
                display: inline-block;
                margin-right: 10px;
            }

            .sp-carousel-content .cart-quantity {
                margin-top: 5px;
            }

            .sp-normal-content .cart-quantity {
                margin-top: 0;
            }

            .sp-affiliate-content .cart-quantity {
                margin-top: 3px;
                overflow: hidden;
                float: left;
                width: 100%;
            }

            .minicart .minicart-product-list li .minicart-product-image span.quantity {
                background: -webkit-gradient(linear, left top, left bottom, from(#626262), to(#2f2f2f));
                background: -webkit-linear-gradient(#626262, #2f2f2f);
                background: -o-linear-gradient(#626262, #2f2f2f);
                background: linear-gradient(#626262, #2f2f2f);
                border-radius: 40px;
                color: #fff;
                font-family: Carrois Gothic, Arial, Helvetica, sans-serif;
                font-size: 11px;
                font-weight: bold;
                height: 20px;
                left: -10px;
                line-height: 20px;
                overflow: visible;
                position: absolute;
                text-align: center;
                top: -10px;
                width: 20px;
                z-index: 2;
            }

            .sp-carousel-content .quantity {
                display: inline-block;
            }

            .cart-plus-minus {
                float: left;
                margin-right: 15px;
                position: relative;
                width: 76px;
                text-align: left;
            }
            .cart-plus-minus .cart-plus-minus-box {
                border: 1px solid #e1e1e1;
                color: #242424;
                height: 46px;
                text-align: center;
                width: 3rem;
                background: #fff;
            }

            .cart-plus-minus .dec.qtybutton, .cart-plus-minus .inc.qtybutton {
                border-bottom: 1px solid #e1e1e1;
                border-right: 1px solid #e1e1e1;
                border-top: 1px solid #e1e1e1;
                color: #333333;
                cursor: pointer;
                height: 23px;
                line-height: 20px;
                position: absolute;
                text-align: center;
                -webkit-transition: all 0.3s ease-in-out 0s;
                transition: all 0.3s ease-in-out 0s;
                width: 28px;
            }

            .cart-plus-minus .dec.qtybutton:hover, .cart-plus-minus .inc.qtybutton:hover {
                background: #ddd;
            }
            .cart-plus-minus .dec.qtybutton {
                bottom: 0;
                right: 0;
            }
            .cart-plus-minus .inc.qtybutton {
                border-bottom: none;
                top: 0;
                right: 0;
                z-index: 4;
            }
            /* Chrome, Safari, Edge, Opera */
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            /* Firefox */
            input[type=number] {
                -moz-appearance: textfield;
            }
            .account li:hover a{
                color: red;
            }

            .account li:hover{
                background: #eee;
            }
        </style>
    </head>
</head>
<body>
    <div>
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
                                </ul></div>
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
                                <div class="col-12">
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
                <!--/ End Header Inner -->
        </header>

        <div class = "card-wrapper mb-3 mt-3">
            <div class = "card" >
                <!-- card left -->
                <div class = "product-imgs" >
                    <div class = "img-display" >
                        <div class = "img-showcase">
                            <a data-fancybox = "gallery" href="imageProduct/${product.getLargeImage()}"><img  class="imgSlide" src = "imageProduct/${product.getLargeImage()}" alt = "image"></a>
                                <c:forEach items="${data}" var="item">
                                <a data-fancybox = "gallery" href="${item}"><img  class="imgSlide" src = "${item}" alt = "image"></a>
                                </c:forEach>
                        </div>
                    </div>

                    <div class = "img-select">
                        <div class = "img-item">
                            <a href = "#" data-id = "1" >

                                <img class="imgSlide" src = "imageProduct/${product.getLargeImage()}" alt = "image">
                            </a>
                        </div>

                        <c:set var="count" value="1"/> 
                        <c:forEach items="${data}" var="item" >
                            <c:set var="count" value="${count + 1}" />
                            <div class = "img-item">
                                <a href = "#" data-id ="${count}">
                                    <img class="imgSlide" src = "${item}" alt = "image">
                                </a>
                            </div>
                        </c:forEach>  

                    </div>
                </div>
                <script>
                    $(document).ready(function () {
                        $('.img-showcase a').zoom();
                    });
                </script>
                <script>
                    var showcaseImages = document.querySelectorAll('.img-showcase img');
                    var selectLinks = document.querySelectorAll('.img-select a');

                    // Ẩn tất cả các ảnh trong phần showcase, trừ ảnh đầu tiên
                    for (var i = 1; i < showcaseImages.length; i++) {
                        showcaseImages[i].style.display = 'none';
                    }

                    // Xử lý sự kiện khi người dùng chọn ảnh
                    selectLinks.forEach(function (link, index) {
                        link.addEventListener('click', function (event) {
                            event.preventDefault();

                            // Hiển thị ảnh tương ứng trong phần showcase
                            for (var i = 0; i < showcaseImages.length; i++) {
                                if (i === index) {
                                    showcaseImages[i].style.display = 'block';
                                } else {
                                    showcaseImages[i].style.display = 'none';
                                }
                            }
                        });
                    });
                </script>


                <!-- card right -->

                <div class = "product-content">
                    <h2 class = "product-title">${product.getProductName()}</h2>
                    <div class = "product-price">
                        <c:if test="${product.getDiscount() != 0}">
                            <p style="font-size: larger;font-weight: bold">Price: 
                                <span style="color: #b4afaf; font-weight: bold;text-decoration: line-through">${product.getPrice()} đ</span>
                                <span style="color: red; font-weight: bold">${pricediscount} đ</span>
                            </p>
                        </c:if>
                        <c:if test="${product.getDiscount() == 0}">
                            <p style="font-size: larger;font-weight: bold">Price: 
                                <span style="color: red; font-weight: bold">${product.getPrice()} đ</span>
                            </p>
                        </c:if>
                    </div>

                    <div class = "product-detail">
                        <h2>about this item: </h2>
                        ${product.getOtherDescription()}
                        <ul>
                            <li>Brand: <span>${product.getBrandName()}</span></li>
                            <li>Category: <span>${product.getCategoryName()}</span></li>
                            <li>Bảo hành: <span>${product.getGuarantee()} tháng</span></li>
                            <li>Shipping Fee: <span>Free</span></li>
                        </ul>
                    </div>

                    <div class="single-add-to-cart">
                        <div class="cart-quantity">
                            <div class="quantity">
                                <label>Quantity</label>
                                <div class="cart-plus-minus">
                                    <input onchange="numberInput()" id="quantity" class="cart-plus-minus-box" max="${max}" min="1" value="1" type="number">
                                    <div onclick="numberProduct(this)" class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
                                    <div onclick="numberProduct(this)" class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                                </div>
                            </div>
                            <button class="add-to-cart" type="button" onclick="buy('${product.getProductID()}');CartShow()">Add to cart</button>
                        </div>
                    </div>        
                </div>
            </div>



        </div>
    </div>

    <div class="col-md-9 m-auto p-5"   style="overflow: hidden; margin: 0 auto; border: 1px solid black;overflow-style: none ">
        ${product.getDescription()}
    </div>

    <!-- Start Footer Area -->
    <footer class="footer mt-4">
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

    <!--Start add to cart-->
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

        function numberProduct(element) {
            var total = document.getElementById('quantity');
            if (element.className === "dec qtybutton") {
                if (parseInt(total.min) >= parseInt(total.value)) {
                    return;
                }
                total.value = parseInt(total.value) - 1;
            } else {
                if (parseInt(total.max) <= parseInt(total.value)) {
                    return;
                }
                total.value = parseInt(total.value) + 1;
            }
        }

        function numberInput() {
            var total = document.getElementById('quantity');
            if (parseInt(total.max) === 0) {
                total.value = 1;
            }
            if (parseInt(total.value) > parseInt(total.max)) {
                total.value = total.max;
            }
            if (parseInt(total.min) > parseInt(total.value)) {
                total.value = total.min;
            }
        }

        function buy(idp) {
            let txt = "";
            let temp = '';
            let num = document.getElementById('quantity');
            if (parseInt(num.value) > parseInt(num.max)) {
                swal({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Số lượng sản phẩm có thể đặt đã đạt tối đa!\nXin hãy chọn sản phẩm khác!!!'
                });
                return;
            }
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
                    let str = txt.split("-");
                    id[j] = str[0];
                    sl[j] = str[1];
                    count++;
                }
                let sln = 0;
                let idnew = "";
                let check = true;
                for (var i = 0; i < id.length; i++) {
                    if (parseInt(id[i]) === parseInt(idp)) {
                        sln = parseInt(sl[i]) + parseInt(num.value);
                        sl[i] = "";
                        idnew = id[i];
                        id[i] = "";
                        check = false;
                        break;
                    }
                }
                if (sl.length === 10 && check === true) {
                    swal({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Số lượng sản phẩm trong 1 đơn hàng đã đầy!!!'
                    });
                    return;
                }
                if (check) {
                    txt = txt + ":" + idp + '-' + 1;
                    num.max = parseInt(num.max) - parseInt(num.value);
                    num.value = 1;
                    document.getElementById('sizeCart').innerHTML = count + 1;
                    Cookies.set('cart', txt, {expires: 7, path: '/SWP391_LapTop'});
                    return;
                }
                num.max = parseInt(num.max) - parseInt(num.value);
                num.value = 1;
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
                if (id.length > 1)
                    temp = temp + ':' + idnew + '-' + sln;
                else
                    temp = temp + idnew + '-' + sln;
                document.getElementById('sizeCart').innerHTML = count;
            } else {
                temp = txt + idp + '-' + num.value;
                document.getElementById('sizeCart').innerHTML = 1;
                num.max = parseInt(num.max) - parseInt(num.value);
                num.value = 1;
            }
            Cookies.set('cart', temp, {expires: 7, path: '/SWP391_LapTop'});
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
            let num = document.getElementById('quantity');
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
                    let str = txt.split("-");
                    num.max = parseInt(num.max) + parseInt(str[1]);
                    Cookies.remove('cart', {path: '/SWP391_LapTop'});
                    document.getElementById('sizeCart').innerHTML = 0;
                    return;
                }
                for (var i = 0; i < id.length; i++) {
                    if (parseInt(id[i]) === parseInt(idp)) {
                        num.max = parseInt(num.max) + parseInt(sl[i]);
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
    <!--End add to cart-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/3.0.1/js.cookie.min.js" 
            integrity="sha512-wT7uPE7tOP6w4o28u1DN775jYjHQApdBnib5Pho4RB0Pgd9y7eSkAV1BTqQydupYDB9GBhTcQQzyNMPMV3cAew==" 
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
    <script src="js/scriptt.js"></script>
    <script src="js/vendor/jquery-1.12.4.min.js"></script>

</body>
</html>
