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
                        <h1 class="m-0">Quản lý loại sản phẩm</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Quản lý loại sản phẩm</li>
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
                        <h3 class="card-title">Chỉnh sửa loại sản phẩm</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="form">
                            <c:url value="/admin/category/edit-category" var="url"/>
                            <form:form modelAttribute="category" method="post" action="${url}">
                                <div class="form-group row">
                                    <form:hidden path="id" value="${category.id}"/>
                                    <label class="col-sm-12 col-form-label">Tên loại sản phẩm</label>
                                    <div class="col-sm-8">
                                        <form:input path="name" class="form-control" value="${category.name}" required="true"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Mức ưu tiên</label>
                                    <div class="col-sm-8">
                                        <form:input path="priority" type="number" class="form-control" value="${category.priority}" required="true"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Mô tả loại sản phẩm</label>
                                    <div class="col-sm-8">
                                        <form:input path="description" class="form-control" value="${category.description}" required="true"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Trạng thái</label>
                                    <div class="col-sm-8">
                                        <c:choose>
                                            <c:when test="${category.status == 1}">
                                                <form:radiobutton path="status" checked="checked" value="1"/>
                                                <label>Hiệu lực</label><br>
                                                <form:radiobutton path="status" value="0"/>
                                                <label>Không hiệu lực</label><br>
                                            </c:when>
                                            <c:when test="${category.status == 0}">
                                                <form:radiobutton path="status" value="1"/>
                                                <label>Hiệu lực</label><br>
                                                <form:radiobutton path="status" checked="checked" value="0"/>
                                                <label>Không hiệu lực</label><br>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="text-end">
                                    <a href="<c:url value="/admin/category/get"/>" class="btn btn-primary">Trở lại</a>
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
