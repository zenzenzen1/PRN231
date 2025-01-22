<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <head>
        <title>Chỉnh sửa thông tin | Quản trị Admin</title>
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

    </head>
    <c:if test="${errorRole != null}">
        <c:set var="errorRole" value="${null}" scope="session"/>
        <body class="app sidebar-mini rtl" onload="errorRole();time();">
        </c:if>
        <c:if test="${errorRole == null}">
            <c:if test="${success !=null && success == 1}">
                <c:set var="success" value="${null}" scope="session"/>
            <body class="app sidebar-mini rtl" onload="Update();time()">
            </c:if>
            <c:if test="${success == null || empty success}">
            <body class="app sidebar-mini rtl" onload="time()">
            </c:if>
        </c:if>
        <style>
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
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><a href="addstaff">Chỉnh sửa thông tin</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">

                    <div class="tile">

                        <h3 class="tile-title">Chỉnh sửa thông tin</h3>
                        <form id="frm" method="post" action="adminaccount" enctype="multipart/form-data">
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
                                            <div class="small font-italic text-muted mb-4">Ảnh không vượt quá 5 MB</div>
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
                                        <div class="card-body">
                                            <!-- Form Row-->
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="ID">ID</label>
                                                    <input name="id" class="form-control" id="ID" type="text" value="${admin.getAdminID()}" readonly>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputPhone">Số điện thoại</label>
                                                    <input name="phone" pattern="[0-9]{10}"
                                                           class="form-control" id="inputPhone" type="tel" value="${admin.getPhone()}" required>
                                                </div>
                                            </div>
                                            <!-- Form Row-->
                                            <!-- Form Group (username)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputUsername">Họ và tên</label>
                                                <input name="name" class="form-control" id="inputUsername" type="text" value="${admin.getAdminName()}" required>
                                            </div>

                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailAddress">Địa chỉ</label>
                                                <input name="address" class="form-control" id="inputEmailAddress" type="text" value="${admin.getAddress()}" required>
                                            </div>
                                            <!-- Form Group (email address)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailAddress">Email</label>
                                                <input name="email" class="form-control" id="inputEmailAddress" type="email" value="${admin.getEmail()}" required>
                                            </div>
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailAddress">Mật khẩu</label>
                                                <input name="pass" class="form-control" pattern="(?=.*\d)(?=.*\W)(?=.*[a-z])(?=.*[A-Z]).{6,15}"
                                                       title="Bao gồm ít nhất 1 chữ số, 1 chữ cái viết hoa, 1 chữ cái viết thường, 1 ký tự đặc biệt và có độ dài từ 6 đến 15 chữ cái"
                                                       id="inputEmailAddress" type="text" value="${admin.getPassword()}" required>
                                            </div>
                                            <!-- Save changes button-->
                                            <button class="btn btn-save ml-0 btns" type="submit" name="success" value="1">Lưu lại</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>                  
                    </div> 



                </div>

            </div>

        </main>
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

    </body>
</html>
