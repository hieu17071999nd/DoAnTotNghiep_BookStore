<%--
  Created by IntelliJ IDEA.
  User: hieum
  Date: 12/12/2021
  Time: 4:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Quản lý hóa đơn</title>
    <jsp:include page="nav.jsp"/>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
        <jsp:include page="header.jsp"/>
        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Quản lý đơn hàng</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Quản lý đơn hàng</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Bảng thống kê đơn hàng</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <p style="color:red;">${msg}</p>
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-8"><h2>Đơn hàng đã đặt</h2></div>
                                </div>
                            </div>
                            <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>Stt</th>
                                    <th>Mã đơn hàng</th>
                                    <th>Mã khách hàng</th>
                                    <th>Số sản phẩm mua</th>
                                    <th>Tổng tiền</th>
                                    <th>Địa chỉ giao hàng</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                    <th>Chi tiết đơn hàng</th>
<%--                                    <th>Xem luồng đơn hàng</th>--%>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    int stt = (int) request.getAttribute("page_id");
                                %>
                                <c:forEach items="${orders}" var="order">
                                    <tr>
                                        <td><%=stt%></td>
                                        <td>${order.id}</td>
                                        <td>${order.customerId}</td>
                                        <td>${order.numerOrderItem}</td>
                                        <td>${order.total}</td>
                                        <td>${order.deliveryAddress}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${order.status == 1}">
                                                    <c:out value="Đã đặt hàng"/>
                                                </c:when>
                                                <c:when test="${order.status == 0}">
                                                    <c:out value="Không hiệu lực"/>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="<c:url value="/approve/${order.id}"/>" title="Duyệt đơn hàng">
                                                <i class="fas fa-key"></i>
                                            </a>
                                            <a href="<c:url value="/getXMLOrder/${order.id}"/>" title="Xem luồng đơn hàng">
                                                <i class="fas fa-project-diagram"></i>
                                            </a>
                                            <a href="<c:url value="/cancle/${order.id}"/>" class="delete" title="Hủy đơn hàng"><i class="fas fa-trash-alt"></i>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="<c:url value="/admin/order/${order.id}"/>" title="Chi tiết đơn hàng">
                                                <i class="fas fa-info-circle"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                        stt++;
                                    %>
                                </c:forEach>
                                </tbody>
                            </table>
                            <br>
                            <ul class="pagination" id="pagination"></ul>
                            <input type="hidden" value="" id="page" name="page"/>
                            <input type="hidden" value="" id="limit" name="limit"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>
    </body>
</html>
