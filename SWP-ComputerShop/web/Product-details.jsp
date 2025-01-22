<%-- 
    Document   : Product-details
    Created on : May 20, 2023, 8:55:13 PM
    Author     : Admin
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Entity.Product" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Danh sách nhân viên | Quản trị Admin</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <style>


            .bodyIn {
                font-family: 'open sans';
                overflow-x: hidden;

            }

            img {
                max-width: 80%;
            }

            .preview {
                display: -webkit-box;
                display: -webkit-flex;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                -webkit-flex-direction: column;
                -ms-flex-direction: column;
                flex-direction: column;
            }
            @media screen and (max-width: 996px) {
                .preview {
                    margin-bottom: 20px;
                }
            }

            .preview-pic {
                -webkit-box-flex: 1;
                -webkit-flex-grow: 1;
                -ms-flex-positive: 1;
                flex-grow: 1;
            }

            .preview-thumbnail.nav-tabs {
                border: none;
                margin-top: 15px;
            }
            .preview-thumbnail.nav-tabs li {
                width: 18%;
                margin-right: 2.5%;
            }
            .preview-thumbnail.nav-tabs li img {
                max-width: 100%;
                display: block;
            }
            .preview-thumbnail.nav-tabs li a {
                padding: 0;
                margin: 0;
            }
            .preview-thumbnail.nav-tabs li:last-of-type {
                margin-right: 0;
            }

            .tab-content {
                overflow: hidden;
            }
            .tab-content img {
                width: 100%;
                -webkit-animation-name: opacity;
                animation-name: opacity;
                -webkit-animation-duration: .3s;
                animation-duration: .3s;
            }

            .card {
                margin-top: 50px;
                background: #eee;
                padding: 3em;
                line-height: 1.5em;
            }

            @media screen and (min-width: 997px) {
                .wrapper {
                    display: -webkit-box;
                    display: -webkit-flex;
                    display: -ms-flexbox;
                    display: flex;
                }
            }

            .details {
                display: -webkit-box;
                display: -webkit-flex;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                -webkit-flex-direction: column;
                -ms-flex-direction: column;
                flex-direction: column;
            }

            .colors {
                -webkit-box-flex: 1;
                -webkit-flex-grow: 1;
                -ms-flex-positive: 1;
                flex-grow: 1;
            }

            .product-title, .price, .sizes, .colors {
                text-transform: UPPERCASE;
                font-weight: bold;
            }

            .checked, .price span {
                color: #ff9f1a;
            }

            .product-title, .rating, .product-description, .price, .vote, .sizes {
                margin-bottom: 15px;
            }

            .product-title {
                margin-top: 0;
            }

            .size {
                margin-right: 10px;
            }
            .size:first-of-type {
                margin-left: 40px;
            }
            .inline-p {
                display: inline;
                margin: 0;
                font-size: smaller;
                font-weight: normal;

            }

            .color {
                display: inline-block;
                vertical-align: middle;
                margin-right: 10px;
                height: 2em;
                width: 2em;
                border-radius: 2px;
            }
            .color:first-of-type {
                margin-left: 20px;
            }

            .add-to-cart, .like {
                background: #ff9f1a;
                padding: 1.2em 1.5em;
                border: none;
                text-transform: UPPERCASE;
                font-weight: bold;
                color: #fff;
                -webkit-transition: background .3s ease;
                transition: background .3s ease;
            }
            .add-to-cart:hover, .like:hover {
                background: #b36800;
                color: #fff;
            }

            .not-available {
                text-align: center;
                line-height: 2em;
            }
            .not-available:before {
                font-family: fontawesome;
                content: "\f00d";
                color: #fff;
            }

            .orange {
                background: #ff9f1a;
            }

            .green {
                background: #85ad00;
            }

            .blue {
                background: #0076ad;
            }

            .tooltip-inner {
                padding: 1.3em;
            }

            @-webkit-keyframes opacity {
                0% {
                    opacity: 0;
                    -webkit-transform: scale(3);
                    transform: scale(3);
                }
                100% {
                    opacity: 1;
                    -webkit-transform: scale(1);
                    transform: scale(1);
                }
            }

            @keyframes opacity {
                0% {
                    opacity: 0;
                    -webkit-transform: scale(3);
                    transform: scale(3);
                }
                100% {
                    opacity: 1;
                    -webkit-transform: scale(1);
                    transform: scale(1);
                }
            }

            /*# sourceMappingURL=style.css.map */
        </style>

    </head>
    <c:if test="${errorRole != null}">
        <c:set var="errorRole" value="${null}" scope="session"/>
        <body class="app sidebar-mini rtl" onload="errorRole();time();">
        </c:if>
        <c:if test="${errorRole == null}">
        <body class="app sidebar-mini rtl" onload="time()">
        </c:if>
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">


                <!-- User Menu-->
                <li><a class="app-nav__item" href="logout?page=login.jsp"><i class='bx bx-log-out bx-rotate-180'></i> </a>


                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="image1/${acc.getImg()}" width="30px"
                                                alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>${acc.getAdminName()}</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
                    <div>
                        <form action="adminaccount">
                            <input type="hidden" name="id" value="${acc.getAdminID()}">
                            <button type="submit" class="btn btn-primary mt-2" name="btno" value="0">Thay đổi</button>
                        </form>
                    </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item haha" href="AdminHome.jsp"></i><i class='app-menu__icon bx bxs-home' ></i>
                        <span class="app-menu__label">Trang chủ Home</span></a></li>
                <c:if test="${acc.getRoleID() == 1}">
                    <li><a class="app-menu__item" href="adminstaff"><i class='app-menu__icon bx bx-user-voice'></i>
                            <span class="app-menu__label">Quản lý nhân viên</span></a></li>
                    <li><a class="app-menu__item" href="/SWP391_LapTop/userAdmin"><i class='app-menu__icon bx bx-user'></i><span
                                class="app-menu__label">Quản lý khách hàng</span></a></li>
                    <li><a class="app-menu__item" href="/SWP391_LapTop/productAdmin"><i
                                class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
                    </li>
                    <li><a class="app-menu__item" href="list-blog-admin"><i class='app-menu__icon bx bx-news'></i><span
                                class="app-menu__label">Quản lý tin tức</span></a></li>
                    <li><a class="app-menu__item" href="ordermanager?order=1"><i class='app-menu__icon bx bx-task'></i><span
                                class="app-menu__label">Quản lý đơn hàng</span></a></li>
                    <li><a class="app-menu__item" href="guarantee"><i class='app-menu__icon bx bx-shield-alt-2'></i><span
                                class="app-menu__label">Quản lý bảo hành
                            </span></a></li>
                </c:if>
                <c:if test="${acc.getRoleID() == 2}">
                    <li><a class="app-menu__item" href="/SWP391_LapTop/addblog">
                            <i class='app-menu__icon bx bx-add-to-queue'></i><span class="app-menu__label">Tạo Blog Mới</span></a>
                    </li>
                    <li><a class="app-menu__item" href="list-blog-admin"><i class='app-menu__icon bx bx-news'></i><span
                                class="app-menu__label">Quản lý tin tức</span></a></li>
                </c:if>
                <c:if test="${acc.getRoleID() == 3}">
                    <li><a class="app-menu__item" href="/SWP391_LapTop/addProductAdmin">
                            <i class='app-menu__icon bx bx-add-to-queue'></i><span class="app-menu__label">Tạo mới sản phẩm</span></a>
                    </li>
                    <li><a class="app-menu__item" href="/SWP391_LapTop/productAdmin">
                            <i class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
                    </li>
                    <li><a class="app-menu__item" href="/SWP391_LapTop/listDelete">
                            <i class='app-menu__icon bx bx-trash'></i><span class="app-menu__label">Sản phẩm đã xóa</span></a>
                    </li>
                </c:if>
                <c:if test="${acc.getRoleID() == 4}">
                    <li><a class="app-menu__item" href="ordermanager?order=1"><i class='app-menu__icon bx bx-add-to-queue'></i><span
                                class="app-menu__label">Tạo mới đơn hàng</span></a></li>
                    <li><a class="app-menu__item" href="ordermanager?order=1"><i class='app-menu__icon bx bx-stopwatch'></i><span
                                class="app-menu__label">Đơn hàng đang xử lý</span></a></li>
                    <li><a class="app-menu__item" href="ordermanager?order=2"><i class='app-menu__icon bx bxs-truck'></i><span
                                class="app-menu__label">Đơn hàng đang giao</span></a></li>
                    <li><a class="app-menu__item" href="ordermanager?order=3"><i class='app-menu__icon bx bx-task'></i><span
                                class="app-menu__label">Đơn hàng đã giao</span></a></li>
                    <li><a class="app-menu__item" href="ordermanager?order=4"><i class='app-menu__icon bx bx-task-x'></i><span
                                class="app-menu__label">Đơn hàng đã hủy</span></a></li>
                </c:if>
                <c:if test="${acc.getRoleID() == 5}">
                    <li><a class="app-menu__item" href="/SWP391_LapTop/userAdmin"><i class='app-menu__icon bx bx-user'></i><span
                                class="app-menu__label">Quản lý khách hàng</span></a></li>
                    <li><a class="app-menu__item" href="/SWP391_LapTop/listUserDelete">
                            <i class='app-menu__icon bx bx-trash'></i><span class="app-menu__label">Người dùng đã xóa</span></a>
                    </li>
                </c:if>
                <c:if test="${acc.getRoleID() == 6}">
                    <li><a class="app-menu__item" href="/SWP391_LapTop/guaranteeAdd">
                            <i class='app-menu__icon bx bx-add-to-queue'></i><span class="app-menu__label">Tạo mới bảo hành</span></a>
                    </li>
                    <li><a class="app-menu__item" href="guarantee"><i class='app-menu__icon bx bx-shield-alt-2'></i><span
                                class="app-menu__label">Quản lý bảo hành
                    </span></a></li>
                </c:if>
                <li><a class="app-menu__item" href="logout?page=login.jsp"><i class='app-menu__icon bx bx-run'></i><span
                            class="app-menu__label">Đăng xuất</span></a></li>

            </ul>
        </aside>
        <main class="app-content">
            <div class="bodyIn">
                <div class="container">
                    <div class="card">
                        <div class="container-fliud">
                            <div class="wrapper row">
                                <div class="preview col-md-6">
                                    <div id="carousel" class="carousel slide" data-ride="carousel">
                                        <!-- Indicators -->
                                        <ol class="carousel-indicators">
                                            <c:forEach items="${product.getImg()}" var="image" varStatus="loop">
                                                <li data-target="#carousel" data-slide-to="${loop.index}" class="${loop.index == 0 ? 'active' : ''}"></li>
                                                </c:forEach>
                                        </ol>

                                        <!-- Slides -->
                                        <div class="carousel-inner">
                                            <c:forEach items="${product.getImg()}" var="image" varStatus="loop">
                                                <div class="item ${loop.index == 0 ? 'active' : ''}">
                                                    <img src="imageProduct/${image}" alt="Image ${loop.index + 1}">
                                                </div>
                                            </c:forEach>
                                        </div>

                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#carousel" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left"></span>
                                        </a>
                                        <a class="right carousel-control" href="#carousel" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right"></span>
                                        </a>
                                    </div>
                                </div>
                                <div class="details col-md-6">

                                    <h3 class="product-title">Tên sản phẩm</h3>
                                    <p>${product.getProductName()}<p>
                                    <h4 class="product-title">Mô tả</h4>
                                    <p class="product-description">${product.getDescription()}</p>
                                    <h4 class="price">Giá bán: <span>${product.getPrice()} </span></h4>
                                    <h4 class="price">Thương hiệu: <p class="inline-p">${product.getBrandName()}</p></h4>
                                    <h4 class="price">Loại sản phẩm: <p class="inline-p">${product.getCategoryName()}</p></h4>
                                    <h4 class="price">Số lượng: <p class="inline-p">${product.getQuantity()} cái</p></h4>
                                    <h4 class="price">Người tạo: <p class="inline-p">${product.getCreatedBy()}</p> Ngày tạo: <p class="inline-p">${product.getCreatedDate()}</p></h4>
                                    <h4 class="price">Người sửa đổi: <p class="inline-p">${product.getModifiedBy()}</p> Ngày sửa đổi: <p class="inline-p">${product.getModifiedDate()}</p></h4>
                                    <h4 class="price">Bảo hành: <p class="inline-p"> ${product.getGuarantee()} tháng</p></h4>
                                    <div class="action">

                                        <c:choose>
                                            <c:when test="${showDeleteButton}">
                                                <button class="like btn btn-default" type="button" title="Sửa" id="show-emp" data-toggle="modal"

                                                        data-target="#ModalUP" onclick="updateProduct('${product.getProductID()}', '0')">Chỉnh sửa</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="like btn btn-default" type="button" title="Sửa" id="show-emp" data-toggle="modal"

                                                        data-target="#ModalUP" onclick="updateProduct('${product.getProductID()}', '1')">Chỉnh sửa</button>
                                            </c:otherwise>     
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${showDeleteButton}">
                                                <button class="add-to-cart btn btn-default trash" type="button" data-page ="${param.page}"
                                                        data-num ="${param.num}" data-key ="${param.key}" data-entryperpage ="${param.entryperpage}"
                                                        onclick="myFunction(this)" data-id="${product.getProductID()}">Xóa
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <!-- Không hiển thị nút xóa -->
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>     

<!-- Essential javascripts for application to work-->
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
<!--        <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>-->
<!--        <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>-->
<script type="text/javascript">
                                                            $('#sampleTable').DataTable();
                                                            //Thời Gian
                                                            function time() {
                                                                var today = new Date();
                                                                var weekday = new Array(7);
                                                                weekday[0] = "Chủ Nhật";
                                                                weekday[1] = "Thứ Hai";
                                                                weekday[2] = "Thứ Ba";
                                                                weekday[3] = "Thứ Tư";
                                                                weekday[4] = "Thứ Năm";
                                                                weekday[5] = "Thứ Sáu";
                                                                weekday[6] = "Thứ Bảy";
                                                                var day = weekday[today.getDay()];
                                                                var dd = today.getDate();
                                                                var mm = today.getMonth() + 1;
                                                                var yyyy = today.getFullYear();
                                                                var h = today.getHours();
                                                                var m = today.getMinutes();
                                                                var s = today.getSeconds();
                                                                m = checkTime(m);
                                                                s = checkTime(s);
                                                                nowTime = h + " giờ " + m + " phút " + s + " giây";
                                                                if (dd < 10) {
                                                                    dd = '0' + dd
                                                                }
                                                                if (mm < 10) {
                                                                    mm = '0' + mm
                                                                }
                                                                today = day + ', ' + dd + '/' + mm + '/' + yyyy;
                                                                tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                                                                        '</span>';
                                                                document.getElementById("clock").innerHTML = tmp;
                                                                clocktime = setTimeout("time()", "1000", "Javascript");
                                                                function checkTime(i) {
                                                                    if (i < 10) {
                                                                        i = "0" + i;
                                                                    }
                                                                    return i;
                                                                }
                                                            }

</script>
<script>
    function submit(page, num, key) {
        var entryperpage = document.getElementById('entryperpage');
        window.location.href = "/SWP391_LapTop/productAdmin?entryperpage=" + entryperpage.value + "&num=" + num + "&key=" + key;

    }
    jQuery(function () {
        jQuery(".trash").click(function () {
            var productId = $(this).data("id"); // Lấy ID sản phẩm từ thuộc tính data-id của nút trash
            var page = $(this).data("page");
            var num = $(this).data("num");
            var key = $(this).data("key");
            var entryperpage = $(this).data("entryperpage");
            swal({
                title: "Cảnh báo",
                text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
                buttons: ["Hủy bỏ", "Đồng ý"],
            })
                    .then((willDelete) => {
                        if (willDelete) {
                            // Chuyển hướng URL với ID sản phẩm 
                            window.location.href = "/SWP391_LapTop/deleteProduct?id=" + productId + "&page=" + page + "&num=" + num + "&key=" + key + "&entryperpage" + entryperpage;
                        }
                    });
        });
    });
    oTable = $('#sampleTable').dataTable();
    $('#all').click(function (e)
    {
        $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
        e.stopImmediatePropagation();
    });
</script>

<script>
    function updateProduct(productId, check)
    {
        // Chuyển hướng sang URL mới với productId
        window.location.href = "/SWP391_LapTop/updateProduct?id=" + productId + "&check=" + check;
    }
    function errorRole() {
        swal({
            icon: 'error',
            title: 'Oops...',
            text: 'Bạn không có quyền truy cập vào trang này!!!'
        });
    }
</script>

</body>
</html>

