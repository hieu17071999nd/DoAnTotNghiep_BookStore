<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <!-- Google Font: Source Sans Pro -->
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
</head>
<body>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="<c:url value="/trang-chu"/>" class="brand-link">
        <span class="brand-text font-weight-light">Book Store</span>
    </a>

    <div class="sidebar">
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="info">
                <a href="#" class="d-block">Vũ Minh Hiếu</a>
            </div>
        </div>

        <!-- SidebarSearch Form -->
        <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/admin/home"/>">
                        <p>
                            Trang quản lý admin
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/admin/category/get"/>">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            Quản lý thể loại
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/admin/staff/get"/>">
                        <i class="nav-icon fas fa-users"></i>
                        <p>
                            Quản lý nhân viên
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/admin/customer/get"/>">
                        <i class="nav-icon fas fa-user-friends"></i>
                        <p>
                            Quản lý khách hàng
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/admin/product/get"/>">
                        <i class="nav-icon fas fa-address-book"></i>
                        <p>
                            Quản lý sản phẩm
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/admin/order/approve/get"/>">
                        <i class="nav-icon fas fa-key"></i>
                        <p>
                            Phê duyệt đơn hàng
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/admin/order/transport/shipper/get"/>">
                        <i class="nav-icon fas fa-bicycle"></i>
                        <p>
                            Giao hàng cho shipper
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/admin/order/shipper/get"/>">
                        <i class="nav-icon fas fa-train"></i>
                        <p>
                            Shipper giao hàng
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/admin/order/get"/>">
                        <i class="nav-icon fas fa-book-open"></i>
                        <p>
                            Quản lý đơn hàng
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
</body>
</html>
