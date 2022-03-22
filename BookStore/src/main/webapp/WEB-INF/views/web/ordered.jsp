<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Giỏ hàng</title>
</head>
<body class="tg-home tg-homeone">
<div id="tg-wrapper" class="tg-wrapper tg-haslayout">

    <jsp:include page="header.jsp"/>

    <div class="register-login-section spad" style="padding-top: 100px; padding-left: 100px">
        <div class="container" style="margin-top: 100px">
            <h3 style="align-content: center">Danh sách đơn hàng đang đặt</h3>
            <div class="row">
                <div class="col-lg-12">
                    <c:forEach items="${orderDtos}" var="orderDto">
                        <div class="cart-table">
                            <table>
                                <thead>
                                <tr>
                                    <th>Ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                    <th>Thành tiền</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${orderDto.orderItems}" var="orderItem">
                                    <tr>
    <%--                                    <td><input style="margin-left: 20px;" type="checkbox" class="form-check-input" id="${itemDto.item.id}"/></td>--%>
                                        <td class="cart-pic first-row"><img width="100" src="<c:url value="/resources/images/product/${orderItem.image}"/>" alt=""></td>
                                        <td class="cart-title first-row">
                                            <a href="<c:url value="/product/${orderItem.id}"/>">
                                                <h5>${orderItem.name}</h5>
                                            </a>
                                        </td>
                                        <input id="price1${orderItem.id}" type="hidden" value="${orderItem.price}">
                                        <td id="price${orderItem.id}" class="p-price first-row"></td>
                                            <input style="display: none" type="number" id="num${orderItem.id}" value="${orderItem.number}">
                                        <td class="qua-col first-row">
                                            <div class="quantity">
                                                <div class="pro-qty">
                                                    <input id="number${orderItem.id}" readonly type="text" value="${orderItem.number}">
                                                </div>
                                            </div>
                                        </td>
                                        <input id="money1${orderItem.id}" type="hidden" value="${orderItem.itemMoney}">
                                        <td id="money${orderItem.id}" class="total-price first-row"></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 offset-lg-4">
                                <div class="proceed-checkout">
                                    <ul>
                                        <input id="total_money1${orderDto.order.id}" type="hidden"/>
                                        <li class="cart-total">Thành tiền <span id="total_money${orderDto.order.id}"></span></li>
                                    </ul>
                                    <br>
                                </div>
                            </div>
                        </div>
                        <hr>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>

    <script>
        $(document).ready(function (){
            <c:forEach items="${orderDtos}" var="orderDto">
                <c:forEach items="${orderDto.orderItems}" var="orderItem">
                    var price=$("#price1${orderItem.id}").val();
                    $("#price${orderItem.id}").text(new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price));
                    var money=$("#money1${orderItem.id}").val();
                    $("#money${orderItem.id}").text(new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(money));
                </c:forEach>
            </c:forEach>

            <c:forEach items="${orderDtos}" var="orderDto">
            var totalMoney=0;
                <c:forEach items="${orderDto.orderItems}" var="orderItem">
                    debugger;
                    totalMoney+=parseInt($('#money1${orderItem.id}').val());
                    $("#total_money1${orderDto.order.id}").val(totalMoney);
                    var show=$("#total_money1${orderDto.order.id}").val();
                    $("#total_money${orderDto.order.id}").text(new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(show));
                    debugger;
                </c:forEach>
            </c:forEach>
        });
    </script>
</div>
</body>
</html>
