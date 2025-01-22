<%-- 
    Document   : forgotChangePass
    Created on : May 30, 2023, 2:04:31 AM
    Author     : vinh1
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" />
</head>
<body>
    <!-- Form without bootstrap -->
    <div class="auth-wrapper">
        <div class="auth-container">
            <div class="auth-action-left">
                <div class="auth-form-outer">
                    <h2 class="auth-form-title">
                        Thay đổi mật khẩu
                    </h2>
                    <h2 class="auth-form-title">
                        Email: ${Email}
                    </h2>
                    <form class="login-form" action="forgotChangePass" method="post">
                        <div class="input-icon">
                            <input type="password" class="auth-form-input" placeholder="Mật khẩu mới" name="NewPassword">
                            <i class="fa fa-eye show-password"></i>
                        </div>
                        <div class="input-icon">
                            <input type="password" class="auth-form-input" placeholder="Xác nhận mật khẩu mới" name="ConfirmPassword">
                            <i class="fa fa-eye show-password"></i>
                        </div>
                       <td>${error}</td>
                       <div class="footer-action">
                            <input type="submit" value="Thay đổi mật khẩu" class="auth-submit">
                        </div>
                    </form>
                        <div class="footer-action">
                            <a href="login" class="auth-btn-direct">Đăng Nhập</a>
                            <a href="register" class="auth-btn-direct">Đăng ký</a>
                        </div>
                    <div class="auth-forgot-password">
                        <a href="index.jsp">Group2Com</a>
                    </div>
                </div>
            </div>
            <div class="auth-action-right">
                <div class="auth-image">
                    <img src="image1/lg.jpg" alt="login">
                </div>
            </div>
        </div>
    </div>
    <script src="js/common.js"></script>
</body>
</html>

