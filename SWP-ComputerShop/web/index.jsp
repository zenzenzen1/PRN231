
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">
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
                                                <c:if test="${roll==0}">
                                            <li><i class="ti-user"></i> <a href="updateUserClient">${acc.getUserName()}</a></li>
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
                                    <input type="text" placeholder="Search here...">
                                    <button value="search" type="button"><i class="ti-search"></i></button>

                                </div>
                                <!--/ End Search Form -->
                            </div>
                            <!--/ End Search Form -->
                            <div class="mobile-nav"></div>
                        </div>
                        <div class="col-lg-8 col-md-7 col-12">
                            <div class="search-bar-top">
                                <div class="search-bar">
                                    <input id="searchId" name="key" placeholder="Search Products Here....." type="search">
                                    <button onclick= "searchHome()" type="button" class="btnn"><i class="ti-search"></i></button>

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
            <div class="image-slider">
                <img src="images/bannerdau.jpg" alt="Banner 2" class="slider-image">
                <img src="images/bannerthuhai.jpg" alt="Banner 3" class="slider-image">
                <img src="images/banner1.jpg" alt="Banner 4" class="slider-image">
                <img src="images/banner2.jpg" alt="Banner 5" class="slider-image">
                <img src="images/banner3.jpg" alt="Banner 6" class="slider-image">
                <img src="images/banner4.jpg" alt="Banner 7" class="slider-image">
            </div>
        </header>

        <section class="shop-blog section">
            <div class="container">

                <div class="row">
                    <c:forEach var="b" items="${newests}">
                        <div class="col-lg-4 col-md-6 col-12">
                            <!-- Start Single Blog  -->
                            <div class="shop-single-blog">
                                    <div class="image" >  <a href="blog-detail/${t.replaceAll("[\\s]","-")}"><img src="newsImage/${b.getImage()}" alt="#"></a></div>
                                <div class="content">
                                    <p class="date">${b.getCreateDate()}</p>
                                        <a href="blog-detail/${b.getTitle().replaceAll(" ","-")}" class="title">${b.getTitle()}</a>
                                    <a href="#" class="more-btn">Continue Reading</a>
                                </div>
                            </div>
                            <!-- End Single Blog  -->
                        </div>

                    </c:forEach>
                </div>
            </div>
        </section>

        <!-- End Small Banner -->


        <!-- Start Product Area -->
        <div class="product-area section">

            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h2>Trending Item</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="product-info">
                            <div class="nav-main">
                                <!-- Tab Nav -->
                                <ul class="nav nav-tabs" id="myTab" role="tablist">                                 
                                    <li class="nav-item"><a class="nav-link active" onclick="Load(event, '0')" >All</a></li>
                                        <c:forEach items="${brand}" var="item">                                 
                                        <li class="nav-item"><a class="nav-link" onclick="Load(event, '${item.getBrandID()}')" >${item.getBrandName()} </a></li>                                  
                                        </c:forEach>
                                </ul>

                                <!--/ End Tab Nav -->
                            </div>
                            <div class="tab-content" id="myTabContent">
                                <!-- Start Single Tab -->
                                <div class="tab-pane fade show active" id="man" role="tabpanel">
                                    <div class="tab-single">
                                        <div id="listContent" class="row">
                                            <c:forEach items="${listProduct}" var="item">
                                                <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                    <div class="single-product">
                                                        <div class="product-img">
                                                            <a href="productDetail/${item.getProductName().replaceAll(" ","-")}">
                                                                <img style="width: 269px; height: 367px;"class="default-img" src="imageProduct/${item.getLargeImage()}" alt="#">
                                                                <img style="width: 269px; height: 367px;"class="hover-img" src="imageProduct/${item.getLargeImage()}" alt="#">
                                                            </a>
                                                            <div class="button-head">
                                                                <div class="product-action">
                                                                    <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                    <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                    <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                </div>
                                                                <div class="product-action-2">
                                                                    <a title="Add to cart" onclick="buy('${item.getProductID()}', '${item.getQuantity()}');CartShow()">Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="product-content">
                                                            <h3><a href="productDetail/${item.getProductName().replaceAll(" ","-")}"></a></h3>
                                                            <div class="product-price">
                                                                <h6 style="font-weight: bold; color: red;">${item.getPrice()} đ</h6><br>
                                                                <h5 style="font-weight: bold">${item.getProductName()}</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </div>
                                        <div id="emptyList">

                                        </div>

                                    </div>
                                </div>
                                <script>
                                    function Load(event, id) {
                                        var navItems = document.getElementsByClassName('nav-link');
                                        for (var i = 0; i < navItems.length; i++) {
                                            navItems[i].classList.remove('active');
                                        }

                                        // Thêm lớp 'active' vào thẻ <li> được nhấp vào
                                        event.target.classList.add('active');
                                        $.ajax({
                                            url: "brand?brandID=" + id,

                                            type: "GET",
                                            success: function (data) {
                                                var row = document.getElementById("listContent");
                                                var empty = document.getElementById("emptyList");

                                                if (data.trim() !== "") {
                                                    row.innerHTML = data;
                                                    empty.innerHTML = ""; // Xóa nội dung của "emptyList"
                                                } else {
                                                    row.innerHTML = ""; // Xóa nội dung của "listContent"
                                                    empty.innerHTML = "<br><br><br><h5 style=\"text-align: center;\">Hiện chưa có sản phẩm của thương hiệu này</h5>";
                                                }
                                            },
                                            error: function (xhr) {

                                            }
                                        });
                                    }
                                </script>


                                <!--/ End Single Tab -->
                            </div>

                        </div>
                        <br>
                        <br>
                        <br>
                        <!-- End Product Area -->

                        <!-- Start Midium Banner  -->
                        <section class="midium-banner">
                            <div class="container">
                                <div class="section-title">
                                    <h2>Hot Item</h2>
                                </div>
                                <div class="row">
                                    <!-- Single Banner  -->
                                    <c:forEach items="${hot}" var="item" varStatus="status">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="single-banner">
                                                <a href="productDetail/${item.getProductName().replaceAll(" ","-")}">
                                                    <img style="width: 700px; height: 500px;"class="default-img" src="imageProduct/${item.getLargeImage()}" alt="#">

                                                </a>
<!--                                                 <a href="productDetail/${item.getProductName().replaceAll(" ","-")}">
                                    <img src="imageProduct/${item.getLargeImage()}" alt="#">-->
                                                <div class="content">
                                                    <h2 style="color : red;">Top ${status.index + 1} best seller 2023</h2>
                                                    <h3 style="color:wheat;">Discount <br>Up to <span>${item.getDiscount()} %</span></h3>
                                                    <a href="productDetail/${item.getProductName().replaceAll(" ","-")}">Shop Now</a>
                                                </div>
                                            </div>

                                        </div>
                                    </c:forEach>
                                    </section>
                                    <!-- End Midium Banner -->

                                    <!-- Start Most Popular -->
                                    <div class="product-area most-popular section">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="section-title">
                                                        <h2>New Item</h2>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="owl-carousel popular-slider">
                                                        <!-- Start Single Product -->
                                                        <c:forEach items="${newItem}" var="item">
                                                            <div class="single-product">

                                                                <div class="product-img">
                                                                    <a href="productDetail/${item.getProductName().replaceAll(" ","-")}">
                                                                        <img style="width: 269px; height: 367px;" class="default-img" src="imageProduct/${item.getLargeImage()}" alt="#">
                                                                        <img style="width: 269px; height: 367px;" class="hover-img" src="imageProduct/${item.getLargeImage()}" alt="#">
                                                                        <span class="out-of-stock">New</span>
                                                                    </a>
                                                                    <div class="button-head">
                                                                        <div class="product-action">
                                                                            <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                            <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                            <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                        </div>
                                                                        <div class="product-action-2">
                                                                            <a title="Add to cart" onclick="buy('${item.getProductID()}', '${item.getQuantity()}');CartShow()">Add to cart</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="product-content">
                                                                    <h3><a href="productDetail/${item.getProductName().replaceAll(" ","-")}"></a></h3>
                                                                    <div class="product-price">

                                                                        <span>${item.getPrice()}</span>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </c:forEach>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Most Popular Area -->


                                    <!-- Start Shop Home List  -->
                                    <section class="shop-home-list section">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-lg-4 col-md-6 col-12">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="shop-section-title">
                                                                <h1>Chuột</h1>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Start Single List  -->
                                                    <c:forEach items="${mouse}" var="item">
                                                        <div class="single-list">
                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-6 col-12">
                                                                    <div class="list-image overlay">
                                                                        <a href="productDetail/${item.getProductName().replaceAll(" ","-")}">
                                                                            <img src="imageProduct/${item.getLargeImage()}" alt="#">
                                                                        </a>
                                                                        <a href="productDetail/${item.getProductName().replaceAll(" ","-")}" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6 col-md-6 col-12 no-padding">
                                                                    <div class="content">
                                                                        <h4 class="title"><a href="productDetail/${item.getProductName().replaceAll(" ","-")}">${item.getProductName()}</a></h4>
                                                                        <p class="price with-discount">${item.getPrice()}</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                    <!-- End Single List  -->

                                                </div>
                                                <div class="col-lg-4 col-md-6 col-12">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="shop-section-title">
                                                                <h1>Bàn phím</h1>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Start Single List  -->
                                                    <c:forEach items="${keyboard}" var="item">
                                                        <div class="single-list">
                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-6 col-12">
                                                                    <div class="list-image overlay">
                                                                        <a href="productDetail/${item.getProductName().replaceAll(" ","-")}">
                                                                            <img src="imageProduct/${item.getLargeImage()}" alt="#">
                                                                        </a>
                                                                        <a href="productDetail/${item.getProductName().replaceAll(" ","-")}" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6 col-md-6 col-12 no-padding">
                                                                    <div class="content">
                                                                        <h4 class="title"><a href="productDetail/${item.getProductName().replaceAll(" ","-")}">${item.getProductName()}</a></h4>
                                                                        <p class="price with-discount">${item.getPrice()}</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                    <!-- End Single List  -->

                                                </div>
                                                <div class="col-lg-4 col-md-6 col-12">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="shop-section-title">
                                                                <h1>Tai nghe</h1>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Start Single List  -->
                                                    <c:forEach items="${headphone}" var="item">
                                                        <div class="single-list">
                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-6 col-12">
                                                                    <div class="list-image overlay">
                                                                        <a href="productDetail/${item.getProductName().replaceAll(" ","-")}">
                                                                            <img src="imageProduct/${item.getLargeImage()}" alt="#">
                                                                        </a>
                                                                        <a href="productDetail/${item.getProductName().replaceAll(" ","-")}" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6 col-md-6 col-12 no-padding">
                                                                    <div class="content">
                                                                        <h4 class="title"><a href="productDetail/${item.getProductName().replaceAll(" ","-")}">${item.getProductName()}</a></h4>
                                                                        <p class="price with-discount">${item.getPrice()}</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                    <!-- End Single List  -->
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    <!-- End Shop Home List  -->

                                    <!-- Start Shop Blog  -->
                                    <!--Start of Tawk.to Script-->
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
                                    <!--End of Tawk.to Script-->
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

                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="ti-close" aria-hidden="true"></span></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row no-gutters">
                                                        <div class="col-lg-6 offset-lg-3 col-12">
                                                            <h4 style="margin-top:100px;font-size:14px; font-weight:500; color:#F7941D; display:block; margin-bottom:5px;">Eshop Free Lite</h4>
                                                            <h3 style="font-size:30px;color:#333;">About US<h3>
                                                                    <p style="display:block; margin-top:20px; color:#888; font-size:14px; font-weight:400;"></p>
                                                                    <div class="button" style="margin-top:30px;">
                                                                        <a href="https://wpthemesgrid.com/downloads/eshop-ecommerce-html5-template/" target="_blank" class="btn" style="color:#fff;"></a>
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
                                                                                            <div class="logo">
                                                                                                <a href="index.jsp"><img src="images/logo2.png" alt="#"></a>
                                                                                            </div>
                                                                                            <p class="text">Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue,  magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.</p>
                                                                                            <p class="call">Got Question? Call us 24/7<span><a href="tel:123456789">+0123 456 789</a></span></p>
                                                                                        </div>
                                                                                        <!-- End Single Widget -->
                                                                                    </div>
                                                                                    <c:forEach var="infor" items="${inCate}">
                                                                                        <div class="col-lg-2 col-md-6 col-12">
                                                                                            <!-- Single Widget -->
                                                                                            <div class="single-footer links">
                                                                                                <h4>${infor.getNewsTypeName()}</h4>

                                                                                                <ul>
                                                                                                    <c:forEach var="info" items="${information}">

                                                                                                        <a style="color: white" href="footer-detail?id=${info.getNewsID()}" class="title">${info.getTitle()}</a>
                                                                                                        <br>
                                                                                                    </c:forEach>
                                                                                                </ul>

                                                                                            </div>
                                                                                        </div>
                                                                                    </c:forEach>
                                                                                    <c:forEach var="customer" items="${CusCate}">
                                                                                        <div class="col-lg-2 col-md-6 col-12">
                                                                                            <!-- Single Widget -->
                                                                                            <div class="single-footer links">
                                                                                                <h4>${customer.getNewsTypeName()}</h4>

                                                                                                <ul>
                                                                                                    <c:forEach var="cus" items="${customerservice}">
                                                                                                        <a style="color: white" href="footer-detail?id=${cus.getNewsID()}" class="title">${cus.getTitle()}</a>
                                                                                                        <br>
                                                                                                    </c:forEach>
                                                                                                </ul>

                                                                                            </div>
                                                                                        </div>
                                                                                    </c:forEach>
                                                                                    <c:forEach var="getin" items="${GetCate}">
                                                                                        <div class="col-lg-2 col-md-6 col-12">
                                                                                            <!-- Single Widget -->
                                                                                            <div class="single-footer links">
                                                                                                <h4>${getin.getNewsTypeName()}</h4>

                                                                                                <ul>
                                                                                                    <c:forEach var="getintouch" items="${getintouch}">
                                                                                                        <p style="color: white">${getintouch.getContent()}</p>
                                                                                                    </c:forEach>
                                                                                                </ul>
                                                                                                <ul>

                                                                                                </ul>
                                                                                            </div>
                                                                                        </div>  
                                                                                    </c:forEach>


                                                                                    <!-- End Single Widget -->

                                                                                </div>
                                                                                <!-- End Single Widget -->
                                                                            </div>

                                                                            <!-- End Single Widget -->

                                                                        </div>
                                                                        <!-- End Single Widget -->



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
                                                                        function searchHome() {
                                                                            var checkSearch = document.getElementById('searchId');
                                                                            var url = "product?key=" + checkSearch.value + "&optionSort=0";
                                                                            window.location = url;
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

                                                                        function buy(idp, slp) {
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
                                                                                        sln = parseInt(sl[i]) + 1;
                                                                                        sl[i] = "";
                                                                                        idnew = id[i];
                                                                                        id[i] = "";
                                                                                        if (parseInt(sln) > parseInt(slp)) {
                                                                                            swal({
                                                                                                icon: 'error',
                                                                                                title: 'Oops...',
                                                                                                text: 'Số lượng sản phẩm có thể đặt đã đạt tối đa!\nXin hãy đặt sản phẩm khác!!!'
                                                                                            });
                                                                                            return;
                                                                                        }
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
                                                                                    document.getElementById('sizeCart').innerHTML = count + 1;
                                                                                    Cookies.set('cart', txt, {expires: 7, path: '/SWP391_LapTop'});
                                                                                    return;
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
                                                                                if (id.length > 1)
                                                                                    temp = temp + ':' + idnew + '-' + sln;
                                                                                else
                                                                                    temp = temp + idnew + '-' + sln;
                                                                                document.getElementById('sizeCart').innerHTML = count;
                                                                            } else {
                                                                                temp = txt + idp + '-' + 1;
                                                                                document.getElementById('sizeCart').innerHTML = 1;
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
                                                                    <script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/3.0.1/js.cookie.min.js" 
                                                                            integrity="sha512-wT7uPE7tOP6w4o28u1DN775jYjHQApdBnib5Pho4RB0Pgd9y7eSkAV1BTqQydupYDB9GBhTcQQzyNMPMV3cAew==" 
                                                                    crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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
                                                                    <script src="js/banner.js"></script>
                                                                    <script src="js/chat.js"></script>
                                                                    </body>
                                                                    </html>
