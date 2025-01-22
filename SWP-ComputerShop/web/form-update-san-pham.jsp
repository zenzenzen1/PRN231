

<!DOCTYPE html>
<html lang="en">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="Entity.Product" %>
    <%@page import="Entity.Category" %>
    <%@page import="Entity.Brand" %>
    <head>
        <title>Thêm sản phẩm | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
        <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
        <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
        <script>

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

    <body class="app sidebar-mini rtl">
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
                    <li class="breadcrumb-item">Danh sách sản phẩm</li>
                    <li class="breadcrumb-item"><a href="#"> sản phẩm</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Update sản phẩm</h3>

                        <form class="row" action="updateProduct" method="post" enctype="multipart/form-data">
                            <div class="form-group col-md-3">
                                <label class="control-label">Tên sản phẩm</label>
                                <input name="name" class="form-control" type="text" value="${Product.getProductName()}">
                            </div>
                            <div class="form-group  col-md-3">
                                <label class="control-label">Số lượng</label>
                                <input name="quantity" class="form-control" type="number" value="${Product.getQuantity()}" min="0">

                            </div>
                            <div class="form-group  col-md-3">
                                <label class="control-label">Giá bán</label>
                                <input name="price" class="form-control" type="text" value="${Product.getPrice()}">

                            </div>
                            <div class="form-group  col-md-3">
                                <label class="control-label">Discount</label>
                                <input name="discount" class="form-control" type="number" value="${Product.getDiscount()}" min="0">

                            </div>
                            <div class="form-group col-md-3">
                                <label for="exampleSelect1" class="control-label">Danh mục</label>
                                <select name="category" class="form-control" id="exampleSelect1">
                                    <c:forEach items="${listCategory}" var="itemCa">
                                        <c:if test="${Product.getCategoryName() == itemCa.getCategoryName()}">
                                            <option selected value="${itemCa.getCategoryID()}">${itemCa.getCategoryName()}</option>
                                        </c:if>
                                        <c:if test="${Product.getCategoryName() != itemCa.getCategoryName()}">
                                            <option value="${itemCa.getCategoryID()}">${itemCa.getCategoryName()}</option>
                                        </c:if>
                                        
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-3 ">
                                <label for="exampleSelect1" class="control-label">Thương hiệu</label>
                                <select name="brand" class="form-control" id="exampleSelect1">
                                    <c:forEach items="${listBrand}" var="itemBr">
                                        <c:if test="${Product.getBrandName() == itemCa.getBrandName()}">
                                            <option selected value="${itemBr.getBrandID()}">${itemBr.getBrandName()}</option>
                                        </c:if>
                                        <c:if test="${Product.getCategoryName() != itemCa.getCategoryName()}">
                                            <option value="${itemBr.getBrandID()}">${itemBr.getBrandName()}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group  col-md-3">
                                <label class="control-label">Bảo hành</label>
                                <input name="guarantee" class="form-control" type="number" value="${Product.getGuarantee()}" min="0">

                            </div>                       
                            <div class="form-group col-md-12">
                                <label class="control-label">Mô tả ngắn sản phẩm</label>
                                <textarea class="form-control" name="motangan" id="mota">${Product.getOtherDescription()}</textarea>
                            </div>

                            <div class="form-group col-md-12">
                                <label class="control-label">Ảnh chi tiết</label>
                                <textarea class="form-control" name="imageDetails" id="anhchitiet">${Product.getSmallImage()}</textarea>
                            </div>
                            <div class="form-group  col-md-3">
                                <label class="control-label">Ảnh lớn</label>
                                <input name="largeimage" class="form-control" type="file" value="${Product.getLargeImage()}" >
                                Ảnh hiện tại <img src="imageProduct/${Product.getLargeImage()}" alt="" width="100px;">
                            </div>
                            <div class="form-group  col-md-3">
                                <label class="control-label">Tài liệu</label>
                                <input name="tailieu" class="form-control" type="file" value="${Product.getFile()}">
                                Tài liệu hiện tại <p>${Product.getFile()}</p>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="control-label">Mô tả chi tiết</label>
                                <textarea class="form-control" name="motachitiet" id="motachitiet">${Product.getDescription()}</textarea>
                            </div>
                            <script>
                                tinymce.init({
                                    selector: 'textarea',
                                    plugins: ['directionality', 'preview', 'searchreplace', 'image', 'code', 'table', 'quickbars', 'editimage', 'help', 'fullscreen', 'emoticons', 'insertdatetime', 'lists', 'advlist', 'link', 'footnotes'],
                                    toolbar: 'undo redo | styles | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent\n\
          | link image | table | searchreplace preview | ltr rtl | insertdatetime | fullscreen | emoticons | code | help',
                                    editimage_toolbar: 'rotateleft rotateright | flipv fliph | editimage imageoptions',
                                    quickbars_insert_toolbar: 'alignleft aligncenter alignright | rotateleft rotateright | imageoptions',
                                    toolbar_mode: 'floating',
                                    menubar: 'edit view insert format table',
                                    images_upload_base_path: 'imageProduct/',
                                    file_picker_types: 'image',
                                    file_picker_callback: (cb, value, meta) => {
                                        var input = document.createElement('input');
                                        input.setAttribute('type', 'file');
                                        input.setAttribute('accept', 'image/*');
                                        input.addEventListener('change', (e) => {
                                            const file = e.target.files[0];
                                            if (file.size > 2 * 1024 * 1024) { // Giới hạn kích thước của tệp tin ảnh là 2MB
                                                alert('Kích thước tệp tin quá lớn.');
                                                return;
                                            }
                                            const reader = new FileReader();
                                            reader.addEventListener('load', () => {
                                                var xhr, formData;
                                                xhr = new XMLHttpRequest();
                                                xhr.withCredentials = false;
                                                xhr.open('POST', 'ImageHandle');
                                                xhr.onload = function () {
                                                    var json;
                                                    if (xhr.status != 200) {
                                                        cb('');
                                                        return;
                                                    }

                                                    try {
                                                        json = JSON.parse(xhr.responseText);
                                                        console.log(xhr.responseText);
                                                    } catch (e) {
                                                        console.error('Invalid JSON string:' + e);
                                                    }

                                                    if (!json || typeof json.location != 'string') {
                                                        cb('');
                                                        return;
                                                    }
                                                    var imghtml = 'imageProduct/' + json.location;
                                                    cb(imghtml);
                                                };
                                                formData = new FormData();
                                                formData.append('file', file);
                                                formData.append('product', "1");
                                                xhr.send(formData);
                                            });
                                            reader.readAsDataURL(file);
                                        });
                                        input.click();
                                    },
                                    content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }',
                                    images_upload_url: 'ImageHandle',
                                    automatic_upload: false
                                });
                            </script>



                            <input type="hidden" name="page" value="${page}">
                            <input type="hidden" name="num" value="${num}">
                            <input type="hidden" name="entryperpage" value="${entryperpage}">
                            <input type="hidden" name="check" value="${check}">
                            <div>
                                <button class="btn btn-save" type="submit">Lưu lại</button>
                                <a class="btn btn-cancel" href="/SWP391_LapTop/productAdmin">Hủy bỏ</a>
                            </div>
                        </form>
                    </div>


                </div>

            </div>










        </main>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/plugins/pace.min.js"></script>
        <script>
                                const inpFile = document.getElementById("inpFile");
                                const loadFile = document.getElementById("loadFile");
                                const previewContainer = document.getElementById("imagePreview");
                                const previewContainer = document.getElementById("imagePreview");
                                const previewImage = previewContainer.querySelector(".image-preview__image");
                                const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");
                                inpFile.addEventListener("change", function () {
                                    const file = this.files[0];
                                    if (file) {
                                        const reader = new FileReader();
                                        previewDefaultText.style.display = "none";
                                        previewImage.style.display = "block";
                                        reader.addEventListener("load", function () {
                                            previewImage.setAttribute("src", this.result);
                                        });
                                        reader.readAsDataURL(file);
                                    }
                                });

        </script>
    </body>

</html>
