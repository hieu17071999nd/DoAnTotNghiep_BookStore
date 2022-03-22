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
                            <h1 class="m-0">Chọn nhân viên vận chuyển</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Chọn nhân viên vận chuyển</li>
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
                            <h3 class="card-title">Chọn nhân viên vận chuyển</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <form method="post" action="<c:url value="/transportOrder"/>">
                                <div class="form-group row">
                                    <input type="hidden" name="id" value="${id}">
                                    <label class="col-sm-12 col-form-label">Chọn nhân viên vận chuyển</label>
                                    <div class="col-sm-8">
                                        <option value="">--Lựa chọn--</option>
                                        <select name="staff_id" class="form-control" required="true">
                                            <c:forEach items="${staffTransports}" var="staffTransport">
                                                <option value="${staffTransport.id}">${staffTransport.code} - ${staffTransport.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="text-end">
                                    <a href="<c:url value="/admin/order/shipper/get"/>" class="btn btn-primary">Trở lại</a>
                                    <input type="submit" class="btn btn-primary" value="Chuyển giao">
                                </div>
                            </form>
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
