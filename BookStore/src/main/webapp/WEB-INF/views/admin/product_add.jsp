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
                            <h1 class="m-0">Quản lý sản phẩm</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Quản lý sản phẩm</li>
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
                            <h3 class="card-title">Thêm mới sản phẩm</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <form method="post" modelAttribute="product" action="<c:url value="/admin/product/add"/>" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Tên sản phẩm</label>
                                    <div class="col-sm-8">
                                        <input type="text" name="name" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Giá sản phẩm</label>
                                    <div class="col-sm-8">
                                        <input type="number" name="price" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Số lượng sản phẩm</label>
                                    <div class="col-sm-8">
                                        <input type="number" name="quantily" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Hình ảnh sản phẩm</label>
                                    <div class="col-sm-8">
                                        <input type="file" name="file" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Mô tả sản phẩm</label>
                                    <div class="col-sm-8">
                                        <input type="text" name="description" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Thể loại</label>
                                    <select name="category_id" class="form-control" required="true">
                                        <c:forEach items="${categories}" var="category">
                                            <option value="${category.id}">${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-form-label">Trạng thái</label>
                                    <div class="col-sm-8">
                                        <input type="radio" id="status1" name="status" value="1">
                                        <label for="status1">Hiệu lực</label><br>
                                        <input type="radio" id="status0" name="status" value="0">
                                        <label for="status0">Không hiệu lực</label><br>
                                    </div>
                                </div>
                                <div class="text-end">
                                    <a href="<c:url value="/admin/product/get"/>" class="btn btn-primary">Trở lại</a>
                                    <input type="submit" class="btn btn-primary" value="Thêm">
                                </div>
                            </form>
                        </div>

<%--                                <c:url value="/admin/product/add" var="url"/>--%>
<%--                                <form:form modelAttribute="product" method="post" action="${url}" enctype="multipart/form-data">--%>
<%--                                    <div class="form-group">--%>
<%--                                        <label>Tên sản phẩm</label>--%>
<%--                                        <form:input path="name" class="form-control" required="true"/>--%>
<%--                                        <label>Giá</label>--%>
<%--                                        <form:input type="number" path="price" class="form-control" required="true"/>--%>
<%--                                        <label>Ảnh</label>--%>
<%--                                        <input type="file" name="file" class="form-control"/>--%>
<%--                                    </div>--%>
<%--                                    <br>--%>
<%--                                    <div class="text-end">--%>
<%--                                        <input type="reset" class="btn btn-primary" value="Reset">--%>
<%--                                        <input type="submit" class="btn btn-primary" value="Thêm">--%>
<%--                                    </div>--%>
<%--                                </form:form>--%>
<%--                            </div>--%>
<%--                        </div>--%>
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
