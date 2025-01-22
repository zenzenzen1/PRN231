<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <head>
        <title>Danh sách đơn hàng | Quản trị Admin</title>
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
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="/image1/Admin.jpg" width="30px"
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
                    <li class="breadcrumb-item"><a href="ordermanager?order=1">Danh sách đơn hàng</a></li>
                    <li class="breadcrumb-item">Thêm đơn hàng</li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Tạo mới đơn hàng</h3>
                        <div class="tile-body">
                            <form class="row" action="addorder" id="frm" method="post">
                                <input type="hidden" name="key" value="${key}">
                                <input type="hidden" name="id" id="getid">
                                <input type="hidden" name="entryperpage" value="${entryperpage}">
                                <div class="form-group col-md-6">
                                    <label class="control-label">Tên khách hàng</label>
                                    <input id="nameUser" class="form-control" name="nameU" type="text">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Số điện thoại khách hàng</label>
                                    <input oninput="checkPhoneAndName()" id="phoneNum" class="form-control" name="phone" type="text">
                                </div>
                                <div class="form-group  col-md-6">
                                    <label class="control-label">Địa chỉ đặt hàng</label>
                                    <input id="Address" class="form-control" name="address" type="text">
                                </div>
                                <div class="form-group  col-md-6">
                                    <label class="control-label">Phương thức thanh toán</label>
                                    <select class="form-control" name="payment">
                                        <option value="Tiền mặt">Tiền mặt</option>
                                        <option value="VietinBank">VietinBank</option>
                                        <option value="Agribank">Agribank</option>
                                        <option value="BIDV">BIDV</option>
                                        <option value="TPbank">TPbank</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6" id="P1">
                                    <label class="control-label">Tên sản phẩm</label>
                                    <input id="p1" class="form-control" name="nameP1" type="text">
                                </div>
                                <div class="form-group col-md-3" id="Num1">
                                    <label class="control-label">Số lượng</label>
                                    <input class="form-control" id="num1" name="number1" type="number">
                                </div>
                                <div class="form-group col-md-3" id="check1">
                                    <input onclick="dataHandle('1')" class="form-control btn btn-save" value="Kiểm tra" style="margin-top: 29px" type="button">
                                </div>
                            </form>
                            <button onclick="add()" class="btn btn-primary" type="button">Thêm sản phẩm</button>
                            <button onclick="submitForm()" class="btn btn-save ml-2" type="button">Lưu lại</button>
                            <a class="btn btn-cancel ml-2" href="javascript:history.back()">Hủy bỏ</a>
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
                    <script>
                                function checkPhoneAndName() {
                                    const xhr = new XMLHttpRequest();
                                    if (document.getElementById('phoneNum').value.match("0[0-9]{9}") && document.getElementById('phoneNum').value.length === 10) {
                                        var nameU = document.getElementById('nameUser');
                                        var phone = document.getElementById('phoneNum');
                                        var Address = document.getElementById('Address');
                                        var getid = document.getElementById('getid');
                                        var json;
                                        xhr.onreadystatechange = () => {
                                            if (xhr.readyState == 4 && xhr.status == 200) {
                                                try {
                                                    json = JSON.parse(xhr.responseText);
                                                } catch (e) {
                                                    console.error('Invalid JSON string:' + e);
                                                }
                                                nameU.value = json.nameU;
                                                Address.value = json.address;
                                                getid.value = json.haveID;
                                            }
                                        };
                                        xhr.open("POST", "orderajaxhandle", true);
                                        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                        xhr.send("phone=" + phone.value + "&check=0");
                                    }
                                }


                                function dataHandle(id) {
                                    const xhr = new XMLHttpRequest();
                                    var name = document.getElementById('p' + id);
                                    var num = document.getElementById('num' + id);
                                    var json;
                                    xhr.onreadystatechange = () => {
                                        if (xhr.readyState == 4 && xhr.status == 200) {
                                            var divP = document.getElementById("P" + id);
                                            var divN = document.getElementById("Num" + id);
                                            try {
                                                json = JSON.parse(xhr.responseText);
                                            } catch (e) {
                                                console.error('Invalid JSON string:' + e);
                                            }
                                            if (json.errorP !== null && json.errorP !== undefined) {
                                                if (document.getElementsByClassName('hidecheck' + id).length > 0) {
                                                    var temp = document.getElementsByClassName('hidecheck' + id);
                                                    while (temp.length != 0) {
                                                        temp[0].remove();
                                                    }
                                                }
                                                if (document.getElementById('errorP' + id) !== null && document.getElementById('errorP' + id) !== undefined) {
                                                    var temp = document.getElementById('errorP' + id);
                                                    temp.remove();
                                                }
                                                if (document.getElementById('errorN' + id) !== null && document.getElementById('errorN' + id) !== undefined) {
                                                    var temp = document.getElementById('errorN' + id);
                                                    temp.remove();
                                                }
                                                var errorP = document.createElement("p");
                                                errorP.innerHTML = json.errorP;
                                                errorP.setAttribute("style", "color:red;font-weight: bold;margin-top: 9px;margin-bottom: 0px");
                                                errorP.setAttribute("id", "errorP" + id);
                                                errorP.setAttribute("class", "errorInput");
                                                divP.appendChild(errorP);
                                            } else if (json.errorN !== null && json.errorN !== undefined) {
                                                if (document.getElementsByClassName('hidecheck' + id).length > 0) {
                                                    var temp = document.getElementsByClassName('hidecheck' + id);
                                                    while (temp.length != 0) {
                                                        temp[0].remove();
                                                    }
                                                }
                                                if (document.getElementById('errorN' + id) !== null && document.getElementById('errorN' + id) !== undefined) {
                                                    var temp = document.getElementById('errorN' + id);
                                                    temp.remove();
                                                }
                                                if (document.getElementById('errorP' + id) !== null && document.getElementById('errorP' + id) !== undefined) {
                                                    var temp = document.getElementById('errorP' + id);
                                                    temp.remove();
                                                }
                                                var errorN = document.createElement("p");
                                                errorN.innerHTML = json.errorN;
                                                errorN.setAttribute("style", "color:red;font-weight: bold;margin-top: 9px;margin-bottom: 0px");
                                                errorN.setAttribute("id", "errorN" + id);
                                                errorN.setAttribute("class", "errorInput");
                                                divN.appendChild(errorN);
                                            } else {
                                                if (document.getElementsByClassName('hidecheck' + id).length > 0) {
                                                    var temp = document.getElementsByClassName('hidecheck' + id);
                                                    while (temp.length != 0) {
                                                        temp[0].remove();
                                                    }
                                                }
                                                if (document.getElementById('errorP' + id) !== null && document.getElementById('errorP' + id) !== undefined) {
                                                    var temp = document.getElementById('errorP' + id);
                                                    temp.remove();
                                                }
                                                if (document.getElementById('errorN' + id) !== null && document.getElementById('errorN' + id) !== undefined) {
                                                    var temp = document.getElementById('errorN' + id);
                                                    temp.remove();
                                                }
                                                var idSP = document.createElement("input");
                                                idSP.setAttribute("type", "checkbox");
                                                idSP.setAttribute("name", "idSP");
                                                idSP.setAttribute("value", json.idSP);
                                                idSP.setAttribute("hidden", "true");
                                                idSP.setAttribute("checked", "true");
                                                idSP.setAttribute("class", "hidecheck" + id);
                                                var total = document.createElement("input");
                                                total.setAttribute("type", "checkbox");
                                                total.setAttribute("name", "total");
                                                total.setAttribute("value", json.total);
                                                total.setAttribute("hidden", "true");
                                                total.setAttribute("checked", "true");
                                                total.setAttribute("class", "hidecheck" + id);
                                                var discount = document.createElement("input");
                                                discount.setAttribute("type", "checkbox");
                                                discount.setAttribute("name", "discount");
                                                discount.setAttribute("value", json.discount);
                                                discount.setAttribute("hidden", "true");
                                                discount.setAttribute("checked", "true");
                                                discount.setAttribute("class", "hidecheck" + id);
                                                var num = document.createElement("input");
                                                num.setAttribute("type", "checkbox");
                                                num.setAttribute("name", "quantity");
                                                num.setAttribute("value", document.getElementById('num' + id).value);
                                                num.setAttribute("hidden", "true");
                                                num.setAttribute("checked", "true");
                                                num.setAttribute("class", "hidecheck" + id);
                                                var successP = document.createElement("p");
                                                successP.innerHTML = "Sản phẩm hợp lệ";
                                                successP.setAttribute("style", "color:green;font-weight: bold;margin-top: 9px;margin-bottom: 0px");
                                                successP.setAttribute("class", "hidecheck" + id);
                                                successP.setAttribute("id", "successP" + id);
                                                var successN = document.createElement("p");
                                                successN.innerHTML = "Số lượng hợp lệ";
                                                successN.setAttribute("style", "color:green;font-weight: bold;margin-top: 9px;margin-bottom: 0px");
                                                successN.setAttribute("class", "hidecheck" + id);
                                                successP.setAttribute("id", "successN" + id);
                                                divP.appendChild(idSP);
                                                divP.appendChild(total);
                                                divP.appendChild(discount);
                                                divP.appendChild(num);
                                                divP.appendChild(successP);
                                                divN.appendChild(successN);
                                            }
                                        }
                                    };
                                    if (name.value !== "" && num.value !== "") {
                                        for (var i = 1; i < 10; i++) {
                                            if (document.getElementById('p' + i) !== null && document.getElementById('p' + i) !== undefined) {
                                                if (parseInt(id) !== i && name.value === document.getElementById('p' + i).value) {
                                                    if (document.getElementById('errorP' + id) !== null && document.getElementById('errorP' + id) !== undefined) {
                                                        var temp = document.getElementById('errorP' + id);
                                                        temp.remove();
                                                    }
                                                    var divP = document.getElementById("P" + id);
                                                    var errorP = document.createElement("p");
                                                    errorP.innerHTML = "Sản phẩm đã được thêm vào từ trước đó. Xin hãy chọn sản phẩm khác!!!";
                                                    errorP.setAttribute("style", "color:red;font-weight: bold;margin-top: 9px;margin-bottom: 0px");
                                                    errorP.setAttribute("id", "errorP" + id);
                                                    errorP.setAttribute("class", "errorInput");
                                                    divP.appendChild(errorP);
                                                    return;
                                                }
                                            }
                                        }
                                        xhr.open("POST", "orderajaxhandle", true);
                                        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                        xhr.send("name=" + name.value + "&num=" + num.value + "&check=1");
                                    }
                                }

                                function submitForm() {
                                    const inputs = document.querySelectorAll('input[type="text"], input[type="number"]');
                                    for (var i = 0; i < inputs.length; i++) {
                                        if (inputs[i].value === "") {
                                            swal({
                                                icon: 'error',
                                                title: 'Oops...',
                                                text: 'Không được để trống thông tin!!!'
                                            });
                                            return;
                                        }
                                    }
                                    if (document.getElementById('phoneNum').value.match("0[0-9]{9}") && document.getElementById('phoneNum').value.length === 10) {
                                        var errorInput = document.querySelector('.errorInput');
                                        if (errorInput !== null && errorInput !== undefined) {
                                            swal({
                                                icon: 'error',
                                                title: 'Oops...',
                                                text: 'Đang có thông tin không hợp lệ!!!'
                                            });
                                            return;
                                        }
                                        var check = false;
                                        for (var i = 0; i < 10; i++) {
                                            console.log("ok");
                                            if (document.getElementById('P' + i) !== null && document.getElementById('P' + i) !== undefined) {
                                                console.log("ok1");
                                                var temp = document.getElementById('P' + i);
                                                var successP = document.getElementById("successP" + i);
                                                var successN = document.getElementById("successN" + i);
                                                if (!temp.contains(successP) && !temp.contains(successN)) {
                                                    console.log("ok2");
                                                    check = true;
                                                }
                                            }
                                        }
                                        if (check) {
                                            swal({
                                                title: 'Cảnh báo',
                                                text: "Tất cả thông tin sản phẩm chưa được kiểm tra hết. Bạn có muốn kiểm tra hết không?",
                                                buttons: ["Hủy bỏ", "Đồng ý"]
                                            })
                                                    .then((willDelete) => {
                                                        if (willDelete) {
                                                            for (var i = 0; i < 10; i++) {
                                                                if (document.getElementById('P' + i) !== null && document.getElementById('P' + i) !== undefined) {
                                                                    var temp = document.getElementById('P' + i);
                                                                    var successP = document.getElementById("successP" + i);
                                                                    var successN = document.getElementById("successN" + i);
                                                                    if (!temp.contains(successP) && !temp.contains(successN)) {
                                                                        dataHandle(i);
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        return;
                                                    });
                                        }
                                        if (!check)
                                            document.getElementById('frm').submit();
                                    } else {
                                        swal({
                                            icon: 'error',
                                            title: 'Oops...',
                                            text: 'Số điện thoại không hợp lệ!!!'
                                        });
                                        return;
                                    }
                                }

                                const arr = [2, 3, 4, 5, 6, 7, 8, 9, 10];
                                function add() {
                                    if (arr.length > 0) {
                                        var count = arr.shift();
                                        var frm = document.getElementById('frm');
                                        var divP = document.createElement("div");
                                        divP.setAttribute("class", "form-group col-md-6");
                                        divP.setAttribute("id", "P" + count);
                                        var divnum = document.createElement("div");
                                        divnum.setAttribute("class", "form-group col-md-2");
                                        divnum.setAttribute("id", "Num" + count);
                                        var divbtn = document.createElement("div");
                                        divbtn.setAttribute("class", "form-group col-md-2");
                                        divbtn.setAttribute("id", "btn" + count);
                                        var divcheck = document.createElement("div");
                                        divcheck.setAttribute("class", "form-group col-md-2");
                                        divcheck.setAttribute("id", "check" + count);
                                        frm.appendChild(divP);
                                        frm.appendChild(divnum);
                                        frm.appendChild(divcheck);
                                        frm.appendChild(divbtn);
                                        var labelP = document.createElement("label");
                                        labelP.setAttribute("class", "control-label");
                                        labelP.innerHTML = "Tên sản phẩm";
                                        var labelnum = document.createElement("label");
                                        labelnum.setAttribute("class", "control-label");
                                        labelnum.innerHTML = "Số lượng";
                                        var newP = document.createElement("input");
                                        newP.setAttribute("name", "newP" + count);
                                        newP.setAttribute("class", "form-control");
                                        newP.setAttribute("id", "p" + count);
                                        newP.setAttribute("type", "text");
                                        divP.appendChild(labelP);
                                        divP.appendChild(newP);
                                        var num = document.createElement("input");
                                        num.setAttribute("name", "number" + count);
                                        num.setAttribute("class", "form-control");
                                        num.setAttribute("id", "num" + count);
                                        num.setAttribute("type", "num");
                                        divnum.appendChild(labelnum);
                                        divnum.appendChild(num);
                                        var btn = document.createElement("input");
                                        btn.setAttribute("type", "button");
                                        btn.setAttribute("class", "form-control btn btn-cancel");
                                        btn.setAttribute("style", "margin-top: 29px");
                                        btn.setAttribute("value", "Hủy sản phẩm");
                                        btn.setAttribute("onclick", "alertRemoveP('" + count + "')");
                                        divbtn.appendChild(btn);
                                        var check = document.createElement("input");
                                        check.setAttribute("type", "button");
                                        check.setAttribute("class", "form-control btn btn-save");
                                        check.setAttribute("style", "margin-top: 29px");
                                        check.setAttribute("value", "Kiểm tra");
                                        check.setAttribute("onclick", "dataHandle('" + count + "')");
                                        divcheck.appendChild(check);
                                    } else {
                                        swal({
                                            icon: 'error',
                                            title: 'Oops...',
                                            text: 'Đã vượt quá số lượng của 1 đơn hàng!\nVui lòng thêm đơn hàng mới!!!'
                                        });
                                    }
                                }

                                function deleteP(id) {
                                    var divP = document.getElementById('P' + id);
                                    var divNum = document.getElementById('Num' + id);
                                    var divbtn = document.getElementById('btn' + id);
                                    var divcheck = document.getElementById('check' + id);
                                    divP.remove();
                                    divNum.remove();
                                    divbtn.remove();
                                    divcheck.remove();
                                    arr.push(parseInt(id));
                                }

                                function alertRemoveP(P, Num, btn, id) {
                                    swal({
                                        title: 'Cảnh báo',
                                        text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
                                        buttons: ["Hủy bỏ", "Đồng ý"]
                                    })
                                            .then((willDelete) => {
                                                if (willDelete) {
                                                    deleteP(P, Num, btn, id);
                                                }
                                            });
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
