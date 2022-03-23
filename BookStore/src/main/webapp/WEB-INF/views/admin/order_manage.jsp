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
                                    <br>
                                    <form id="frm_config" action="<c:url value='/admin/order/get2'/>" method="get">
                                        <label class="pull-right m-2"> Nhập mã đơn hàng: </label>
                                        <input value="${txt_search}" type="number" id="txt_search" name="txt_search" class="pull-right m-2" placeholder="Giá trị mã đơn hàng" />
                                        <select id="cbx_status" name="cbb_status" class="pull-right m-2">
                                            <c:if test="${cbb_status == null}">
                                                <option value=""> -- Trạng thái đơn hàng -- </option>
                                                <option value="1">Hiệu lực</option>
                                                <option value="2">Đã phê duyệt</option>
                                                <option value="3">Đã giao cho shipper</option>
                                                <option value="4">Đơn hàng đã hoàn thành</option>
                                                <option value="0">Đơn hàng đã hủy</option>
                                            </c:if>
                                            <c:if test="${cbb_status == 1}">
                                                <option value="1">Hiệu lực</option>
                                                <option value=""> -- Trạng thái đơn hàng -- </option>
                                                <option value="2">Đã phê duyệt</option>
                                                <option value="3">Đã giao cho shipper</option>
                                                <option value="4">Đơn hàng đã hoàn thành</option>
                                                <option value="0">Đơn hàng đã hủy</option>
                                            </c:if>
                                            <c:if test="${cbb_status == 2}">
                                                <option value="2">Đã phê duyệt</option>
                                                <option value=""> -- Trạng thái đơn hàng -- </option>
                                                <option value="1">Hiệu lực</option>
                                                <option value="3">Đã giao cho shipper</option>
                                                <option value="4">Đơn hàng đã hoàn thành</option>
                                                <option value="0">Đơn hàng đã hủy</option>
                                            </c:if>
                                            <c:if test="${cbb_status == 3}">
                                                <option value="3">Đã giao cho shipper</option>
                                                <option value=""> -- Trạng thái đơn hàng -- </option>
                                                <option value="1">Hiệu lực</option>
                                                <option value="2">Đã phê duyệt</option>
                                                <option value="4">Đơn hàng đã hoàn thành</option>
                                                <option value="0">Đơn hàng đã hủy</option>
                                            </c:if>
                                            <c:if test="${cbb_status == 4}">
                                                <option value="4">Đơn hàng đã hoàn thành</option>
                                                <option value=""> -- Trạng thái đơn hàng -- </option>
                                                <option value="1">Hiệu lực</option>
                                                <option value="2">Đã phê duyệt</option>
                                                <option value="3">Đã giao cho shipper</option>
                                                <option value="0">Đơn hàng đã hủy</option>
                                            </c:if>
                                            <c:if test="${cbb_status == 0}">
                                                <option value="0">Đơn hàng đã hủy</option>
                                                <option value=""> -- Trạng thái đơn hàng -- </option>
                                                <option value="1">Hiệu lực</option>
                                                <option value="2">Đã phê duyệt</option>
                                                <option value="3">Đã giao cho shipper</option>
                                                <option value="4">Đơn hàng đã hoàn thành</option>
                                            </c:if>
                                        </select>
                                        <input type="hidden" value="${page}" id="pagehidden" name="page"/>
                                        <input type="hidden" value="${maxPageItem}" id="maxPageItemhidden" name="maxPageItem"/>
                                        <button class="pull-right btn btn-success m-2" id="btn_search">Tìm kiếm </button>
                                    </form>
                                </div>
                            </div>
                            <form action="<c:url value='/admin/order/get2'/>" id="formSubmit" method="get">
                                <table id="example2" class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã đơn hàng</th>
                                        <th>Mã khách hàng</th>
                                        <th>Số sản phẩm mua</th>
                                        <th>Tổng tiền</th>
                                        <th>Địa chỉ giao hàng</th>
                                        <th>Trạng thái</th>
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
                                <input type="hidden" value="${cbb_status}" id="status" name="cbb_status"/>
                                <input type="hidden" value="${txt_search}" id="search" name="txt_search"/>
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
