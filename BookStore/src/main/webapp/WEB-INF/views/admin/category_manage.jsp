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
                            <h3 class="card-title">Bảng thống kê loại sản phẩm</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <p style="color:red;">${msg}</p>
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-8"><h2>Thể loại</h2></div>
                                    <div class="col-sm-4">
                                        <a href="<c:url value="/admin/add-category"/>" class="btn btn-info add-new" style="float: right">
                                            <i class="fa fa-plus"></i> Thêm mới</a>
                                    </div>
                                </div>
                            </div>
                            <form action="<c:url value='/admin/category/get2'/>" id="formSubmit" method="get">
                                <table id="example2" class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã loại sản phẩm</th>
                                        <th>Tên loại sản phẩm</th>
                                        <th>Mức độ ưu tiên</th>
                                        <th>Mô tả thể loại</th>
                                        <th>Thể loại cha</th>
                                        <th>Trạng thái</th>
                                        <th>Sửa</th>
                                        <th>Xóa</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        int stt = (int) request.getAttribute("page_id");
                                    %>
                                    <c:forEach items="${list}" var="category">
                                        <tr>
                                            <td><%=stt%>
                                            </td>
                                            <td>${category.code}</td>
                                            <td>${category.name}</td>
                                            <td>${category.priority}</td>
                                            <td>${category.description}</td>
                                            <td>${category.type}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${category.status == 1}">
                                                        <c:out value="Hiệu lực"/>
                                                    </c:when>
                                                    <c:when test="${category.status != 1}">
                                                        <c:out value="Không hiệu lực"/>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <a href="<c:url value="/admin/category/edit-category/${category.id}"/>" class="edit"
                                                   title="Edit"><i class="fas fa-pen"></i></a>
                                            </td>
                                            <td>
                                                <a href="<c:url value="/delete-category/${category.id}"/>" class="delete"
                                                   title="Delete" onclick="return confirm('Chắc chắn muốn xóa?');"><i
                                                        class="fas fa-trash-alt"></i></a>
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
                visiblePages: 5,
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
