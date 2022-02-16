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
                            <h3 class="card-title">Chỉnh sửa sản phẩm</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div class="form">
                                <c:url value="/admin/product/edit" var="url"/>
                                <form:form modelAttribute="productDto" method="post" action="${url}" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <div class="form-group row">
                                            <form:hidden path="product.id" value="${productDto.product.id}"/>
                                            <label class="col-sm-12 col-form-label">Tên sản phẩm</label>
                                            <div class="col-sm-8">
                                                <form:input type="text" path="product.name" class="form-control" value="${productDto.product.name}" required="true"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-form-label">Giá sản phẩm</label>
                                            <div class="col-sm-8">
                                                <form:input type="number" path="product.price" class="form-control" value="${productDto.product.price}" required="true"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-form-label">Hình ảnh sản phẩm</label>
                                            <div class="col-sm-8">
                                                <form:hidden path="product.image" value="${productDto.product.image}"/>
                                                <label>${productDto.product.image}</label>
                                                <input type="file" name="file" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-form-label">Mô tả sản phẩm</label>
                                            <div class="col-sm-8">
                                                <form:input type="text" path="product.description" class="form-control" value="${productDto.product.description}" required="true"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-form-label">Số lượng sản phẩm</label>
                                            <div class="col-sm-8">
                                                <form:input type="text" path="product.quantily" class="form-control" value="${productDto.product.quantily}" required="true"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-form-label">Thể loại</label>
                                            <select name="category_id" class="form-control" required="true">
                                                <option value="${productDto.category.id}">${productDto.category.name}</option>
                                                <c:forEach items="${categories}" var="category">
                                                    <c:if test="${category.id!=productDto.product.categoryId}">
                                                        <option value="${category.id}">${category.name}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-form-label">Trạng thái</label>
                                            <div class="col-sm-8">
                                                <c:choose>
                                                    <c:when test="${productDto.product.status == 1}">
                                                        <form:radiobutton path="product.status" checked="checked" value="1"/>
                                                        <label>Hiệu lực</label><br>
                                                        <form:radiobutton path="product.status" value="0"/>
                                                        <label>Không hiệu lực</label><br>
                                                    </c:when>
                                                    <c:when test="${productDto.product.status == 0}">
                                                        <form:radiobutton path="product.status" value="1"/>
                                                        <label>Hiệu lực</label><br>
                                                        <form:radiobutton path="product.status" checked="checked" value="0"/>
                                                        <label>Không hiệu lực</label><br>
                                                    </c:when>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="text-end">
                                        <input type="reset" class="btn btn-primary" value="Reset">
                                        <input type="submit" class="btn btn-primary" value="Sửa">
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>
    </body>
</html>
