<%--
  Created by IntelliJ IDEA.
  User: hieum
  Date: 1/31/2022
  Time: 12:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <<!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link href="<c:url value="/template/admin/plugins/fontawesome-free/css/all.min.css"/>" rel="stylesheet">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link href="<c:url value="/template/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css"/>" rel="stylesheet">
    <!-- iCheck -->
    <link href="<c:url value="/template/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css"/>" rel="stylesheet">
    <!-- JQVMap -->
    <link href="<c:url value="/template/admin/plugins/jqvmap/jqvmap.min.css"/>" rel="stylesheet">
    <!-- Theme style -->
    <link href="<c:url value="/template/admin/dist/css/adminlte.min.css"/>" rel="stylesheet">
    <!-- overlayScrollbars -->
    <link href="<c:url value="/template/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css"/>" rel="stylesheet">
    <!-- Daterange picker -->
    <link href="<c:url value="/template/admin/plugins/daterangepicker/daterangepicker.css"/>" rel="stylesheet">
    <!-- summernote -->
    <link href="<c:url value="/template/admin/plugins/summernote/summernote-bs4.min.css"/>" rel="stylesheet">
    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            width: 100%;
            max-width: 330px;
            padding: 15px;
            margin: auto;
        }

        .form-signin .form-floating:focus-within {
            z-index: 2;
        }

        .form-signin input[type="text"] {
            margin-bottom: 10px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</head>
<body>
    <main class="form-signin">
        <form action="<c:url value="/check"/>" method="post">
            <h1 class="h3 mb-3 fw-normal">Quản trị website</h1><br>
            <div class="form-floating">
                <input name="username" type="text" class="form-control" placeholder="Username">
            </div>
            <div class="form-floating">
                <input name="password" type="password" class="form-control" placeholder="Password">
            </div>
            <button class="w-100 btn btn-lg btn-primary" type="submit">Đăng nhập</button>
            <br><br>
            <p style="color: red">${check}</p>
        </form>
    </main>
</body>
</html>
