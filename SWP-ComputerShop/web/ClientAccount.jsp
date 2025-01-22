<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <head>
       
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
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
            .Choicefile {
                display: block;
                background: #14142B;
                border: 1px solid #fff;
                color: #fff;
                width: 150px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                padding: 5px 0px;
                border-radius: 5px;
                font-weight: 500;
                align-items: center;
                justify-content: center;
            }

            .Choicefile:hover {
                text-decoration: none;
                color: white;
            }

            #uploadfile,
            .removeimg {
                display: none;
            }

            #thumbbox {
                position: relative;
                width: 100%;
                margin-bottom: 20px;
            }

            .removeimg {
                height: 25px;
                position: absolute;
                background-repeat: no-repeat;
                top: 5px;
                left: 5px;
                background-size: 25px;
                width: 25px;
                /* border: 3px solid red; */
                border-radius: 50%;

            }

            .removeimg::before {
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
                content: '';
                border: 1px solid red;
                background: red;
                text-align: center;
                display: block;
                margin-top: 11px;
                transform: rotate(45deg);
            }

            .removeimg::after {
                /* color: #FFF; */
                /* background-color: #DC403B; */
                content: '';
                background: red;
                border: 1px solid red;
                text-align: center;
                display: block;
                transform: rotate(-45deg);
                margin-top: -2px;
            }
        </style>


        <script>
            function errorRole() {
                swal({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Bạn không có quyền truy cập vào trang này!!!'
                });
            }
            function readURL(input, thumbimage) {
                if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#thumbimage").attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                } else { // Sử dụng cho IE
                    $("#thumbimage").attr('src', input.value);

                }
                $("#thumbimage").show();
                $('.filename').text($("#uploadfile").val());
                $('.Choicefile').css('background', '#14142B');
                $('.Choicefile').css('cursor', 'default');
                $(".removeimg").show();
                $(".Choicefile").unbind('click');

            }
            $(document).ready(function () {
                $(".Choicefile").bind('click', function () {
                    $("#uploadfile").click();

                });
                $(".removeimg").click(function () {
                    $("#thumbimage").attr('src', '').hide();
                    $("#myfileupload").jsp('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
                    $(".removeimg").hide();
                    $(".Choicefile").bind('click', function () {
                        $("#uploadfile").click();
                    });
                    $('.Choicefile').css('background', '#14142B');
                    $('.Choicefile').css('cursor', 'pointer');
                    $(".filename").text("");
                });
            })
        </script>


        
        
        <!-- Navbar-->
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
        
    </header>
    <!-- Sidebar menu-->
   

    <main class="app-content">
<!--        <div class="app-title">
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><a href="addstaff">Chỉnh sửa thông tin</a></li>
            </ul>
        </div>-->
        <div class="row">
            <div class="col-md-12">

                <div class="tile">

                    <h3 class="tile-title">Chỉnh sửa thông tin</h3>
                    <form id="frm" method="post" action="updateUserClient" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-xl-4">
                                <!-- Profile picture card-->
                                <div class="card mb-4 mb-xl-0">
                                    <div class="card-header">Ảnh</div>
                                    <div class="card-body text-center">
                                        <!-- Profile picture image-->
                                        <img id="output" style="object-fit: cover;width: 315px;height: 315px;"
                                             class="img-account-profile rounded-circle mb-2"
                                             src="/SWP391_LapTop/image1/${acc.getImg()}" alt="">
                                        <!-- Profile picture help block-->
                                        <div class="small font-italic text-muted mb-4">Ảnh không vượt quá 500 KB</div>
                                        <!-- Profile picture upload button-->
                                        <label for="img" class="btn btn-primary" type="button">
                                            Tải ảnh
                                        </label>
                                        <input onchange="loadFile(event)" 
                                               id="img" style="display: none;visibility: none;" 
                                               type="file" name="img" accept=".jpg, .png, .webp">
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-8">
                                <!-- Account details card-->
                                <div class="card mb-4">
                                    <div class="card-header">Thông tin chi tiết</div>

                                    <!-- Form Row-->


                                    <input type="hidden" name="id" value="${User1.getUserID()}">

                                    <label class="control-label">Tên người dùng</label>
                                    <input name="name" class="form-control" type="text" value="${User1.getUserName()}">


                                    <label class="control-label">Địa chỉ</label>
                                    <input name="address" class="form-control" type="text" value="${User1.getAddress()}" >



                                    <label class="control-label">Số điện thoại</label>
                                    <input name="phone" class="form-control" type="text" value="${User1.getPhone()}">



                                    <label class="control-label">Email</label>
                                    <input name="email" class="form-control" type="text" value="${User1.getEmail()}" >




                                    <input type="hidden" name="page" value="${page}">
                                    <input type="hidden" name="num" value="${num}">
                                    <input type="hidden" name="entryperpage" value="${entryperpage}">
                                    <input type="hidden" name="check" value="${check}">
                                    <div>
                                        <h1>              </h1>
                                        <button class="btn btn-save" type="submit">Lưu lại</button>
                                        <a class="btn btn-cancel" href="/SWP391_LapTop/Home">Hủy bỏ</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </form>         
                </div>


            </div> 



        </div>


    </div>

</main>
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
                                                                    ${info.getContent()}
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
                                                                    ${cus.getContent()}
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
                                                                    ${getintouch.getContent()}
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
                                <script>
                                    var loadFile = function (event) {
                                        var image = document.getElementById("output");
                                        image.src = URL.createObjectURL(event.target.files[0]);
                                    };

                                    function Update() {
                                        swal({
                                            icon: 'success',
                                            text: "Cập nhật thành công"
                                        })
                                    }
                                </script>
                                <script src="js/jquery-3.2.1.min.js"></script>
                                <script src="js/popper.min.js"></script>
                                <script src="js/bootstrap.min.js"></script>
                                <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                                <script src="src/jquery.table2excel.js"></script>
                                <script src="js/main.js"></script>
                                <!-- The javascript plugin to display page loading on top-->
                                <script src="js/plugins/pace.min.js"></script>
                                <!-- Page specific javascripts-->
                                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
                                <!-- Data table plugin-->
                                <!--  <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
                                  <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
                                  <script type="text/javascript">$('#sampleTable').DataTable();</script>-->

                                </script>
                                <script src="js/jquery-3.2.1.min.js"></script>
                                <script src="js/popper.min.js"></script>
                                <script src="js/bootstrap.min.js"></script>
                                <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                                <script src="src/jquery.table2excel.js"></script>
                                <script src="js/main.js"></script>
                                <!-- The javascript plugin to display page loading on top-->
                                <script src="js/plugins/pace.min.js"></script>
                                <!-- Page specific javascripts-->
                                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
                                <!-- Data table plugin-->
                                <!--  <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
                                  <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
                                  <script type="text/javascript">$('#sampleTable').DataTable();</script>-->

                                </body>
                                </html>
