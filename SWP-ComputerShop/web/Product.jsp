<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

    <!-- shop-list-left-sidebar31:48-->
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
            input[type="checkbox"] {
                display: inline-block;
            }
            @media only screen and (max-width: 480px) {
                .nav.main-menu.menu.navbar-nav {
                    font-size: 14px;
                }
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
                                <!--/ End Search Form -->
                            </div>
                            <!--/ End Search Form -->
                            <div class="mobile-nav"></div>
                        </div>
                        <div class="col-lg-8 col-md-7 col-12">
                            <div class="search-bar-top">
                                <div class="search-bar" >                                    
                                    <input  name="key" placeholder="Search Products Here....." type="text" id="searchId" style="display: flex">
                                    <button class="btnn" type="button" onclick= "setPage('${page}','${num}','${key}')"><i class="ti-search"></i></button>                                    
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
                                    <a href="showcart" class="single-icon"><i class="ti-bag"></i> <span class="total-count" id="sizeCart">${sizec}</span></a>
                                    <!-- Shopping Item -->
                                    <div class="shopping-item" id="cart">
                                        <div class="dropdown-cart-header">
                                            <span>${sizec} sản phẩm</span>
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
                                                    <li><a href="About-us">About Us</a></li>
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




            <!-- Header Middle Area End Here -->
            <!-- Begin Header Bottom Area -->

        </div>
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
    <form id="categoryId" action="product">
        <input type="hidden" name="key" value="${key}">
    <!-- Header Area End Here -->
    <!-- Begin Li's Breadcrumb Area -->
    <div class="breadcrumb-area">
        <div class="container">
            <div class="breadcrumb-content">

            </div>
        </div>
    </div>
    <!-- Li's Breadcrumb Area End Here -->
    <!-- Begin Li's Content Wraper Area -->
    <div class="content-wraper pt-60 pb-60">

        <div class="container">            
                <div class="row">
                    <div class="col-lg-3 order-1 order-lg-1">
                        <!--sidebar-categores-box start  -->
                        <div class="sidebar-categores-box mt-sm-30 mt-xs-30">
                            <div class="sidebar-title">
                                <h2>Danh Mục</h2>
                            </div>
                            <!-- category-sub-menu start -->
                            <div class="category-sub-menu">
                                <ul>
                                    <li><a href="#" style="color: red">SẢN PHẨM MỚI</a>
                                    </li>
                                    <li><a href="# ">SẢN PHẨM GIẢM GIÁ</a>
                                    </li>
                                    <li><a href="#">SẢN PHẨM HOT</a>
                                    </li>
                                    <li><a href="#">SẢN PHẨM NỔI BẬT</a>
                                    </li>

                                </ul>
                            </div>
                            <!-- category-sub-menu end -->
                        </div>
                        <!--sidebar-categores-box end  -->
                        <!--sidebar-categores-box start  -->

                        <!-- filter-sub-area end -->
                        <!-- filter-sub-area start -->
                        <div class="sidebar-categores-box">

                            <div class="sidebar-title">
                                <h2>LỌC SẢN PHẨM</h2>
                            </div>
                            <!-- btn-clear-all start -->

                            <!-- btn-clear-all end -->
                            <!-- filter-sub-area start -->

                            <div class="filter-sub-area">                                
                                <h5 class="filter-sub-titel">THƯƠNG HIỆU</h5>
                                <div class="categori-checkbox"> 

                                    <ul>  
                                        <li>
                                            <input type="checkbox" id="b0"
                                                   name="brands"
                                                   ${checkbid[0]?"checked":""}
                                                   value="${0}" onclick="setCheckCategory(this)"/>Tất cả<br/>
                                        </li>    

                                        <c:forEach begin="0" end="${brand.size()-1}" var="i">
                                            <li><input type="checkbox" id="bm"
                                                       name="brands"                                                        
                                                       value="${brand.get(i).getBrandID()}" 
                                                       ${checkbid[i+1]?"checked":""} 
                                                       onclick="setCheckCategory(this)"
                                                       >${brand.get(i).getBrandName()}</li>
                                            </c:forEach>

                                    </ul>

                                </div>
                            </div>
                            <!-- filter-sub-area end -->
                            <!-- filter-sub-area start -->

                            <div class="filter-sub-area pt-sm-10 pt-xs-10">
                                <h5 class="filter-sub-titel" >LOẠI SẢN PHẨM </h5>
                                <div class="categori-checkbox">
                                    <ul>  
                                        <li>
                                            <input type="checkbox" id="c0"
                                                   name="categoris"
                                                   ${checkcid[0]?"checked":""}
                                                   value="${0}" onclick="setCheckCategory(this)"/>Tất cả<br/>
                                        </li>    

                                        <c:forEach begin="0" end="${listCategorys.size()-1}" var="i">
                                            <li><input type="checkbox" id="cm"
                                                       name="categoris"                                                        
                                                       value="${listCategorys.get(i).getCategoryID()}" 
                                                       ${checkcid[i+1]?"checked":""} 
                                                       onclick="setCheckCategory(this)"
                                                       >${listCategorys.get(i).getCategoryName()}</li>
                                            </c:forEach>

                                    </ul>
                                </div>
                            </div>


                            <div class="filter-sub-area pt-sm-10 pt-xs-10">
                                <h5 class="filter-sub-titel">GIÁ SẢN PHẨM</h5>
                                <div class="categori-checkbox">
                                    <ul>  
                                        <li>
                                            <input type="checkbox" id="p0"
                                                   name="prices"
                                                   ${checkpid[0]?"checked":""}
                                                   value="${0}" onclick="setCheckCategory(this)"/>Tất cả<br/>
                                        </li>    

                                        <c:forEach begin="0" end="${4}" var="i">
                                            <li><input type="checkbox" id="pm"
                                                       name="prices"                                                        
                                                       value="${(i+1)}" 
                                                       ${checkpid[i+1]?"checked":""} 
                                                       onclick="setCheckCategory(this)"
                                                       >${priceCheckBox[i]}</li>
                                            </c:forEach>

                                    </ul>                                
                                </div>
                            </div>


                            <div class="filter-sub-area pt-sm-10 pt-xs-10">
                                <h5 class="filter-sub-titel">RAM</h5>
                                <div class="categori-checkbox">
                                    <ul>  
                                        <li>
                                            <input type="checkbox" id="r0"
                                                   name="rams"
                                                   ${checkrid[0]?"checked":""}
                                                   value="${0}" onclick="setCheckCategory(this)"/>Tất cả<br/>
                                        </li>    

                                        <c:forEach begin="0" end="${3}" var="i">
                                            <li><input type="checkbox" id="rm"
                                                       name="rams"                                                        
                                                       value="${(i+1)}" 
                                                       ${checkrid[i+1]?"checked":""} 
                                                       onclick="setCheckCategory(this)"
                                                       >${listRamCheckBox[i]}</li>
                                            </c:forEach>
                                    </ul>                              

                                </div>
                            </div>

                            <div class="filter-sub-area pt-sm-10 pt-xs-10">
                                <h5 class="filter-sub-titel">CPU</h5>
                                <div class="categori-checkbox">                              
                                    <ul>  
                                        <li>
                                            <input type="checkbox" id="cpu0"
                                                   name="cpus"
                                                   ${checkCPUid[0]?"checked":""}
                                                   value="${0}" onclick="setCheckCategory(this)"/>Tất cả<br/>
                                        </li>    

                                        <c:forEach begin="0" end="${2}" var="i">
                                            <li><input type="checkbox" id="cpum"
                                                       name="cpus"                                                        
                                                       value="${(i+1)}" 
                                                       ${checkCPUid[i+1]?"checked":""} 
                                                       onclick="setCheckCategory(this)"
                                                       >${listCPUCheckbox[i]}</li>
                                            </c:forEach>
                                    </ul>                                
                                </div>
                            </div>

                            <br>
                            <li><a href="product?brands=0&categoris=0&prices=0&rams=0&cpus=0" style="color: red; text-align:center">XÓA TẤT CẢ</a></li>

                        </div>
                        <!--sidebar-categores-box end  -->
                    </div>
                    <div class="col-lg-9 order-2 order-lg-2" >
                        <!-- Begin Li's Banner Area -->
                        <div class="single-banner shop-page-banner">
                            <a href="#">
                                <img src="images/bg-banner/2.jpg" alt="Li's Static Banner">
                            </a>
                        </div>
                        <!-- Li's Banner Area End Here -->
                        <!-- shop-top-bar start -->
                        <div class="shop-top-bar mt-30">
                            <div class="shop-bar-inner">
                                <div class="product-view-mode">
                                    <!-- shop-item-filter-list start -->
                                    <ul class="nav shop-item-filter-list" role="tablist">
                                        <li role="presentation"><a data-toggle="tab" role="tab" aria-controls="grid-view" href="#grid-view"><i class="fa fa-th"></i></a></li>
                                        <li class="active" role="presentation"><a aria-selected="true" class="active show" data-toggle="tab" role="tab" aria-controls="list-view" href="#list-view"><i class="fa fa-th-list"></i></a></li>
                                    </ul>
                                    <!-- shop-item-filter-list end -->
                                </div>
                                <div class="toolbar-amount">
                                    <span>Showing 1 to 9 of 15</span>
                                </div>
                            </div>
                            <!-- product-select-box start -->
                            <div class="product-select-box">
                                <div class="product-short">
                                    <p>Sort By:</p>
                                    <select class="nice-select" id="optionSort" name="optionSort" onchange="setOptionSort()">
                                        <c:if test="${optionSort == null || optionSort == 0}">
                                            <option value="0" selected>Mặc định</option>
                                            <option value="1">Sắp xếp từ A - Z</option>
                                            <option value="2">Sắp xếp từ Z - A</option>
                                            <option value="3">Giá Tăng Dần</option>
                                            <option value="4">Giá Giảm Dần</option>
                                        </c:if>
                                        <c:if test="${optionSort != null}">
                                            <c:if test="${optionSort == 1}">
                                                <option value="0">Mặc định</option>
                                                <option value="1" selected>Sắp xếp từ A - Z</option>
                                                <option value="2">Sắp xếp từ Z - A</option>
                                                <option value="3">Giá Tăng Dần</option>
                                                <option value="4">Giá Giảm Dần</option>
                                            </c:if>
                                            <c:if test="${optionSort == 2}">
                                                <option value="0">Mặc định</option>
                                                <option value="1">Sắp xếp từ A - Z</option>
                                                <option value="2" selected>Sắp xếp từ Z - A</option>
                                                <option value="3">Giá Tăng Dần</option>
                                                <option value="4">Giá Giảm Dần</option>
                                            </c:if>
                                            <c:if test="${optionSort == 3}">
                                                <option value="0">Mặc định</option>
                                                <option value="1">Sắp xếp từ A - Z</option>
                                                <option value="2">Sắp xếp từ Z - A</option>
                                                <option value="3" selected>Giá Tăng Dần</option>
                                                <option value="4">Giá Giảm Dần</option>
                                            </c:if>
                                            <c:if test="${optionSort == 4}">
                                                <option value="0">Mặc định</option>
                                                <option value="1">Sắp xếp từ A - Z</option>
                                                <option value="2">Sắp xếp từ Z - A</option>
                                                <option value="3">Giá Tăng Dần</option>
                                                <option value="4" selected>Giá Giảm Dần</option>
                                            </c:if>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                            <!-- product-select-box end -->
                        </div>
                        <!-- shop-top-bar end -->
                        <!-- shop-products-wrapper start -->
                        <div class="shop-products-wrapper">
                            <div class="tab-content">
                                <div id="grid-view" class="tab-pane fade" role="tabpanel">
                                    <div class="product-area shop-product-area">
                                        <div class="row">
                                            <c:forEach items="${listProductClient}" var="item">
                                                <div class="col-lg-4 col-md-4 col-sm-6 mt-40">
                                                    <!-- single-product-wrap start -->
                                                    <div class="single-product-wrap">
                                                        <div class="product-image">
                                                            <a href="productDetail/${item.getProductName().replaceAll(" ","-")}">
                                                                <img src="imageProduct/${item.getLargeImage()}" alt="Product Image">
                                                            </a>
                                                            <span class="sticker">New</span>
                                                        </div>
                                                        <div class="product_desc">
                                                            <div class="product_desc_info">
                                                                <div class="product-review">
                                                                    <h5 class="manufacturer">
                                                                        <a href="productDetail/${item.getProductName().replaceAll(" ","-")}">View Details</a>
                                                                    </h5>
                                                                </div>
                                                                <h4><a class="product_name" href="productDetail/${item.getProductName().replaceAll(" ","-")}">${item.getProductName()}</a></h4>
                                                                <div class="price-box">
                                                                    <span class="new-price">${item.getPrice()} đ</span>
                                                                </div>
                                                            </div>
                                                            <div class="add-actions">
                                                                <ul class="add-actions-link">
                                                                    <li class="add-cart active"><a href="shopping-cart.html">Add to cart</a></li>
                                                                    <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- single-product-wrap end -->
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div id="list-view" class="tab-pane fade product-list-view active show" role="tabpanel">
                                    <div class="row">

                                        <div class="col">
                                            <c:forEach items="${listProductClient}" var="item">
                                                <div class="row product-layout-list">

                                                    <div class="col-lg-3 col-md-5 ">
                                                        <div class="product-image">
                                                            <a href="productDetail?id=${item.getProductID()}">
                                                                <img src="imageProduct/${item.getLargeImage()}" alt="Product Image">
                                                            </a>
                                                            <span class="sticker">New</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-5 col-md-7">
                                                        <div class="product_desc">
                                                            <div class="product_desc_info">
                                                                <div class="product-review">
                                                                    <h5 class="manufacturer">
                                                                        <a href="productDetail?id=${item.getProductID()}">Graphic Corner</a>
                                                                    </h5>

                                                                </div>
                                                                <h4><a class="product_name" href="productDetail?id=${item.getProductID()}">${item.getProductName()}</a></h4>
                                                                <div class="price-box">
                                                                    <span class="new-price">${item.getPrice()} đ</span>
                                                                </div>
                                                                <p>${product.getDescription()}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <div class="shop-add-action mb-xs-30">
                                                            <ul class="add-actions-link">
                                                                <li class="add-cart"><a href="#">Add to cart</a></li>
                                                                <li class="wishlist"><a href="wishlist.html"><i class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                                <li><a class="quick-view" data-toggle="modal" data-target="#exampleModalCenter" href="#"><i class="fa fa-eye"></i>Quick view</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>

                                            </c:forEach>

                                        </div>

                                    </div>
                                </div>
                                <c:if test="${listProductClient.size() == 0}">
                                    <h3 class="text-center mt-4" style="color: red;font-weight: bold;border: none">Không tìm thấy sản phẩm</h3>
                                </c:if>

                                <c:if test="${listProductClient != null && !empty listProductClient}">
                                    <div class="paginatoin-area">
                                        <div class="row">

                                            <div class="col-lg-12 col-md-12">
                                                <ul class="pagination-box">
                                                    <c:if test="${page == 1}">
                                                        <li class="paginate_button page-item previous disabled" id="sampleTable_previous">                                                        
                                                            <p aria-controls="sampleTable" data-dt-idx="0" tabindex="0" class="page-link3"
                                                               style="border-radius: 0.25rem 0 0 0.25rem">Lùi</p>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${page != 1}">
                                                        <li class="paginate_button page-item previous disabled" id="sampleTable_previous">
                                                            <a onclick="setPage('${page-1}', '${num}', '${key}')" aria-controls="sampleTable" data-dt-idx="2" tabindex="0" class="page-link2"
                                                               style="border-radius: 0 0.25rem 0.25rem 0">Lùi</a> 
                                                        </li>
                                                    </c:if>
                                                    <c:forEach begin="1" end="${num}" var="i">
                                                        <c:if test="${page != null && i == page}">
                                                            <li class="paginate_button page-item active">
                                                                <p aria-controls="sampleTable" data-dt-idx="2" tabindex="0" class="page-link3"
                                                                   style="border-radius: 0 0.25rem 0.25rem 0">${i}</p>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${i != page}">
                                                            <c:if test="${i != page}">
                                                                <li class="paginate_button page-item next disabled" id="sampleTable_next">
                                                                    <a onclick="setPage('${i}', '${num}', '${key}')" aria-controls="sampleTable" data-dt-idx="2" tabindex="0" class="page-link2"
                                                                       style="border-radius: 0 0.25rem 0.25rem 0">${i}</a>  
                                                                </li>
                                                            </c:if>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${page == num}">                                                    
                                                        <li class="paginate_button page-item next disabled" id="sampleTable_next">
                                                            <p aria-controls="sampleTable" data-dt-idx="2" tabindex="0" class="page-link3"
                                                               style="border-radius: 0 0.25rem 0.25rem 0">Tiếp</p>
                                                        </li>
                                                    </c:if>       
                                                    <c:if test="${page != num}">
                                                        <li class="paginate_button page-item next disabled" id="sampleTable_next">
                                                            <a onclick="setPage('${page+1}', '${num}', '${key}')" aria-controls="sampleTable" data-dt-idx="2" tabindex="0" class="page-link2"
                                                               style="border-radius: 0 0.25rem 0.25rem 0">Tiếp</a>                                                      
                                                        </li>
                                                    </c:if>
                                                </ul>
                                            </div>

                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <!-- shop-products-wrapper end -->
                    </div>                    
                </div>
             
        </div> 
    </div>
     </form>                                   
    <!-- Body Wrapper End Here -->
    <!-- jQuery-V1.12.4 -->
    <script type="text/javascript">       
        
        function setOptionSort(){
            document.getElementById('categoryId').submit();
        }
        function setPage(page, num, key) {
            var friesBrand = document.getElementsByName('brands');
            var friesPrice = document.getElementsByName('prices');
            var friesCategoris = document.getElementsByName('categoris');
            var friesRams = document.getElementsByName('rams');
            var friesCPUs = document.getElementsByName('cpus');
            var checkSort = document.getElementById('optionSort'); 
            var url ;
            if(key!==null&&key!==""){
               url = "product?page=" + page + "&num=" + num + "&key=" + key+ "&optionSort=" + checkSort.value;
            }else{
                var checkSearch = document.getElementById('searchId');
                url = "product?page=" + page + "&num=" + num + "&key=" + checkSearch.value+ "&optionSort=" + checkSort.value;                
            }
            
            if (!friesBrand[0].checked) {
                for (var i = 1; i < friesBrand.length; i++) {
                    if (friesBrand[i].checked)
                        url += "&brands=" + i;
                }
            }
            if (!friesPrice[0].checked) {
                for (var i = 1; i < friesPrice.length; i++) {
                    if (friesPrice[i].checked)
                        url += "&prices=" + i;
                }
            }
            if (!friesCategoris[0].checked) {
                for (var i = 1; i < friesCategoris.length; i++) {
                    if (friesCategoris[i].checked)
                        url += "&categoris=" + i;
                }
            }
            if (!friesRams[0].checked) {
                for (var i = 1; i < friesRams.length; i++) {
                    if (friesRams[i].checked)
                        url += "&rams=" + i;
                }
            }
            if (!friesCPUs[0].checked) {
                for (var i = 1; i < friesCPUs.length; i++) {
                    if (friesCPUs[i].checked)
                        url += "&cpus=" + i;
                }
            }
            window.location = url;
        }


        function setCheckCategory(obj) {
            var friesBrand = document.getElementsByName('brands');
            var friesPrice = document.getElementsByName('prices');
            var friesCategoris = document.getElementsByName('categoris');
            var friesRams = document.getElementsByName('rams');
            var friesCPUs = document.getElementsByName('cpus');
            if (friesBrand !== null) {
                if ((obj.id == 'b0') && (friesBrand[0].checked))
                {
                    for (var i = 1; i < friesBrand.length; i++)
                        friesBrand[i].checked = false;
                } else {
                    for (var i = 1; i < friesBrand.length; i++) {
                        if (friesBrand[i].checked) {
                            friesBrand[0].checked = false;
                            break;
                        }
                    }
                }
            }

            if (friesPrice !== null) {
                if ((obj.id == 'p0') && (friesPrice[0].checked))
                {
                    for (var i = 1; i < friesPrice.length; i++)
                        friesPrice[i].checked = false;
                } else {
                    for (var i = 1; i < friesPrice.length; i++) {
                        if (friesPrice[i].checked) {
                            friesPrice[0].checked = false;
                            break;
                        }
                    }
                }

            }
            if (friesCategoris !== null) {
                if ((obj.id == 'c0') && (friesCategoris[0].checked))
                {
                    for (var i = 1; i < friesCategoris.length; i++)
                        friesCategoris[i].checked = false;
                } else {
                    for (var i = 1; i < friesCategoris.length; i++) {
                        if (friesCategoris[i].checked) {
                            friesCategoris[0].checked = false;
                            break;
                        }
                    }
                }

            }
            if (friesRams !== null) {
                if ((obj.id == 'r0') && (friesRams[0].checked))
                {
                    for (var i = 1; i < friesRams.length; i++)
                        friesRams[i].checked = false;
                } else {
                    for (var i = 1; i < friesRams.length; i++) {
                        if (friesRams[i].checked) {
                            friesRams[0].checked = false;
                            break;
                        }
                    }
                }

            }
            if (friesCPUs !== null) {
                if ((obj.id == 'cpu0') && (friesCPUs[0].checked))
                {
                    for (var i = 1; i < friesCPUs.length; i++)
                        friesCPUs[i].checked = false;
                } else {
                    for (var i = 1; i < friesCPUs.length; i++) {
                        if (friesCPUs[i].checked) {
                            friesCPUs[0].checked = false;
                            break;
                        }
                    }
                }

            }
            document.getElementById('categoryId').submit();
        }
    </script>
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

</body>

<!-- shop-list-left-sidebar31:48-->
</html>
