<%--
  Created by IntelliJ IDEA.
  User: hieum
  Date: 12/12/2021
  Time: 4:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Admin</title>
    <jsp:include page="nav.jsp"/>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <jsp:include page="header.jsp"/>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Quản lý nhân viên</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Quản lý nhân viên</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Chỉnh sửa nhân viên</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="form">
                            <c:url value="/admin/staff/edit-staff" var="url"/>
                            <form:form modelAttribute="staff" method="post" action="${url}">
                                <div class="form-group row">
                                    <form:hidden path="id" value="${staff.id}"/>
                                    <label class="col-sm-12 col-form-label">Mã nhân viên</label>
                                    <div class="col-sm-8">
                                        <form:input path="code" class="form-control" value="${staff.code}" required="true"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Tên nhân viên</label>
                                    <div class="col-sm-8">
                                        <form:input path="name" class="form-control" value="${staff.name}" required="true"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Quê quán</label>
                                    <div class="col-sm-8">
                                        <form:input path="address" class="form-control" value="${staff.address}" required="true"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Số điện thoại</label>
                                    <div class="col-sm-8">
                                        <form:input path="phone" class="form-control" value="${staff.phone}" required="true"/>
                                    </div>
                                </div>
<%--                                <div class="form-group row">--%>
<%--                                    <label class="col-sm-12 col-form-label">Ảnh</label>--%>
<%--                                    <div class="col-sm-8">--%>
<%--                                        <form:input path="avatar" class="form-control" value="${staff.avatar}" required="true"/>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Tên đăng nhập</label>
                                    <div class="col-sm-8">
                                        <form:input path="username" class="form-control" value="${staff.username}" required="true"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Mật khẩu</label>
                                    <div class="col-sm-8">
                                        <form:input path="password" class="form-control" value="${staff.password}" required="true"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Chức vụ</label>
                                    <div class="col-sm-8">
                                        <select name="level" class="form-control" required="true">
                                            <c:if test="${staff.level == 1}">
                                                <option value="1">Admin</option>
                                                <option value="2">Nhân viên quản lý</option>
                                                <option value="3">Nhân viên giao hàng</option>
                                            </c:if>
                                            <c:if test="${staff.level == 2}">
                                                <option value="2">Nhân viên quản lý</option>
                                                <option value="1">Admin</option>
                                                <option value="3">Nhân viên giao hàng</option>
                                            </c:if>
                                            <c:if test="${staff.level == 3}">
                                                <option value="3">Nhân viên giao hàng</option>
                                                <option value="1">Admin</option>
                                                <option value="2">Nhân viên quản lý</option>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Trạng thái</label>
                                    <div class="col-sm-8">
                                        <c:choose>
                                            <c:when test="${staff.status == 1}">
                                                <form:radiobutton path="status" checked="checked" value="1"/>
                                                <label>Hiệu lực</label><br>
                                                <form:radiobutton path="status" value="0"/>
                                                <label>Không hiệu lực</label><br>
                                            </c:when>
                                            <c:when test="${staff.status == 0}">
                                                <form:radiobutton path="status" value="1"/>
                                                <label>Hiệu lực</label><br>
                                                <form:radiobutton path="status" checked="checked" value="0"/>
                                                <label>Không hiệu lực</label><br>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="text-end">
                                    <a href="<c:url value="/admin/staff/get"/>" class="btn btn-primary">Trở lại</a>
                                    <input type="submit" class="btn btn-primary" value="Sửa">
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.content -->

    </div>

    <jsp:include page="footer.jsp"/>
</div>
<!-- ./wrapper -->


</body>
</html>
