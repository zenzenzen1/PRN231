<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
        <c:if test="${param['index']==null }">   
            <c:set var = "index" scope = "page" value = "1"/>
        </c:if>
        <c:if test="${param['index']!=null}">
            <c:set var = "index" scope = "page" value = "${param['index']}"/>
        </c:if>
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
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách đơn hàng</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">

                                    <a class="btn btn-add btn-sm" href="addblog" title="Thêm"><i class="fas fa-plus"></i>
                                        Tạo Blog Mới</a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm nhap-tu-file" type="button" title="Nhập" onclick="myFunction(this)"><i
                                            class="fas fa-file-upload"></i> Tải từ file</a>
                                </div>


                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm" type="button" title="Xóa" onclick="myFunction(this)"><i
                                            class="fas fa-trash-alt"></i> Xóa tất cả </a>
                                </div>
                            </div>
                            <button type="button" id="deleteSelected" class="btn btn-primary">Xóa đã chọn</button>
                            <form style="width: 100%"  method="get" action="list-blog-admin"  id="blogForm">
                                <input type="text" class="form-control" style="width: 20%; display: inline-block" name="search" placeholder="Search by title or author name..." > 


                                <select style="width: 20%; display: inline-block" class="form-control" name="cateID" id="newsTypeSelect">
    <option value="all" ${param.cateID == null || param.cateID.equals('all') ? 'selected' : ''}>All</option>
    <c:forEach var="cate" items="${bcl}">
        <option value="${cate.getNewsTypeID()}" ${param.cateID != null && param.cateID.equals(cate.getNewsTypeID()) ? 'selected' : ''}>
            ${cate.getNewsTypeName()}
        </option>
    </c:forEach>
</select>
                                <button style="padding: 12px 15px" class="btn btn-primary">Go</button>
                            </form>
                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                        <th width="10"><input type="checkbox" id="all"></th>
                                        <th class="text-center">News ID</th>
                                        <th class="text-center" style="width:10%">Title</th>
                                        <th class="text-center" style="width:14%">Admin Name:</th>
                                        <th class="text-center" style="width:25%">Image</th>
                                        <th class="text-center" style="width:14%">Create Date:</th>
                                        <th class="text-center" style="width:14%">News Type :</th>
                                        <th class="text-center" style="width:14%">Action</th>


                                    </tr>
                                </thead>
                                <tbody id="sampleTableBody">
                                    <c:forEach items="${list}" var="b">
                                        <tr>
                                            <td width="10"><input type="checkbox" name="check1" value="${b.getNewsID()}"></td>
                                            <td> ${b.getNewsID()} </td>
                                            <td>${b.getTitle()}</a></td>
                                            <td>${b.getAdminName()}</td>
                                            <td><img alt="" width="100%" src="newsImage/${b.getImage()}" /></td>
                                            <td>${b.getCreateDate()}</td>
                                            <td>${b.getNewTypesName()}</td>

                                            <td>
                                                <button class="btn btn-primary btn-sm trash" type="button" title="Hủy đơn hàng" data-id ="${b.getNewsID()}"
                                                        data-path ="${pageContext.request.contextPath}" 
                                                        data><i class="fas fa-trash-alt"></i> </button>


                                                <a href="edit-blog?id=${b.getNewsID()}"><button class="btn btn-primary btn-sm eye" type="button" title="Edit" >

                                                        <i class="fa fa-edit" aria-hidden="true"></i> 
                                                    </button></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                           <div class="pagination-arena">
    <ul class="pagination">

        <li class="page-item">
            <a href="./list-blog-admin?index=1&search=${param['search']}&cateID=${param['cateID']}" class="page-link">
                <i class="fa fa-angle-left" aria-hidden="true"></i>
            </a>
        </li>
        <li class="page-item">
            <a href="./list-blog-admin?index=${index-2}&search=${param['search']}&cateID=${param['cateID']}" class="page-link ${index-2<1?'d-none':''}">
                ${index-2}
            </a>
        </li>
        <li class="page-item">
            <a href="./list-blog-admin?index=${index-1}&search=${param['search']}&cateID=${param['cateID']}" class="page-link ${index-1<1?'d-none':''}">
                ${index-1}
            </a>
        </li>
        <li class="page-item active">
            <a href="./list-blog-admin?index=${index}&search=${param['search']}&cateID=${param['cateID']}" class="page-link">
                ${index}
            </a>
        </li>
        <li class="page-item">
            <a href="./list-blog-admin?index=${index+1}&search=${param['search']}&cateID=${param['cateID']}" class="page-link ${index+1>numberPage?'d-none':''}">
                ${index+1}
            </a>
        </li>
        <li class="page-item">
            <a href="./list-blog-admin?index=${index+2}&search=${param['search']}&cateID=${param['cateID']}" class="page-link ${index+2>numberPage?'d-none':''}">
                ${index+2}
            </a>
        </li>
        <li>
            <a href="./list-blog-admin?index=${numberPage}&search=${param['search']}&cateID=${param['cateID']}&loadAll=true" class="page-link">
                <i class="fa fa-angle-right" aria-hidden="true"></i>
            </a>
        </li>
    </ul>
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
        <!-- Data table plugin-->
        <!--<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>-->
        <!--<script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>-->
        <!--<script type="text/javascript">$('#sampleTable').DataTable();</script>-->
        <script>
                                        function deleteRow(r) {
                                            var i = r.parentNode.parentNode.rowIndex;
                                            document.getElementById("myTable").deleteRow(i);
                                        }
                                        function getPa(blogID, path) {

                                            window.location.href = path + "/delete-blog?id=" + blogID;

                                        }
                                        jQuery(function () {
                                            jQuery(".trash").click(function () {
                                                var orderID = $(this).data("id");

                                                var path = $(this).data("path");
                                                swal({
                                                    title: "Cảnh báo",
                                                    text: "Bạn có chắc chắn là muốn hủy bỏ blog này?",
                                                    buttons: ["Hủy bỏ", "Đồng ý"]
                                                })
                                                        .then((willDelete) => {
                                                            if (willDelete) {
                                                                getPa(orderID, path);
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
                                        //EXCEL
                                        // $(document).ready(function () {
                                        //   $('#').DataTable({

                                        //     dom: 'Bfrtip',
                                        //     "buttons": [
                                        //       'excel'
                                        //     ]
                                        //   });
                                        // });
        </script>
        <script>
          function submitForm(event, index) {
    event.preventDefault(); // Prevent the default link behavior
    document.getElementById("blogForm").setAttribute("action", `list-blog-admin?index=${index}`);
    document.getElementById("blogForm").submit(); // Submit the form
}
        </script>
        <script>
  function loadPage(index) {
    // Send AJAX request to fetch data for the selected page
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'list-blog-admin?index=' + index, true);
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4 && xhr.status === 200) {
        // Update the content of the table with the fetched data
        var tableBody = document.getElementById('sampleTableBody');
        tableBody.innerHTML = xhr.responseText;
      }
    };
    xhr.send();
  }
</script>

        
        <script>

            $(function () {
                $("#deleteSelected").click(function () {
                    var selectedNews = [];
                    // Loop through all the checked checkboxes
                    $("#sampleTable tbody :checkbox:checked").each(function () {
                        var NewsID = $(this).val(); // Get the ID of the news from the checkbox value
                        selectedNews.push(NewsID); // Add the news ID to the selectedNews array
                    });
                    if (selectedNews.length > 0) {
                        swal({
                            title: "Cảnh báo",
                            text: "Bạn có chắc chắn muốn xóa các sản phẩm đã chọn?",
                            buttons: ["Hủy bỏ", "Đồng ý"],
                        }).then(function (willDelete) {
                            if (willDelete) {
                                // Redirect to a URL with the list of selected news IDs
                                window.location.href = "/SWP391_LapTop/delete-checkbox-news?ids=" + selectedNews.join(",");
                            }
                        });
                    } else {
                        swal("Cảnh báo", "Vui lòng chọn ít nhất một News để xóa.", "warning");
                    }
                });
            }
            );

        </script>


        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    </body>

</html>
