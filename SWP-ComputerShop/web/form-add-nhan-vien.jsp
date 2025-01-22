<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <head>
        <title>Thêm nhân viên | Quản trị Admin</title>
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
        <body class="app sidebar-mini rtl" onload="time()">
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
                    <li><a class="app-nav__item" href="/index.jsp"><i class='bx bx-log-out bx-rotate-180'></i> </a>

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
                        <li class="breadcrumb-item"><a href="adminstaff">Danh sách nhân viên</a></li>
                        <li class="breadcrumb-item"><a href="addstaff">Thêm nhân viên</a></li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col-md-12">

                        <div class="tile">

                            <h3 class="tile-title">Tạo mới nhân viên</h3>
                            <form class="row" method="post" action="addstaff">
                                <input type="hidden" name="key" value="${key}">
                                <input type="hidden" name="entryperpage" value="${entryperpage}">
                                <div class="form-group col-md-4">
                                    <label class="control-label">Họ và tên</label>
                                    <input name="name" class="form-control" type="text" required>
                                </div>
                                <div class="form-group  col-md-4">
                                    <label class="control-label">Số điện thoại</label>
                                    <input name="phone" class="form-control" type="text" required
                                           pattern="0[0-9]{9}">
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Địa chỉ email</label>
                                    <input name="email" class="form-control" type="text" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Địa chỉ thường trú</label>
                                    <input name="address" class="form-control" type="text" required>
                                </div>

                                <div class="form-group  col-md-3">
                                    <label for="exampleSelect1" class="control-label" >Chức vụ</label>
                                    <select class="form-control" name="role" required>
                                        <option value="0">-- Chọn chức vụ --</option>
                                        <c:forEach items="${li}" var="l">
                                            <option value="${l.getRoleID()}">${l.getRoleName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-12">
                                    <!--                                    <label class="control-label">Ảnh nhân viên</label>
                                                                        <div id="myfileupload">
                                                                            <input type="file" id="uploadfile" name="img" accept=".jpg,.png,.webp" required title="Hãy chọn ảnh đại diện"/>
                                                                        </div>
                                                                        <div id="thumbbox">
                                                                            <img height="300" width="300" alt="Thumb image" id="thumbimage" style="display: none" />
                                                                            <a class="removeimg" href="javascript:"></a>
                                                                        </div>
                                                                        <div id="boxchoice">
                                                                            <a href="javascript:" class="Choicefile"><i class='bx bx-upload'></i></a>
                                                                            <p style="clear:both"></p>
                                                                        </div>-->
                                </div>
                                <button class="btn btn-save ml-3" type="submit">Lưu lại</button>
                                <a class="btn btn-cancel ml-3" href="adminstaff?key=${key}&entryperpage=${entryperpage}">Hủy bỏ</a>
                            </form>
                        </div>
                    </div>

            </main>


            <!--
            MODAL
            -->
            <!--                    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
                                     data-backdrop="static" data-keyboard="false">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
            
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="form-group  col-md-12">
                                                        <span class="thong-tin-thanh-toan">
                                                            <h5>Tạo chức vụ mới</h5>
                                                        </span>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="control-label">Nhập tên chức vụ mới</label>
                                                        <input class="form-control" type="text" required>
                                                    </div>
                                                </div>
                                                <BR>
                                                <button class="btn btn-save" type="button">Lưu lại</button>
                                                <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                                                <BR>
                                            </div>
                                            <div class="modal-footer">
                                            </div>
                                        </div>
                                    </div>
                                </div>-->
            <!--
            MODAL
            -->


            <!-- Essential javascripts for application to work-->
            <script src="js/jquery-3.2.1.min.js"></script>
            <script src="js/popper.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/main.js"></script>
            <!-- The javascript plugin to display page loading on top-->
            <script src="js/plugins/pace.min.js"></script>

        </body>

</html>
