<!DOCTYPE html>
<html lang="en">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="Entity.Product" %>

    <%@page import="Entity.Category" %>

    <head>
        <title>Danh sách nhân viên | Quản trị Admin</title>
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
        <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>

        <style>
            .container{
                margin-bottom: 30px;
            }
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
            <ul class="app-menu" id="menu_info">
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
                    <li><a class="app-menu__item" href="tableaddorder"><i class='app-menu__icon bx bx-add-to-queue'></i><span
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
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách sản phẩm</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">

                                    <a class="btn btn-add btn-sm" href="/SWP391_LapTop/addProductAdmin" title="Thêm"><i class="fas fa-plus"></i>
                                        Tạo mới sản phẩm</a>
                                </div>
                                <div class="col-sm-2">

                                    <a class="btn btn-add btn-sm" href="/SWP391_LapTop/listDelete" title="Thêm"><i class="fas fa-trash-alt"></i>
                                        Danh sách sản phẩm đã xóa</a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-excel btn-sm" href="" title="In"><i class="fas fa-file-excel"></i> Xuất Excel</a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm pdf-file" type="button" title="In" onclick="myFunction(this)"><i
                                            class="fas fa-file-pdf"></i> Xuất PDF</a>
                                </div>
                            </div>

                            <div class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                <!--Danh muc va tim kiem-->
                                <div class="row">
                                    <div class="col-sm-12 col-md-6">
                                        <div class="dataTables_length" id="sampleTable_length">
                                            <c:if test="${entryperpage == 2}">
                                                <label class="entry_search">Hiện 
                                                    <select name="entryperpage" id="entryperpage" onchange="product('${page}', '${num}', '${key}')"
                                                            aria-controls="sampleTable" 
                                                            class="form-control form-control-sm entry_search1 submit">
                                                        <option value="2" selected>2</option>
                                                        <option value="5">5</option>
                                                        <option value="10">10</option>
                                                        <option value="25">25</option>
                                                        <option value="50">50</option>
                                                        <option value="100">100</option>
                                                    </select> danh mục
                                                </label>
                                            </c:if>
                                            <c:if test="${entryperpage == 5}">
                                                <label class="entry_search">Hiện 
                                                    <select name="entryperpage" id="entryperpage" onchange="product('${page}', '${num}', '${key}')"
                                                            aria-controls="sampleTable" 
                                                            class="form-control form-control-sm entry_search1 submit">
                                                        <option value="2">2</option>
                                                        <option value="5" selected>5</option>
                                                        <option value="10">10</option>
                                                        <option value="25">25</option>
                                                        <option value="50">50</option>
                                                        <option value="100">100</option>
                                                    </select> danh mục
                                                </label>
                                            </c:if>
                                            <c:if test="${entryperpage == 10}">
                                                <label class="entry_search">Hiện 
                                                    <select name="entryperpage" id="entryperpage" onchange="product('${page}', '${num}', '${key}')"
                                                            aria-controls="sampleTable" class="form-control form-control-sm entry_search1 submit">
                                                        <option value="2">2</option>
                                                        <option value="5">5</option>
                                                        <option value="10" selected>10</option>
                                                        <option value="25">25</option>
                                                        <option value="50">50</option>
                                                        <option value="100">100</option>
                                                    </select> danh mục
                                                </label>
                                            </c:if>
                                            <c:if test="${entryperpage == 25}">
                                                <label class="entry_search">Hiện 
                                                    <select name="entryperpage" id="entryperpage" onchange="product('${page}', '${num}', '${key}')"
                                                            aria-controls="sampleTable" class="form-control form-control-sm entry_search1 submit">
                                                        <option value="2">2</option>
                                                        <option value="5">5</option>
                                                        <option value="10">10</option>
                                                        <option value="25" selected>25</option>
                                                        <option value="50">50</option>
                                                        <option value="100">100</option>
                                                    </select> danh mục
                                                </label>
                                            </c:if>
                                            <c:if test="${entryperpage == 50}">
                                                <label class="entry_search">Hiện 
                                                    <select name="entryperpage" id="entryperpage" onchange="product('${page}', '${num}', '${key}')" 
                                                            aria-controls="sampleTable" class="form-control form-control-sm entry_search1 submit">
                                                        <option value="2">2</option>
                                                        <option value="5">5</option>
                                                        <option value="10">10</option>
                                                        <option value="25">25</option>
                                                        <option value="50" selected>50</option>
                                                        <option value="100">100</option>
                                                    </select> danh mục
                                                </label>
                                            </c:if>
                                            <c:if test="${entryperpage == 100}">
                                                <label class="entry_search">Hiện 
                                                    <select name="entryperpage" id="entryperpage" 
                                                            onchange="product('${page}', '${num}', '${key}')" aria-controls="sampleTable" 
                                                            class="form-control form-control-sm entry_search1 submit">
                                                        <option value="2">2</option>
                                                        <option value="5">5</option>
                                                        <option value="10">10</option>
                                                        <option value="25">25</option>
                                                        <option value="50">50</option>
                                                        <option value="100" selected>100</option>
                                                    </select> danh mục
                                                </label>
                                            </c:if>

                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-6">
                                        <form id="frm" action="productAdmin"> 
                                            <div class="input-group mb-3">
                                                <input type="hidden" name="entryperpage" value="${entryperpage}">
                                                <input type="hidden" name="order" value="2">
                                                <input name="key" type="text" class="form-control input-text" placeholder="Nhập tên sản phẩm hoặc tên danh mục hoặc mã sản phẩm" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                                <div style="z-index: 0" class="input-group-append">
                                                    <button class="btn btn-outline-warning btn-lg" type="submit"><i class="fa fa-search"></i></button>
                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                </div>

                                <!--End Danh muc va tim kiem-->
                                <form method="post" action="deleteCheckbox">

                                    <button type="button" id="deleteSelected" data-page ="${page}"
                                            data-num ="${num}" data-key ="${key}" data-entryperpage ="${entryperpage}"  class="btn btn-primary">Xóa đã chọn</button>

                                    <a id="deleteAll" data-page ="${page}" data-size="${size}"
                                       data-num ="${num}" data-key ="${key}" data-entryperpage ="${entryperpage}" class="btn btn-primary">Xóa tất cả</a>

                                    <table class="table table-hover table-bordered table-responsive"  id="sampleTable">
                                        <thead>
                                            <tr>
                                                <th style="width : 5%">Tick để xóa</th>
                                                <th style="width : 5%">Mã sản phẩm</th>
                                                <th style="width : 20%">Tên sản phẩm</th>
                                                <th style="width : 9%">Ảnh</th>
                                                <th style="width : 5%">Số lượng</th>
                                                <th style="width : 9%">Tình trạng</th>
                                                <th style="width : 9%">Giá tiền</th>
                                                <th style="width : 9%">Bảo hành</th>
                                                <th style="width : 9%">Tài liệu</th>
                                                <th style="width : 8%">Thời gian bảo hành</th>
                                                <th>Chức năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${data}" var="item">

                                                <tr>
                                                    <td width="10"><input type="checkbox" name="checkBox" value="${item.getProductID()}"></td>
                                                    <td>${item.getProductID()}</td>
                                                    <td>${item.getProductName()}</td>
                                                    <td><img src="imageProduct/${item.getLargeImage()}" alt="" width="100px;"></td>
                                                    <td>${item.getQuantity()}</td>


                                                    <c:choose>
                                                        <c:when test="${item.getQuantity() > 5}">
                                                            <td><span class="badge bg-success">Còn hàng</span></td>
                                                        </c:when>
                                                        <c:when test="${item.getQuantity() > 0}">
                                                            <td><span class="badge bg-warning">Sắp hết hàng</span></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><span class="badge bg-danger">Hết hàng</span></td>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <td>${item.getPrice()}</td>



                                     
                                                <c:choose>
                                                    <c:when test="${acc.getRoleID()== 1}">
                                                        <td><span style="color: red;">Số lượng:</span> <a style="color: red;" href="guarantee?id=${item.getProductID()}">${item.getNumberGua()}</a></td>
                                                        </c:when>

                                                    <c:otherwise>
                                                        <td>${item.getNumberGua()}</td>
                                                    </c:otherwise>
                                                </c:choose>


                                                <td><a style="color: blue;" href="FileProduct/${item.getFile()}" download="${item.getFile()}">${item.getFile()}</a></td>
                                                <td>${item.getGuarantee()} tháng</td>

                                                <td><button data-page ="${page}"
                                                            data-num ="${num}" data-key ="${key}" data-entryperpage ="${entryperpage}" class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                                            onclick="myFunction(this)" data-id="${item.getProductID()}"><i class="fas fa-trash-alt"></i> 
                                                    </button>
                                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"

                                                            data-target="#ModalUP" onclick="updateProduct('${item.getProductID()}', '${page}', '${num}', '${key}', '${entryperpage}')"><i class="fas fa-edit"></i></button>


                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>

                                </table>
                            </form>
                            <!--Phan trang-->
                            <div class="row">
                                <c:if test="${size == 0}">
                                    <div class="text-center" style="text-align: center; margin: auto">
                                        <span>Không tìm thấy sản phẩm</span>
                                    </div>
                                </c:if>
                                <c:if test="${size != 0}">
                                    <div class="col-sm-12 col-md-5">
                                        <div class="dataTables_info" style="padding-top: 11.9px;" role="status" aria-live="polite">
                                            <c:if test="${start == 0}">
                                                Hiện ${start + 1} đến ${end} của ${entryperpage} danh mục
                                            </c:if>
                                            <c:if test="${start != 0}">
                                                Hiện ${start} đến ${end-1} của ${entryperpage} danh mục
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-7">
                                        <div class="dataTables_paginate paging_simple_numbers" id="sampleTable_paginate">
                                            <ul class="pagination1">
                                                <c:if test="${page == 1}">
                                                    <li class="paginate_button page-item previous disabled" id="sampleTable_previous">
                                                        <p aria-controls="sampleTable" data-dt-idx="0" tabindex="0" class="page-link3"
                                                           style="border-radius: 0.25rem 0 0 0.25rem">Lùi</p>
                                                    </li>
                                                </c:if>
                                                <c:if test="${page != 1}">
                                                    <li class="paginate_button page-item previous disabled" id="sampleTable_previous">
                                                        <a href="/SWP391_LapTop/productAdmin?page=${page-1}&key=${key}&entryperpage=${entryperpage}&num= ${num}" 
                                                           aria-controls="sampleTable" data-dt-idx="0" tabindex="0" class="page-link2"
                                                           style="border-radius: 0.25rem 0 0 0.25rem">Lùi</a>
                                                    </li>
                                                </c:if>
                                                <c:forEach begin="1" end="${num}" var="i">
                                                    <c:if test="${page != null && i == page}">
                                                        <li class="paginate_button page-item active">
                                                            <p aria-controls="sampleTable" data-dt-idx="1" tabindex="0" class="page-link1">${i}</p>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${i != page}">
                                                        <li class="paginate_button page-item active">
                                                            <a href="/SWP391_LapTop/productAdmin?page=${i}&key=${key}&entryperpage=${entryperpage}&num= ${num}"
                                                               aria-controls="sampleTable" data-dt-idx="1" tabindex="0" class="page-link">${i}</a>
                                                        </li>
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
                                                        <a href="/SWP391_LapTop/productAdmin?page=${page+1}&key=${key}&entryperpage=${entryperpage}&num= ${num}"
                                                           aria-controls="sampleTable" data-dt-idx="2" tabindex="0" class="page-link2"
                                                           style="border-radius: 0 0.25rem 0.25rem 0">Tiếp</a>
                                                    </li>
                                                </c:if>
                                            </ul>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                            <!--End Phan trang-->

                        </div>

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
                                                                function errorRole() {
                                                                    swal({
                                                                        icon: 'error',
                                                                        title: 'Oops...',
                                                                        text: 'Bạn không có quyền truy cập vào trang này!!!'
                                                                    });
                                                                }
                        </script>

                        <script>
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
                                                    window.location.href = "/SWP391_LapTop/deleteProduct?id=" + productId + "&page=" + page + "&num=" + num + "&key=" + key + "&entryperpage=" + entryperpage;
                                                }
                                            });
                                });
                            });
                            //                                oTable = $('#sampleTable').dataTable();
                            //                                $('#all').click(function (e)
                            //                                {
                            //                                    $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
                            //                                    e.stopImmediatePropagation();
                            //                                });
                        </script>

                        <script>
                            function updateProduct(productId, page, num, key, entryperpage)
                            {
                                // Chuyển hướng sang URL mới với productId
                                window.location.href = "/SWP391_LapTop/updateProduct?id=" + productId + "&page=" + page + "&num=" + num + "&key=" + key + "&entryperpage=" + entryperpage + "&check=0";
                            }

                        </script>
                        <script>
                            $(function () {
                                $("#deleteSelected").click(function () {
                                    var selectedProducts = [];
                                    var page = $(this).data("page");
                                    var num = $(this).data("num");
                                    var key = $(this).data("key");
                                    var entryperpage = $(this).data("entryperpage");
                                    // Lặp qua tất cả các checkbox đã được chọn
                                    $("#sampleTable tbody :checkbox:checked").each(function () {
                                        var productId = $(this).val(); // Lấy ID sản phẩm từ giá trị của checkbox
                                        selectedProducts.push(productId); // Thêm ID sản phẩm vào danh sách selectedProducts
                                    });

                                    if (selectedProducts.length > 0) {
                                        swal({
                                            title: "Cảnh báo",
                                            text: "Bạn có chắc chắn muốn xóa các sản phẩm đã chọn?",
                                            buttons: ["Hủy bỏ", "Đồng ý"],
                                        }).then(function (willDelete) {
                                            if (willDelete) {
                                                // Chuyển hướng URL với danh sách các ID sản phẩm
                                                window.location.href = "/SWP391_LapTop/deleteCheckbox?ids=" + selectedProducts.join(",") + "&delete=0" + "&page=" + page + "&num=" + num + "&key=" + key + "&entryperpage=" + entryperpage;
                                            }
                                        });
                                    } else {
                                        swal("Cảnh báo", "Vui lòng chọn ít nhất một sản phẩm để xóa.", "warning");
                                    }
                                });
                            });
                        </script>
                        <script>

                            document.getElementById("deleteAll").addEventListener("click", function () {
                                // Lấy các thuộc tính từ thẻ <a>
                                var page = this.getAttribute("data-page");
                                var num = this.getAttribute("data-num");
                                var key = this.getAttribute("data-key");
                                var entryperpage = this.getAttribute("data-entryperpage");
                                var size = this.getAttribute("data-size");
                                window.console.log(size);
                                // Kiểm tra danh sách dữ liệu có sản phẩm hay không
                                window.console.log("Test ngoai");
                                if (size > 0) {
                                    window.console.log("Test trong");
                                    swal({
                                        title: "Cảnh báo",
                                        text: "Bạn có chắc chắn muốn xóa tất cả sản phẩm ?",
                                        buttons: ["Hủy bỏ", "Đồng ý"],
                                    }).then(function (willDelete) {
                                        if (willDelete) {
                                            // Chuyển hướng URL với danh sách các ID sản phẩm
                                            window.console.log("hehehehehehe");
                                            window.location.href = "/SWP391_LapTop/deleteCheckbox?ids=" + "&delete=1" + "&page=" + page + "&num=" + num + "&key=" + key + "&entryperpage=" + entryperpage;
                                        }
                                    });
                                } else {
                                    swal("Cảnh báo", "Không có sản phẩm để xóa.", "warning");
                                }
                            });

                        </script>


                        <script>
                            function product(page, num, key) {
                                var entryperpage = document.getElementById('entryperpage');
                                window.location.href = "/SWP391_LapTop/productAdmin?entryperpage=" + entryperpage.value + "&num=" + num + "&key=" + key;

                            }
                        </script>
                        </body>

                        </html>