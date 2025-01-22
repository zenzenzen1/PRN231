<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : guaranteeAddCf
    Created on : May 24, 2023, 1:56:29 PM
    Author     : vinh1
--%>

<!DOCTYPE html>
<html lang="en">
    <%@ page import="java.time.LocalDate" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>


    <head>
        <title>Thêm Bảo Hành | Quản trị Admin</title>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    </head>

    <body onload="time()" class="app sidebar-mini rtl">
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
                <li><a class="app-menu__item" href="adminstaff"><i class='app-menu__icon bx bx-user-voice'></i>
                        <span class="app-menu__label">Quản lý nhân viên</span></a></li>
                <li><a class="app-menu__item" href="/SWP391_LapTop/userAdmin"><i class='app-menu__icon bx bx-user'></i><span
                            class="app-menu__label">Quản lý khách hàng</span></a></li>
                <li><a class="app-menu__item" href="/SWP391_LapTop/productAdmin"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
                </li>
                <li><a class="app-menu__item" href="list-blog-admin"><i class='app-menu__icon bx bx-news'></i><span
                            class="app-menu__label">Quản lý tin tức</span></a></li>
                <li><a class="app-menu__item" href="ordermanager"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Quản lý đơn hàng</span></a></li>
                <li><a class="app-menu__item" href="guarantee"><i class='app-menu__icon bx bx-shield-alt-2'></i><span
                            class="app-menu__label">Quản lý bảo hành
                        </span></a></li>
                <li><a class="app-menu__item" href="logout?page=login.jsp"><i class='app-menu__icon bx bx-run'></i><span
                            class="app-menu__label">Đăng xuất</span></a></li>

            </ul>
        </aside>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item">Danh sách bảo hành</li>
                    <li class="breadcrumb-item"><a href="#">Thêm bảo hành </a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Xác nhận tạo mới bảo hành</h3>
                        <div class="tile-body">
                            <form class="row" action="guaranteeAddConfirm?&userID=${OrderInfo.getUserID()}&productID=${OrderInfo.getProductID()}&dateGuarantee=${OrderInfo.getGuarantee()}&adminName=${acc.getAdminName()}&seri=${OrderInfo.getSeri()}" method="post" enctype="multipart/form-data">
                                <div class="form-group  col-md-12">
                                    <h4>Mã Seri</h4>
                                    <input readonly="" class="form-control" placeholder="Mã Seri" value="${OrderInfo.getSeri()}">
                                </div>
                                <div class="form-group  col-md-6">
                                    <h4>Tên khách hàng</h4>
                                    <input readonly="" class="form-control" placeholder="Mô tả trạng thái" value="${OrderInfo.getUserName()}">
                                </div>
                                <div class="form-group  col-md-6">
                                    <h4>Emai</h4>
                                    <input readonly="" class="form-control" placeholder="Emai" value="${OrderInfo.getEmail()}">
                                </div>
                                <div class="form-group  col-md-6">
                                    <h4>Số điện thoại</h4>
                                    <input readonly="" class="form-control" placeholder="Số điện thoại" value="${OrderInfo.getPhone()}">
                                </div>
                                <div class="form-group  col-md-6">
                                    <h4>Tên sản phẩm</h4>
                                    <input readonly="" class="form-control" placeholder="Tên sản phẩm" value="${OrderInfo.getProductName()}">
                                </div>
                                <div class="form-group  col-md-6">
                                    <h4>Ngày mua</h4>
                                    <input readonly="" class="form-control" placeholder="Ngày mua" value="${OrderInfo.getOrderDate()}">
                                </div>
                                <div class="form-group  col-md-6">
                                    <h4>Ngày hết bảo hành</h4>
                                    <input readonly="" class="form-control" placeholder="Ngày hết bảo hành" value="${EndGuarantee}">
                                </div>                                
                                <div class="form-group  col-md-6">
                                    <label class="control-label">Ảnh Mô Tả</label>
                                    <input name="img" class="form-control" type="file" >
                                </div>
                                <div class="form-group  col-md-6">
                                    <label class="control-label">Tên người tạo</label>
                                    <input readonly="" class="form-control" placeholder="Tên người tạo" value="${acc.getAdminName()}">
                                </div>
                                <div class="form-group  col-md-12">
                                    <h4>Mô tả trạng thái</h4>
                                    <input type="text" class="form-control" placeholder="Mô tả trạng thái" name="Des_error" >
                                </div>
                                
                                <div class="form-group  col-md-12">                                    
                                    <h6 style="color: red">${errorGuaratee}</h6>                                
                                </div>
                                <div class="form-group  col-md-12">                                    
                                    <h6 style="color: red">${errorOrder}</h6>                                
                                </div>
                                <div class="form-group  col-md-12">                                    
                                    <h6 style="color: red">${errorOrder}</h6>                                
                                </div>
                                

                                <div class="form-group  col-md-12">
                                    <input class="btn btn-save" type="submit" value="Tạo đơn bảo hành">
                                    <a class="btn btn-cancel" href="guaranteeAdd">Nhập lại</a>
                                    <a class="btn btn-danger" href="guarantee">Hủy bỏ</a>
                                </div>
                            </form>
                        </div>

                    </div>
                    </main>
                    <!-- Essential javascripts for application to work-->
                    <script src="js/jquery-3.2.1.min.js"></script>
                    <script src="js/popper.min.js"></script>
                    <script src="js/bootstrap.min.js"></script>
                    <script src="js/main.js"></script>
                    <!-- The javascript plugin to display page loading on top-->
                    <script src="js/plugins/pace.min.js"></script>
                    </body>
                    </html>


