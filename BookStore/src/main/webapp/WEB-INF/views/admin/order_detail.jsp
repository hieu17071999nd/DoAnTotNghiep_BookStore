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
                            <h1 class="m-0">Chi tiết đơn hàng</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Chi tiết đơn hàng</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-left: 10px; margin-right: 10px">
                <div class="col-lg-12">
                    <p><b>Mã đơn hàng:</b>${orderDto.order.id}</p>
                    <p><b>Mã khách hàng:</b>${orderDto.customer.id}</p>
                    <p><b>Tên khách hàng:</b>${orderDto.customer.name}</p>
                    <p><b>Email:</b>${orderDto.customer.email}</p>
                    <p><b>SĐT:</b>0${orderDto.customer.phone}</p>
                    <p><b>Thời gian đặt hàng:</b>${orderDto.order.createDate}</p>
                    <p><b>Địa chỉ giao hàng:</b>${orderDto.order.deliveryAddress}</p>
                        <table id="example2" class="table table-bordered table-hover" style="text-align: center">
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
                            <c:forEach items="${orderDto.orderItems}" var="item">
                                <tr>
                                    <td class="cart-pic first-row"><img width="100" src="<c:url value="/resources/images/product/${item.image}"/>" alt=""></td>
                                    <td class="cart-title first-row" style="text-align: left">${item.name}</td>
<%--                                    <input id="price1${item.id}" type="hidden" value="${item.price}">--%>
                                    <td id="price${item.id}" class="p-price first-row">${item.price}</td>
<%--                                    <input style="display: none" type="number" id="num${item.id}" value="${item.number}">--%>
                                    <td class="qua-col first-row"><span>${item.number}</span>
                                    </td>
<%--                                    <input id="money1${item.id}" type="hidden" value="${item.itemMoney}">--%>
                                    <td id="money${item.id}" class="total-price first-row">${item.itemMoney}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <br>
                        <div style="float: right; margin-right: 250px; margin-bottom: 20px">
<%--                        <div>--%>
<%--                            <input id="m1${orderDto.order.id}" type="hidden" value="${orderDto.order.total}">--%>
                            <h5><b>Tổng tiền: <span id="m${orderDto.order.id}">${orderDto.order.total} VND</span></b></h5>
<%--                            <h6>Tình trạng:${orderDto.order.status}</h6>--%>
                        </div>
                    <br><br><br>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            debugger;
<%--            <c:forEach items="${orderDto.orderItems}" var="item">--%>
<%--                var price = $("#price1${item.id}").val();--%>
<%--                $("#price${item.id}").text(new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(price));--%>
<%--                var money = $("#money1${item.id}").val();--%>
<%--                $("#money${item.id}").text(new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(money));--%>
<%--            </c:forEach>--%>
<%--            var total = $("#m1${orderDto.order.id}").val();--%>
<%--            $("#m${orderDto.order.id}").text(new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(total));--%>
        });
    </script>
    </body>
</html>
