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
                            <h1 class="m-0">Quản lý đơn hàng đang giao</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Quản lý đơn hàng đang giao</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Bảng thống kê đơn hàng đang giao của shipper</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <p style="color:red;">${msg}</p>
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-8"><h2>Đơn hàng đang giao</h2></div>
                                </div>
                            </div>
                            <form action="<c:url value='/admin/order/shipper/get2'/>" id="formSubmit" method="get">
                                <table id="example2" class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã đơn hàng</th>
                                        <th>Mã khách hàng</th>
                                        <th>Số sản phẩm mua</th>
                                        <th>Tổng tiền</th>
                                        <th>Địa chỉ giao hàng</th>
                                        <th>Ngày đặt hàng</th>
                                        <th>Trạng thái</th>
                                        <th>Xác nhận giao hàng thành công</th>
                                        <th>Hủy đơn hàng</th>
                                        <th>Xem luồng đơn hàng</th>
                                        <th>Chi tiết đơn hàng</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        int stt = (int) request.getAttribute("page_id");
                                    %>
                                    <c:forEach items="${list}" var="order">
                                        <tr>
                                            <td><%=stt%></td>
                                            <td>${order.id}</td>
                                            <td>${order.customerId}</td>
                                            <td>${order.numerOrderItem}</td>
                                            <td>${order.total}</td>
                                            <td>${order.deliveryAddress}</td>
                                            <td>${order.createDate}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${order.status == 0}">
                                                        <c:out value="Không hiệu lực"/>
                                                    </c:when>
                                                    <c:when test="${order.status == 1}">
                                                        <c:out value="Đã đặt hàng"/>
                                                    </c:when>
                                                    <c:when test="${order.status == 2}">
                                                        <c:out value="Đã phê duyệt"/>
                                                    </c:when>
                                                    <c:when test="${order.status == 3}">
                                                        <c:out value="Đã chuyển cho shipper"/>
                                                    </c:when>
                                                    <c:when test="${order.status == 4}">
                                                        <c:out value="Giao hàng thành công"/>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <a href="<c:url value="/successfulDeliveryConfirm/${order.id}"/>" class="delete" title="Xác nhận giao hàng thành công">
                                                    <i class="fas fa-toolbox"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="<c:url value="/cancel2/${order.id}"/>" class="delete" title="Hủy đơn hàng">
                                                    <i class="fas fa-trash-alt"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="<c:url value="/getXMLOrder/${order.id}"/>" title="Xem luồng đơn hàng">
                                                    <i class="fas fa-project-diagram"></i>
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
                                <input type="hidden" value="" id="page" name="page"/>
                                <input type="hidden" value="" id="maxPageItem" name="maxPageItem"/>
                            </form>
                            <br>
                            <ul class="pagination" id="pagination" style="margin-left: 300px"></ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>

    <script type="text/javascript">
        $(function () {
            debugger;
            var totalPages = ${totalPage};
            var currentPage = ${page};
            var limit = 5;
            window.pagObj = $('#pagination').twbsPagination({
                totalPages: totalPages,
                visiblePages: 10,
                startPage: currentPage,
                onPageClick: function (event, page) {
                    if (currentPage != page) {
                        $('#maxPageItem').val(limit);
                        $('#page').val(page);
                        $('#formSubmit').submit();
                    }
                    console.info(page + ' (from options)');
                }
            }).on('page', function (event, page) {
                console.info(page + ' (from event listening)');
            });
        });
    </script>
    </body>
</html>
