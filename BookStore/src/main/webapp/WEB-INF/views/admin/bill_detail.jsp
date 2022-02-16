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
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Quản lý hóa đơn</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Quản lý hóa đơn</li>
                            </ol>
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->

            <!-- Main content -->
            <div class="row">
                <div class="col-lg-12">
                    <p><b>Mã khách hàng:</b>${bill.customer.id}</p>
                    <p><b>Tên khách hàng:</b>${bill.customer.name}</p>
                    <p><b>Email:</b>${bill.customer.email}</p>
                    <p><b>SĐT:</b>${bill.customer.phone}</p>
<%--                    <p><b>Thời gian đặt hàng:</b>${bill.date}</p>--%>
                    <p><b>Địa chỉ giao hàng:</b>${bill.bill.deliveryAddress}</p>
                        <table id="example2" class="table table-bordered table-hover">
                            <colgroup>
                                <col width="20%" span="1">
                                <col width="20%" span="1">
                                <col width="20%" span="1">
                                <col width="20%" span="1">
                                <col width="20%" span="1">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>Ảnh sản phẩm</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá sản phẩm</th>
                                <th>Số sản phẩm</th>
                                <th>Thành tiền</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${bill.orderItems}" var="item">
                                <tr>
                                    <td class="cart-pic first-row"><img width="100" src="<c:url value="/resources/images/product/${item.image}"/>" alt=""></td>
                                    <td class="cart-title first-row">${item.name}</td>
                                    <input id="price1${item.id}" type="hidden" value="${item.price}">
                                    <td id="price${item.id}" class="p-price first-row"></td>
                                    <input style="display: none" type="number" id="num${item.id}" value="${item.number}">
                                    <td class="qua-col first-row"><span>  x  ${item.number}</span>
                                    </td>
                                    <input id="money1${item.id}" type="hidden" value="${item.itemMoney}">
                                    <td id="money${item.id}" class="total-price first-row"></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <br>
                        <div style="float: right">
                            <input id="m1${bill.bill.id}" type="hidden" value="${bill.bill.total}">
                            <h5><b>Tổng tiền <span id="m${bill.bill.id}"></span></b></h5>
                            <h6>Tình trạng:${bill.bill.status}</h6>
                        </div>
                    <br><br><br>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>
    <script>
        $(document).ready(function () {
            <c:forEach items="${bill.orderItems}" var="item">
            var price = $("#price1${item.id}").val();
            $("#price${item.id}").text(new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(price));
            var money = $("#money1${item.id}").val();
            $("#money${item.id}").text(new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(money));
            </c:forEach>
            var money1 = $("#m1${bill.bill.id}").val();
            $("#m${bill.bill.id}").text(new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(money1));
        });
    </script>
    </body>
</html>
