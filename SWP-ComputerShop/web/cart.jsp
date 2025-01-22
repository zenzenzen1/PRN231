<%-- 
    Document   : cart
    Created on : May 14, 2023, 9:24:51 PM
    Author     : Admin
--%>
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
        <title>Eshop - eCommerce HTML5 Template.</title>
        <base href="http://localhost:9999/SWP391_LapTop/"/>
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="images/favicon.png">
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
        <link rel="stylesheet" href="css/style_1.css">
        <link rel="stylesheet" href="css/responsive.css">
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
        <!-- Header -->
        <header class="header shop">
            <!-- Topbar -->
            <div class="topbar">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-12 col-12">
                            <!-- Top Left -->
                            <div class="top-left">
                                <ul class="list-main">
                                    <li><i class="ti-headphone-alt"></i> +060 (800) 801-582</li>
                                    <li><i class="ti-email"></i> support@shophub.com</li>
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
                                                        <a id="deleteInCart${count}" data-id="${cart.getCart()[cart.getCart().size()-count].getProduct().getProductID()}" onclick="deleteIt('${cart.getCart()[cart.getCart().size()-count].getProduct().getProductID()}', '${cart.getCart().size()}'); CartShow()" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                        <a class="cart-img" href="productDetail/${cart.getCart()[cart.getCart().size()-count].getProduct().getProductName().replaceAll(" ","-")}"><img src="imageProduct/${cart.getCart()[cart.getCart().size()-count].getProduct().getLargeImage()}" alt="#"></a>
                                                        <h4><a href="productDetail/${cart.getCart()[cart.getCart().size()-count].getProduct().getProductName().replaceAll(" ","-")}">${cart.getCart()[cart.getCart().size()-count].getProduct().getProductName()}</a></h4>
                                                        <p class="quantity">${cart.getCart()[cart.getCart().size()-count].getQuantity()}x - <span class="amount">${cart.getCart()[cart.getCart().size()-count].getPrice()} đ</span></p>
                                                    </li>
                                                </c:if>
                                                <c:if test="${cart.getCart().size()!=1}">
                                                    <c:forEach begin="0" end="1">
                                                        <li>
                                                            <a id="deleteInCart${count-1}" data-id="${cart.getCart()[cart.getCart().size()-count].getProduct().getProductID()}" onclick="deleteIt('${cart.getCart()[cart.getCart().size()-count].getProduct().getProductID()}', '${cart.getCart().size()}'); CartShow()" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
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
        <!--/ End Header -->

        <!-- Shopping Cart -->
        <c:if test="${cart.getCart() != null}">
            <div id="hasP" class="shopping-cart section">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <!-- Shopping Summery -->
                            <table class="table shopping-summery">
                                <thead>
                                    <tr class="main-hading">
                                        <th><input onclick="checkAllCB('${cart.getCart().size()}')" id="cb0" style="width: 20px; height: 20px;vertical-align: middle;" class="" type="checkbox" name="name"></th>
                                        <th>SẢN PHẨM</th>
                                        <th>TÊN</th>
                                        <th class="text-center">GIÁ</th>
                                        <th class="text-center">SỐ LƯỢNG</th>
                                        <th class="text-center">TỔNG</th> 
                                        <th class="text-center"><i class="ti-trash remove-icon"></i></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set value="0" var="count"/>
                                    <c:forEach items="${cart.getCart()}" var="c">
                                        <tr id="SP${c.getProduct().getProductID()}">
                                            <td><input value="${c.getProduct().getProductID()}" onclick="checkEachCB('${cart.getCart().size()}')" id="cb${count + 1}" style="width: 20px; height: 20px;vertical-align: middle;" type="checkbox" name="name"></td>
                                            <td class="image" data-title="Ảnh"><img src="imageProduct/${c.getProduct().getLargeImage()}" alt="#"></td>
                                            <td class="product-des" data-title="Tên">
                                                <p class="product-name"><a href="productDetail?id=${c.getProduct().getProductID()}">${c.getProduct().getProductName()}</a></p>
                                            </td>
                                            <c:if test="${c.getProduct().getDiscount() != 0}">
                                                <td class="price" data-title="Giá">
                                                    <span style="text-decoration: line-through; color: rgb(0 0 0 / 54%)">${c.getProduct().getPrice()} đ</span>
                                                    <span hidden id="pricediscount${count}">${c.getPricediscount()}</span>
                                                    <span>${c.getPricediscount()} đ</span>
                                                </td>
                                            </c:if>
                                            <c:if test="${c.getProduct().getDiscount() == 0}">
                                                <td class="price" data-title="Giá"> 
                                                    <span>${c.getProduct().getPrice()} đ</span>
                                                </td>
                                            </c:if>
                                            <td class="qty" data-title="Số lượng"><!-- Input Order -->
                                                <div class="input-group">
                                                    <div class="button minus">
                                                        <button  onclick="buy('${c.getProduct().getProductID()}', '${c.getPricediscount()}');CartShow()" type="button" class="btn btn-primary btn-number" data-type="minus" data-field="quant${count}">
                                                            <i class="ti-minus"></i>
                                                        </button>
                                                    </div>
                                                    <input onchange="buy('${c.getProduct().getProductID()}', '${c.getPricediscount()}');CartShow()" id="quan${c.getProduct().getProductID()}" type="text" name="quant${count}" class="input-number"  data-min="1" data-max="${c.getProduct().getQuantity()}" value="${c.getQuantity()}">
                                                    <div class="button plus">
                                                        <button onclick="buy('${c.getProduct().getProductID()}', '${c.getPricediscount()}');
                                                                CartShow()" type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant${count}">
                                                            <i class="ti-plus"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <!--/ End Input Order -->
                                            </td>
                                            <td class="total-amount" data-title="Tổng tiền">
                                                <span id="totalP${c.getProduct().getProductID()}">${c.getPrice()} đ</span>
                                                <span hidden id="hiddentotalP${c.getProduct().getProductID()}">${c.getPrice()}</span>
                                            </td>
                                            <td class="action" data-title="Thao tác">
                                                <a id="trashBtn${c.getProduct().getProductID()}" onclick="deleteIt('${c.getProduct().getProductID()}', '${cart.getCart().size()}');
                                                        CartShow()" style="cursor: pointer"><i class="ti-trash remove-icon"></i></a>
                                            </td>
                                        </tr>
                                        <c:set value="${count + 1}" var="count"/>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <!--/ End Shopping Summery -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <!-- Total Amount -->
                            <div class="total-amount">
                                <div class="row">
                                    <div class="col-lg-8 col-md-5 col-12">
                                        <a id="choseAll" onclick="checkAll('${cart.getCart().size()}')" style="color: white;cursor: pointer" class="btn">
                                            Chọn tất cả 
                                        </a>
                                        <a id="deleteBtn" onclick="deleteItemCB('${cart.getCart().size()}');CartShow()" style="color: white;cursor: pointer" class="btn">
                                            Xóa 
                                        </a>
                                    </div>
                                    <div class="col-lg-4 col-md-7 col-12">
                                        <div class="right">
                                            <ul>
                                                <li >Tổng tiền giỏ hàng<span id="subtotal">${totalCart} Đ</span></li>
                                                <li>Vận chuyển<span>Miễn phí</span></li>
                                                <li class="last">Tổng tiền thanh toán<span id="total">${totalCart} Đ</span><span hidden id="hiddentotal">${totalCart}</span></li>
                                            </ul>
                                            <div class="button5">
                                                <a href="checkout" class="btn">Thanh toán</a>
                                                <a href="product" class="btn">Tiếp tục mua sắm</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--/ End Total Amount -->
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <!--/ End Shopping Cart -->

        <!-- Shopping Cart No Product-->
        <c:if test="${cart.getCart() == null}">
            <div id="none" class="shopping-cart section" style="padding: 150px 0px">
                <div class="container">
                    <div class="text-center"><img style="width: 10%" src="image1/cart.png" alt="alt"/></div>
                    <div class="text-center mb-3" style="color: rgb(0 0 0 / 60%); font-weight: bold">Giỏ hàng của bạn còn trống</div>
                    <div class="button5 text-center">
                        <a href="product" class="btn" style="color: white">MUA NGAY</a>
                    </div>
                </div>
            </div>
        </c:if>
        <div id="none" class="shopping-cart section" style="display: none;padding: 150px 0px">
            <div class="container">
                <div class="text-center"><img style="width: 10%" src="image1/cart.png" alt="alt"/></div>
                <div class="text-center mb-3" style="color: rgb(0 0 0 / 60%); font-weight: bold">Giỏ hàng của bạn còn trống</div>
                <div class="button5 text-center">
                    <a href="product" class="btn" style="color: white">MUA NGAY</a>
                </div>
            </div>
        </div>
        <!-- End Cart No Product-->

        <!--Modal--> 
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="ti-close" aria-hidden="true"></span></button>
                    </div>
                    <div class="modal-body">
                        <div class="row no-gutters">
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                Product Slider 
                                <div class="product-gallery">
                                    <div class="quickview-slider-active">
                                        <div class="single-slider">
                                            <img src="images/modal1.jpg" alt="#">
                                        </div>
                                        <div class="single-slider">
                                            <img src="images/modal2.jpg" alt="#">
                                        </div>
                                        <div class="single-slider">
                                            <img src="images/modal3.jpg" alt="#">
                                        </div>
                                        <div class="single-slider">
                                            <img src="images/modal4.jpg" alt="#">
                                        </div>
                                    </div>
                                </div>
                                End Product slider 
                            </div>
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                <div class="quickview-content">
                                    <h2>Flared Shift Dress</h2>
                                    <div class="quickview-ratting-review">
                                        <div class="quickview-ratting-wrap">
                                            <div class="quickview-ratting">
                                                <i class="yellow fa fa-star"></i>
                                                <i class="yellow fa fa-star"></i>
                                                <i class="yellow fa fa-star"></i>
                                                <i class="yellow fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <a href="#"> (1 customer review)</a>
                                        </div>
                                        <div class="quickview-stock">
                                            <span><i class="fa fa-check-circle-o"></i> in stock</span>
                                        </div>
                                    </div>
                                    <h3>$29.00</h3>
                                    <div class="quickview-peragraph">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia iste laborum ad impedit pariatur esse optio tempora sint ullam autem deleniti nam in quos qui nemo ipsum numquam.</p>
                                    </div>
                                    <div class="size">
                                        <div class="row">
                                            <div class="col-lg-6 col-12">
                                                <h5 class="title">Size</h5>
                                                <select>
                                                    <option selected="selected">s</option>
                                                    <option>m</option>
                                                    <option>l</option>
                                                    <option>xl</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-6 col-12">
                                                <h5 class="title">Color</h5>
                                                <select>
                                                    <option selected="selected">orange</option>
                                                    <option>purple</option>
                                                    <option>black</option>
                                                    <option>pink</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="quantity">
                                        Input Order 
                                        <div class="input-group">
                                            <div class="button minus">
                                                <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                                    <i class="ti-minus"></i>
                                                </button>
                                            </div>
                                            <input type="text" name="quant[1]" class="input-number"  data-min="1" data-max="1000" value="1">
                                            <div class="button plus">
                                                <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
                                                    <i class="ti-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                        / End Input Order 
                                    </div>
                                    <div class="add-to-cart">
                                        <a href="#" class="btn">Add to cart</a>
                                        <a href="#" class="btn min"><i class="ti-heart"></i></a>
                                        <a href="#" class="btn min"><i class="fa fa-compress"></i></a>
                                    </div>
                                    <div class="default-social">
                                        <h4 class="share-now">Share:</h4>
                                        <ul>
                                            <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                                            <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                                            <li><a class="youtube" href="#"><i class="fa fa-pinterest-p"></i></a></li>
                                            <li><a class="dribbble" href="#"><i class="fa fa-google-plus"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal end--> 

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
            function checkAll(size) {
                if (!document.getElementById('cb0').checked) {
                    for (var i = 0; i <= parseInt(size); i++) {
                        let num = document.getElementById('cb' + i);
                        num.checked = true;
                    }
                } else {
                    for (var i = 0; i <= parseInt(size); i++) {
                        let num = document.getElementById('cb' + i);
                        num.checked = false;
                    }
                }
            }

            function checkAllCB(size) {
                if (document.getElementById('cb0').checked) {
                    for (var i = 0; i <= parseInt(size); i++) {
                        let num = document.getElementById('cb' + i);
                        num.checked = true;
                    }
                } else {
                    for (var i = 0; i <= parseInt(size); i++) {
                        let num = document.getElementById('cb' + i);
                        num.checked = false;
                    }
                }
            }

            function checkEachCB(size) {
                let check = false;
                for (var i = 1; i <= parseInt(size); i++) {
                    let num = document.getElementById('cb' + i);
                    if (i < parseInt(size) & num.checked) {
                        continue;
                    } else if (i === parseInt(size) & num.checked) {
                        check = true;
                    } else if (!num.checked) {
                        check = false;
                        break;
                    }
                }
                if (check === false) {
                    document.getElementById('cb0').checked = false;
                } else {
                    document.getElementById('cb0').checked = true;
                }
            }

            function deleteItemCB(size) {
                let txt = "";
                let temp = '';
                let sp = [];
                let totalP = [];
                let total = document.getElementById('total');
                let hiddentotal = document.getElementById('hiddentotal');
                let subtotal = document.getElementById('subtotal');
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
                        let t = document.getElementById('cb1');
                        document.getElementById('SP' + t.value).remove();
                        document.getElementById('hasP').style.display = "none";
                        document.getElementById('none').style.display = "block";
                        document.getElementById('sizeCart').innerHTML = 0;
                        return;
                    }
                    let c = 0;
                    console.log(id.length);
                    for (var i = 0; i < id.length; i++) {
                        if (document.getElementById('cb' + (i + 1)).checked) {
                            let t = document.getElementById('cb' + (i + 1));
                            sp[c] = document.getElementById('SP' + t.value);
                            totalP[c] = document.getElementById('hiddentotalP' + t.value);
                            id[i] = "";
                            sl[i] = "";
                            c++;
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
                    if (document.getElementById('cb0').checked) {
                        document.getElementById('hasP').style.display = "none";
                        document.getElementById('none').style.display = "block";
                        document.getElementById('sizeCart').innerHTML = 0;
                    }
                    let totalnew = parseFloat(hiddentotal.innerHTML.replaceAll(",", ""));
                    for (var i = 0; i < sp.length; i++) {
                        totalnew = totalnew - parseFloat(totalP[i].innerHTML.replaceAll(",", ""));
                        sp[i].remove();
                    }
                    c = 1;
                    for (var i = 1; i <= size; i++) {
                        if (document.getElementById('cb' + i) !== null & document.getElementById('cb' + i) !== undefined) {
                            document.getElementById('cb' + i).setAttribute('onclick', 'checkEachCB(' + (parseInt(size) - sp.length) + ')');
                            if (document.getElementById('cb' + i).id === ('cb' + c)) {
                                c++;
                                continue;
                            }
                            document.getElementById('cb' + i).id = 'cb' + c;
                            c++;
                        }
                    }
                    document.getElementById('choseAll').setAttribute('onclick', 'checkAll(' + (parseInt(size) - sp.length) + ')');
                    document.getElementById('cb0').setAttribute('onclick', 'checkAllCB(' + (parseInt(size) - sp.length) + ')');
                    document.getElementById('deleteBtn').setAttribute('onclick', 'deleteItemCB(' + (parseInt(size) - sp.length) + ')');
                    for (var i = 0; i < id.length; i++) {
                        if (id[i] === "") {
                            continue;
                        }
                        document.getElementById('trashBtn' + id[i]).setAttribute('onclick', 'deleteIt(' + id[i] + ',' + (parseInt(size) - sp.length) + ')');
                        if (document.getElementById('deleteInCart0').getAttribute("data-id") === id[i])
                            document.getElementById('deleteInCart0').setAttribute('onclick', 'deleteIt(' + id[i] + ',' + (parseInt(size) - sp.length) + ')');
                        if (document.getElementById('deleteInCart1') !== null && document.getElementById('deleteInCart1') !== undefined) {
                            if (document.getElementById('deleteInCart1').getAttribute("data-id") === id[i])
                                document.getElementById('deleteInCart1').setAttribute('onclick', 'deleteIt(' + id[i] + ',' + (parseInt(size) - sp.length) + ')');
                        }
                    }
                    total.innerHTML = totalnew.toLocaleString() + " Đ";
                    subtotal.innerHTML = totalnew.toLocaleString() + " Đ";
                    document.getElementById('sizeCart').innerHTML = count - sp.length;
                }
                Cookies.set('cart', temp, {expires: 7, path: '/SWP391_LapTop'});
            }

            function buy(idp, cost_raw) {
                let txt = "";
                let temp = '';
                let num = document.getElementById('quan' + idp);
                let cost = cost_raw.replaceAll(",", "");
                let totalcostP = document.getElementById('totalP' + idp);
                let total = document.getElementById('total');
                let subtotal = document.getElementById('subtotal');
                let sum = 0;
                if (Cookies.get('cart') !== undefined && Cookies.get('cart') !== null) {
                    txt += Cookies.get('cart');
                    Cookies.remove('cart');
                }
                let id = [];
                let sl = [];
                let j = 0;
                let count = 0;
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
                for (var i = 0; i < id.length; i++) {
                    if (parseInt(id[i]) === parseInt(idp)) {
                        sl[i] = num.value;
                        totalcostP.innerHTML = (parseFloat(num.value) * parseFloat(cost)).toLocaleString() + " đ";
                        break;
                    }
                }
                for (var i = 0; i < id.length; i++) {
                    let pricediscount_raw = document.getElementById('pricediscount' + i);
                    console.log(pricediscount_raw);
                    let pricediscount = pricediscount_raw.innerHTML.replaceAll(",", "");
                    if (temp === '') {
                        temp += id[i] + '-' + sl[i];
                    } else {
                        temp = temp + ':' + id[i] + '-' + sl[i];
                    }
                    sum += (parseFloat(sl[i]) * parseFloat(pricediscount));
                }
                total.innerHTML = sum.toLocaleString() + " Đ";
                subtotal.innerHTML = sum.toLocaleString() + " Đ";
                document.getElementById('sizeCart').innerHTML = count;
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

            function deleteIt(idp, sz) {
                let txt = "";
                let temp = '';
                let sp = document.getElementById('SP' + idp);
                let totalP = document.getElementById('hiddentotalP' + idp);
                let total = document.getElementById('total');
                let hiddentotal = document.getElementById('hiddentotal');
                let subtotal = document.getElementById('subtotal');
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
                        sp.remove();
                        document.getElementById('hasP').style.display = "none";
                        document.getElementById('none').style.display = "block";
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
                    total.innerHTML = (parseFloat(hiddentotal.innerHTML.replaceAll(",", "")) - parseFloat(totalP.innerHTML.replaceAll(",", ""))).toLocaleString() + " Đ";
                    subtotal.innerHTML = (parseFloat(hiddentotal.innerHTML.replaceAll(",", "")) - parseFloat(totalP.innerHTML.replaceAll(",", ""))).toLocaleString() + " Đ";
                    sp.remove();
                    let c = 1;
                    for (var i = 1; i <= parseInt(sz); i++) {
                        if (document.getElementById('cb' + i) !== null & document.getElementById('cb' + i) !== undefined) {
                            document.getElementById('cb' + i).setAttribute('onclick', 'checkEachCB(' + (parseInt(sz) - 1) + ')');
                            if (document.getElementById('cb' + i).id === ('cb' + c)) {
                                console.log("i2 = " + i);
                                c++;
                                continue;
                            }
                            document.getElementById('cb' + i).id = 'cb' + c;
                            c++;
                        }
                    }
                    for (var i = 0; i < id.length; i++) {
                        if (id[i] === "") {
                            continue;
                        }
                        document.getElementById('trashBtn' + id[i]).setAttribute('onclick', 'deleteIt(' + id[i] + ',' + (parseInt(sz) - 1) + ')');
                        if (document.getElementById('deleteInCart0').getAttribute("data-id") === id[i])
                            document.getElementById('deleteInCart0').setAttribute('onclick', 'deleteIt(' + id[i] + ',' + (parseInt(sz) - 1) + ')');
                        if (document.getElementById('deleteInCart1') !== null && document.getElementById('deleteInCart1') !== undefined) {
                            if (document.getElementById('deleteInCart1').getAttribute("data-id") === id[i])
                                document.getElementById('deleteInCart1').setAttribute('onclick', 'deleteIt(' + id[i] + ',' + (parseInt(sz) - 1) + ')');
                        }
                    }
                    document.getElementById('choseAll').setAttribute('onclick', 'checkAll(' + (parseInt(sz) - 1) + ')');
                    document.getElementById('cb0').setAttribute('onclick', 'checkAllCB(' + (parseInt(sz) - 1) + ')');
                    document.getElementById('deleteBtn').setAttribute('onclick', 'deleteItemCB(' + (parseInt(sz) - 1) + ')');
                    document.getElementById('sizeCart').innerHTML = count - 1;
                }
                Cookies.set('cart', temp, {expires: 7, path: '/SWP391_LapTop'});
            }

        </script>
        <!--End add to cart-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/3.0.1/js.cookie.min.js" 
                integrity="sha512-wT7uPE7tOP6w4o28u1DN775jYjHQApdBnib5Pho4RB0Pgd9y7eSkAV1BTqQydupYDB9GBhTcQQzyNMPMV3cAew==" 
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

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