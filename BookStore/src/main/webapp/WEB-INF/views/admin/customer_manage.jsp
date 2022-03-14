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
                            <h1 class="m-0">Quản lý thông tin khách hàng</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Quản lý khách hàng</li>
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
                            <h3 class="card-title">Bảng thống kê khách hàng</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <p style="color:red;">${msg}</p>
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-8"><h2>Thông tin khách hàng</h2></div>
                                    <div class="col-sm-4">
                                        <a href="<c:url value="/add-customer"/>" class="btn btn-info add-new" style="float: right"><i
                                                class="fa fa-plus"></i> Thêm mới</a>
                                    </div>
                                </div>
                            </div>
                            <form action="<c:url value='/admin/customer/get2'/>" id="formSubmit" method="get">
                                <table id="example2" class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên khách hàng</th>
                                        <th>Địa chỉ</th>
                                        <th>Số điện thoại</th>
                                        <th>Hình ảnh</th>
                                        <th>Tên đăng nhập</th>
                                        <th>Mật khẩu</th>
                                        <th>Trạng thái</th>
    <%--                                    <th>Sửa</th>--%>
    <%--                                    <th>Xóa</th>--%>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        int stt = (int) request.getAttribute("page_id");
                                    %>
                                    <c:forEach items="${list}" var="customer">
                                        <tr>
                                            <td><%=stt%>
                                            </td>
                                            <td>${customer.name}</td>
                                            <td>${customer.address}</td>
                                            <td>${customer.phone}</td>
                                            <td>${customer.avatar}</td>
                                            <td>${customer.username}</td>
                                            <td>${customer.password}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${customer.status == 1}">
                                                        <c:out value="Hiệu lực"/>
                                                    </c:when>
                                                    <c:when test="${customer.status != 1}">
                                                        <c:out value="Không hiệu lực"/>
                                                    </c:when>
                                                </c:choose>
                                            </td>
    <%--                                        <td>--%>
    <%--                                            <a href="<c:url value="/admin/customer/edit-customer/${staff.id}"/>" class="edit"--%>
    <%--                                               title="Edit"><i class="fas fa-pen"></i></a>--%>
    <%--                                        </td>--%>
    <%--                                        <td>--%>
    <%--                                            <a href="<c:url value="/delete-customer/${customer.id}"/>" class="delete"--%>
    <%--                                               title="Delete" onclick="return confirm('Chắc chắn muốn xóa?');"><i--%>
    <%--                                                    class="fas fa-trash-alt"></i></a>--%>
    <%--                                        </td>--%>
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
            <!-- /.content -->

        </div>

        <jsp:include page="footer.jsp"/>
    </div>
    <!-- ./wrapper -->

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
