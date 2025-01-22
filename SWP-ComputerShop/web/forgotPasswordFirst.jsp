<%-- 
    Document   : changePasswordFirst
    Created on : May 14, 2023, 9:20:39 PM
    Author     : Admin
--%>

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
                        Thay đổi mật  khẩu
                    </h2>
                    <div class="auth-external-container">
                        
                        <p class="auth-sgt">Nhập email or số điện thoại để cấp lại mật khẩu</p>
                    </div>
                    <form class="login-form" action="">
                        <input type="email" class="auth-form-input" placeholder="Enter email">
                        
                        <div class="footer-action">
                            <a href="changePasswordContinue.jsp" class="auth-btn-direct">Tiếp tục</a>
                        </div>
                    </form>
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