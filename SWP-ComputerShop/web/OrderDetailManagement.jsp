<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <head>
        <title>Chi tiết đơn hàng | Quản trị Admin</title>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"
                integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" 
                crossorigin="anonymous" 
        referrerpolicy="no-referrer"></script>
    </head>
    <c:if test="${errorRole != null}">
        <c:set var="errorRole" value="${null}" scope="session"/>
        <body class="app sidebar-mini rtl" id="bd" onload="errorRole(); time();">
        </c:if>
        <c:if test="${errorRole == null}">
        <body class="app sidebar-mini rtl" id="bd" onload="time()">
        </c:if>
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button-->
            <a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
               aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">
                <!-- User Menu-->
                <li>
                    <a class="app-nav__item" href="logout?page=login.jsp">
                        <i class='bx bx-log-out bx-rotate-180'></i> 
                    </a>
                </li>
            </ul>
        </header>

        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
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

        <!--Print start-->
        <main class="container" style="display: none" id="info_PDF">

            <div id="d1" class="row justify-content-between align-items-center" style="margin: 10px; margin-bottom: 10px;">
                <h1 class="col-xs-6 mb-0">MÃ ĐƠN HÀNG #${list[0].getOrder().getOrderID()}</h1>
                <div class="col-xs-6 mb-0">
                    <input onclick="generatePDF('${list[0].getOrder().getOrderID()}')" class="btn btn-success" type="button" id="Export" value="Xuất file PDF">
                    <c:if test="${list[0].getOrder().getStatus() == 'Delivered'}">
                        <button type="button" aria-expanded="false" class="btn btn-success">
                            <span>Đã hoàn thành</span>
                        </button>
                    </c:if>
                    <c:if test="${list[0].getOrder().getStatus() == 'Reject'}">
                        <button type="button" aria-expanded="false" class="btn btn-danger">
                            <span>Đã hủy</span>
                        </button>
                    </c:if>
                    <c:if test="${list[0].getOrder().getStatus() == 'On delivery'}">
                        <button type="button" aria-expanded="false" class="btn btn-warning">
                            <span>Đang vận chuyển</span>
                        </button>
                    </c:if>
                    <c:if test="${list[0].getOrder().getStatus() == 'New'}">
                        <button type="button" aria-expanded="false" class="btn btn-info">
                            <span>Chờ xử lý</span>
                        </button>
                    </c:if>
                </div>
            </div>

            <div id="d2" class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Thông tin khách hàng</h3>
                        <div class="row">
                            <div class="col-xl-12 mb-3">
                                <!-- Profile picture card-->
                                <div class="card mb-4 mb-xl-0">
                                    <div class="card-header">Ảnh</div>
                                    <div class="card-body text-center">
                                        <!-- Profile picture image-->
                                        <c:if test="${user.getUserID() != 6}">
                                            <img id="output" style="object-fit: cover;width: 315px;height: 315px;"
                                                 class="img-account-profile rounded-circle mb-2 col-md-12"
                                                 src="${pageContext.request.contextPath}/imgAccount/${user.getImg()}" alt="">
                                        </c:if>
                                        <c:if test="${user.getUserID() == 6}">
                                            <img id="output" style="object-fit: cover;width: 315px;height: 315px;"
                                                 class="img-account-profile rounded-circle mb-2 col-md-12"
                                                 src="${pageContext.request.contextPath}/imgAccount/vodanh.jpg" alt="">
                                        </c:if>
                                        <label for="img" class="btn btn-primary mt-3 col-md-12" style="cursor: auto">
                                            Khách Hàng
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-12">
                                <!-- Account details card-->
                                <div class="card mb-4">
                                    <div class="card-header">Thông tin chi tiết</div>
                                    <div class="card-body">
                                        <!-- Form Row-->
                                        <c:if test="${user.getUserID() != 6}">
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputUsername">Họ và tên</label>
                                                    <input class="form-control" id="inputUsername" type="text" value="${user.getUserName()}" readonly>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputPhone">Số điện thoại</label>
                                                    <input class="form-control" id="inputPhone" type="tel" value="${user.getPhone()}" readonly>
                                                </div>
                                            </div>
                                            <!-- Form Row-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailAddress">Địa chỉ</label>
                                                <input class="form-control" id="inputEmailAddress" type="text" value="${user.getAddress()}" readonly>
                                            </div>
                                            <!-- Form Group (email address)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailAddress">Email</label>
                                                <input name="email" class="form-control" id="inputEmailAddress" type="email" value="${user.getEmail()}" readonly>
                                            </div>
                                        </c:if>
                                        <c:if test="${user.getUserID() == 6}">
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputUsername">Họ và tên</label>
                                                    <input class="form-control" id="inputUsername" type="text" value="${list[0].getOrder().getUserName()}" readonly>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputPhone">Số điện thoại</label>
                                                    <input class="form-control" id="inputPhone" type="tel" value="${list[0].getOrder().getPhone()}" readonly>
                                                </div>
                                            </div>
                                            <!-- Form Row-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailAddress">Địa chỉ</label>
                                                <input class="form-control" id="inputEmailAddress" type="text" value="${list[0].getOrder().getShipAddress()}" readonly>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>                
                    </div> 
                </div>
            </div>

            <div id="d3" class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Chi tiết đơn hàng</h3>
                        <div class="tile-body">
                            <div class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                <table class="table table-hover table-bordered mb-2 table-responsive-lg" id="sampleTable">
                                    <tbody>
                                        <tr style="background: #eee">
                                            <th class="my-0 text-black font-w500 fs-20">Sản phẩm</th>
                                            <th class="my-0 text-black font-w500 fs-20" style="width: 10%;">Số lượng</th>
                                            <th class="my-0 text-black font-w500 fs-20" style="width: 10%;">Giá</th>
                                            <th class="my-0 text-black font-w500 fs-20">Tổng tiền</th>
                                            <th class="my-0 text-black font-w500 fs-20">Giảm giá</th>
                                        </tr>
                                        <c:forEach var="l" items="${list}">
                                            <tr>
                                                <td>
                                                    <div class="media">
                                                        <a href="/react/demo/order/ecom-product-detail.html">
                                                            <img class="me-3 to-fluid rounded" width="85" src="${pageContext.request.contextPath}/imageProduct/${l.getSp().getLargeImage()}" alt="pic1">
                                                        </a>
                                                        <div class="media-body ml-2">
                                                            <small class="mt-0 mb-1 font-w500">
                                                                <a class="text-third " href="/react/demo/order style=">${l.getSp().getBrandName()}</a>
                                                            </small>
                                                            <h5 class="mt-0 mb-2 mb-4">
                                                                <a class="text-black" href="/react/demo/order/ecom-product-detail.html">${l.getSp().getProductName()}</a>
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <h4 class="my-0 text-forth font-w600">${l.getQuantity()}</h4>
                                                </td>
                                                <td>
                                                    <h4 class="my-0 text-forth font-w600">${l.getSp().getPrice()}</h4>
                                                </td>
                                                <td>
                                                    <h4 class="my-0 text-forth font-w600">${l.getToltalPrice()}</h4>
                                                </td>
                                                <td>
                                                    <h4 class="my-0 text-forth font-w600">${l.getDiscount()}</h4>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="d4" class="row">
                <div class="col-sm-12 col-md-3">
                    <div class="card">
                        <div class="card-header border-0 pb-0">
                            <h4 class="card-title">Lịch sử chuyển hàng</h4>
                        </div>
                        <div class="card-body">
                            <div class="widget-timeline-icon">
                                <ul class="timeline-1">
                                    <c:if test="${empty list[0].getOrder().getReceiveDate()}">
                                        <li class="event">
                                            <h4>Đang vận chuyển</h4>
                                            <p class="mb-0">...</p>
                                        </li>
                                    </c:if>
                                    <c:if test="${!empty list[0].getOrder().getReceiveDate()}">
                                        <li class="event">
                                            <h4>Nhận Hàng</h4>
                                            <p class="mb-0">${list[0].getOrder().getReceiveDate()}</p>
                                        </li>
                                    </c:if>
                                    <c:if test="${empty list[0].getOrder().getShipDate()}">
                                        <li class="event">
                                            <h4>Đang xử lý</h4>
                                            <p class="mb-0">...</p>
                                        </li>
                                    </c:if>
                                    <c:if test="${!empty list[0].getOrder().getShipDate()}">
                                        <li class="event">
                                            <h4>Vận Chuyển</h4>
                                            <p class="mb-0">${list[0].getOrder().getShipDate()}</p>
                                        </li>
                                    </c:if>
                                    <li class="event">
                                        <h4>Đặt Hàng</h4>
                                        <p class="mb-0">${list[0].getOrder().getOrderDate()}</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-sm-12 col-md-9">
                    <div class="card">
                        <div class="card-header border-0 pb-0">
                            <h4 class="card-title">Địa chỉ đặt hàng</h4>
                        </div>
                        <div class="card-body">
                            <div class="full-map-area mb-4">
                                <img src="/react/demo/static/media/map-2.e455ada6f0023b353db3.png" alt="map2">
                                <a class="btn btn-danger btn-xs" href="/react/demo/order">View in Fullscreen</a>
                                <i class="flaticon-381-location-4"></i>
                            </div>
                            <div class="row mx-0">
                                <div class="media align-items-center col-md-4 col-lg-6 px-0 mb-3 mb-md-0">
                                    <img class="me-3 to-fluid rounded-circle" width="65" src="data:image/jpeg;base64,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" alt="avatar3">
                                    <div class="media-body">
                                        <h4 class="my-0 text-black">Kevin Hobs Jr.</h4>
                                        <small>ID 412455</small>
                                    </div>
                                </div>
                                <div class="iconbox col-md-4 col-lg-3 mb-3 mb-md-0">
                                    <i class="las la-phone"></i>
                                    <small>Telepon</small>
                                    <p>+12 345 5662 66</p>
                                </div>
                                <div class="iconbox col-md-4 col-lg-3 mb-md-0">
                                    <i class="las la-shipping-fast"></i>
                                    <small>Delivery Time</small>
                                    <p>12:52 AM</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>       
            </div>

        </main>
        <!--Print end-->

        <main class="app-content">

            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><a href="ordermanager">Danh sách đơn hàng</a></li>
                    <li class="breadcrumb-item"><a href="orderdetailmanagement">Chi tiết đơn hàng</a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div id="d1" class="row justify-content-between align-items-center" style="margin: 0px; margin-bottom: 10px;">
                <h1 class="col-xs-6 mb-0">MÃ ĐƠN HÀNG #${list[0].getOrder().getOrderID()}</h1>
                <div class="col-xs-6 mb-0">
                    <input onclick="generatePDF('${list[0].getOrder().getOrderID()}')" class="btn btn-success" type="button" id="Export" value="Xuất file PDF">
                    <c:if test="${list[0].getOrder().getStatus() == 'Delivered'}">
                        <button type="button" aria-expanded="false" class="btn btn-success">
                            <span>Đã hoàn thành</span>
                        </button>
                    </c:if>
                    <c:if test="${list[0].getOrder().getStatus() == 'Reject'}">
                        <button type="button" aria-expanded="false" class="btn btn-danger">
                            <span>Đã hủy</span>
                        </button>
                    </c:if>
                    <c:if test="${list[0].getOrder().getStatus() == 'On delivery'}">
                        <button type="button" aria-expanded="false" class="btn btn-warning">
                            <span>Đang vận chuyển</span>
                        </button>
                    </c:if>
                    <c:if test="${list[0].getOrder().getStatus() == 'New'}">
                        <button type="button" aria-expanded="false" class="btn btn-info">
                            <span>Chờ xử lý</span>
                        </button>
                    </c:if>
                </div>
            </div>

            <div id="d2" class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Thông tin khách hàng</h3>
                        <div class="row">
                            <div class="col-xl-4">
                                <!-- Profile picture card-->
                                <div class="card mb-4 mb-xl-0">
                                    <div class="card-header">Ảnh</div>
                                    <div class="card-body text-center">
                                        <!-- Profile picture image-->
                                        <c:if test="${user.getUserID() != 6}">
                                            <img id="output" style="object-fit: cover;width: 315px;height: 315px;"
                                                 class="img-account-profile rounded-circle mb-2 col-md-12"
                                                 src="${pageContext.request.contextPath}/imgAccount/${user.getImg()}" alt="">
                                        </c:if>
                                        <c:if test="${user.getUserID() == 6}">
                                            <img id="output" style="object-fit: cover;width: 315px;height: 315px;"
                                                 class="img-account-profile rounded-circle mb-2 col-md-12"
                                                 src="${pageContext.request.contextPath}/imgAccount/vodanh.jpg" alt="">
                                        </c:if>
                                        <label for="img" class="btn btn-primary mt-3 col-md-12" style="cursor: auto">
                                            Khách Hàng
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-8">
                                <!-- Account details card-->
                                <div class="card mb-4">
                                    <div class="card-header">Thông tin chi tiết</div>
                                    <div class="card-body">
                                        <!-- Form Row-->
                                        <c:if test="${user.getUserID() != 6}">
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputUsername">Họ và tên</label>
                                                    <input class="form-control" id="inputUsername" type="text" value="${user.getUserName()}" readonly>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputPhone">Số điện thoại</label>
                                                    <input class="form-control" id="inputPhone" type="tel" value="${user.getPhone()}" readonly>
                                                </div>
                                            </div>
                                            <!-- Form Row-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailAddress">Địa chỉ</label>
                                                <input class="form-control" id="inputEmailAddress" type="text" value="${user.getAddress()}" readonly>
                                            </div>
                                            <!-- Form Group (email address)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailAddress">Email</label>
                                                <input name="email" class="form-control" id="inputEmailAddress" type="email" value="${user.getEmail()}" readonly>
                                            </div>
                                        </c:if>
                                        <c:if test="${user.getUserID() == 6}">
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputUsername">Họ và tên</label>
                                                    <input class="form-control" id="inputUsername" type="text" value="${list[0].getOrder().getUserName()}" readonly>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputPhone">Số điện thoại</label>
                                                    <input class="form-control" id="inputPhone" type="tel" value="${list[0].getOrder().getPhone()}" readonly>
                                                </div>
                                            </div>
                                            <!-- Form Row-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailAddress">Địa chỉ</label>
                                                <input class="form-control" id="inputEmailAddress" type="text" value="${list[0].getOrder().getShipAddress()}" readonly>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>                
                    </div> 
                </div>
            </div>

            <div id="d3" class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Chi tiết đơn hàng</h3>
                        <div class="tile-body">
                            <div class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                <table class="table table-hover table-bordered mb-2 table-responsive-lg" id="sampleTable">
                                    <tbody>
                                        <tr style="background: #eee">
                                            <th class="my-0 text-black font-w500 fs-20">Sản phẩm</th>
                                            <th class="my-0 text-black font-w500 fs-20" style="width: 10%;">Số lượng</th>
                                            <th class="my-0 text-black font-w500 fs-20" style="width: 10%;">Giá</th>
                                            <th class="my-0 text-black font-w500 fs-20">Tổng tiền</th>
                                            <th class="my-0 text-black font-w500 fs-20">Giảm giá</th>
                                        </tr>
                                        <c:forEach var="l" items="${list}">
                                            <tr>
                                                <td>
                                                    <div class="media">
                                                        <a href="/react/demo/order/ecom-product-detail.html">
                                                            <img class="me-3 to-fluid rounded" width="85" src="${pageContext.request.contextPath}/imageProduct/${l.getSp().getLargeImage()}" alt="pic1">
                                                        </a>
                                                        <div class="media-body ml-2">
                                                            <small class="mt-0 mb-1 font-w500">
                                                                <a class="text-third " href="/react/demo/order style=">${l.getSp().getBrandName()}</a>
                                                            </small>
                                                            <h5 class="mt-0 mb-2 mb-4">
                                                                <a class="text-black" href="/react/demo/order/ecom-product-detail.html">${l.getSp().getProductName()}</a>
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <h4 class="my-0 text-forth font-w600">${l.getQuantity()}</h4>
                                                </td>
                                                <td>
                                                    <h4 class="my-0 text-forth font-w600">${l.getSp().getPrice()}</h4>
                                                </td>
                                                <td>
                                                    <h4 class="my-0 text-forth font-w600">${l.getToltalPrice()}</h4>
                                                </td>
                                                <td>
                                                    <h4 class="my-0 text-forth font-w600">${l.getDiscount()}</h4>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="d4" class="row">
                <div class="col-sm-12 col-md-3">
                    <div class="card">
                        <div class="card-header border-0 pb-0">
                            <h4 class="card-title">Lịch sử chuyển hàng</h4>
                        </div>
                        <div class="card-body">
                            <div class="widget-timeline-icon">
                                <ul class="timeline-1">
                                    <c:if test="${empty list[0].getOrder().getReceiveDate()}">
                                        <li class="event">
                                            <h4>Đang vận chuyển</h4>
                                            <p class="mb-0">...</p>
                                        </li>
                                    </c:if>
                                    <c:if test="${!empty list[0].getOrder().getReceiveDate()}">
                                        <li class="event">
                                            <h4>Nhận Hàng</h4>
                                            <p class="mb-0">${list[0].getOrder().getReceiveDate()}</p>
                                        </li>
                                    </c:if>
                                    <c:if test="${empty list[0].getOrder().getShipDate()}">
                                        <li class="event">
                                            <h4>Đang xử lý</h4>
                                            <p class="mb-0">...</p>
                                        </li>
                                    </c:if>
                                    <c:if test="${!empty list[0].getOrder().getShipDate()}">
                                        <li class="event">
                                            <h4>Vận Chuyển</h4>
                                            <p class="mb-0">${list[0].getOrder().getShipDate()}</p>
                                        </li>
                                    </c:if>
                                    <li class="event">
                                        <h4>Đặt Hàng</h4>
                                        <p class="mb-0">${list[0].getOrder().getOrderDate()}</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-sm-12 col-md-9">
                    <div class="card">
                        <div class="card-header border-0 pb-0">
                            <h4 class="card-title">Địa chỉ đặt hàng</h4>
                        </div>
                        <div class="card-body">
                            <div class="full-map-area mb-4">
                                <img src="/react/demo/static/media/map-2.e455ada6f0023b353db3.png" alt="map2">
                                <a class="btn btn-danger btn-xs" href="/react/demo/order">View in Fullscreen</a>
                                <i class="flaticon-381-location-4"></i>
                            </div>
                            <div class="row mx-0">
                                <div class="media align-items-center col-md-4 col-lg-6 px-0 mb-3 mb-md-0">
                                    <img class="me-3 to-fluid rounded-circle" width="65" src="data:image/jpeg;base64,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" alt="avatar3">
                                    <div class="media-body">
                                        <h4 class="my-0 text-black">Kevin Hobs Jr.</h4>
                                        <small>ID 412455</small>
                                    </div>
                                </div>
                                <div class="iconbox col-md-4 col-lg-3 mb-3 mb-md-0">
                                    <i class="las la-phone"></i>
                                    <small>Telepon</small>
                                    <p>+12 345 5662 66</p>
                                </div>
                                <div class="iconbox col-md-4 col-lg-3 mb-md-0">
                                    <i class="las la-shipping-fast"></i>
                                    <small>Delivery Time</small>
                                    <p>12:52 AM</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>       
            </div>

        </main>

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
        <script>
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
                            var pdf = html2pdf();
                            element.style.display = "block";
                            let body = document.body;
                            let html = document.documentElement;
                            let height = Math.max(body.scrollHeight, body.offsetHeight,
                                    html.clientHeight, html.scrollHeight, html.offsetHeight);
                            let heightCM = height / 64;
                            var opt = {
                                margin: 2,
                                filename: 'order#'+id+"_"+today+'.pdf',
                                image: {type: 'jpeg', quality: 1},
                                html2canvas: {scale: 4},
                                jsPDF: {unit: 'cm',
                                    orientation: 'portrait',
                                    format: [heightCM, 35]},
                                pagebreak: {mode: 'avoid-all'},

                            };
                            pdf.from(element).set(opt).save();
                            setTimeout(() => {
                                element.style.display = "none";
                            }, 100);
                        }

                        function deleteRow(r) {
                            var i = r.parentNode.parentNode.rowIndex;
                            document.getElementById("myTable").deleteRow(i);
                        }
                        function getPa(orderID, path, status) {
                            if (!status) {
                                window.location.href = path + "/ordermanager?orderID=" + orderID;
                            } else
                                window.location.href = path + "/updateorder?orderID=" + orderID + "&status=" + status;
                        }
                        jQuery(function () {
                            jQuery(".trash").click(function () {
                                var orderID = $(this).data("id");
                                var status = $(this).data("status");
                                var path = $(this).data("path");
                                swal({
                                    title: "Cảnh báo",
                                    text: "Bạn có chắc chắn là muốn hủy bỏ đơn hàng này?",
                                    buttons: ["Hủy bỏ", "Đồng ý"]
                                })
                                        .then((willDelete) => {
                                            if (willDelete) {
                                                swal("Đã hủy thành công!", {
                                                })
                                                        .then(function () {
                                                            getPa(orderID, path, status);
                                                        });
                                            }
                                        });
                            });
                        });
                        jQuery(function () {
                            jQuery(".check").click(function () {
                                var orderID = $(this).data("id");
                                var status = $(this).data("status");
                                var path = $(this).data("path");
                                swal("Xác thực thành công!", {
                                })
                                        .then(function () {
                                            getPa(orderID, path, status);
                                        });
                            });
                        });
                        oTable = $('#sampleTable').dataTable();
                        $('#all').click(function (e) {
                            $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
                            e.stopImmediatePropagation();
                        });
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
                        //In dữ liệu
                        var myApp = new function () {
                            this.printTable = function () {
                                var tab = document.getElementById('sampleTable');
                                var win = window.open('', '', 'height=700,width=700');
                                win.document.write(tab.outerHTML);
                                win.document.close();
                                win.print();
                            }
                        }
                        //Modal
                        $("#show-emp").on("click", function () {
                            $("#ModalUP").modal({backdrop: false, keyboard: false})
                        })
                                ;
                        function errorRole() {
                            swal({
                                icon: 'error',
                                title: 'Oops...',
                                text: 'Bạn không có quyền truy cập vào trang này!!!'
                            });
                        }
        </script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    </body>
</html>
