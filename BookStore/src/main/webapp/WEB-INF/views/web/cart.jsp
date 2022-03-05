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

    <!-- Login Section Begin -->
    <div class="register-login-section spad" style="padding-top: 100px; padding-left: 100px">
        <div class="container" style="margin-top: 100px">
            <h3 style="align-content: center">Danh sách sản phẩm</h3>
            <div class="row">
                <div class="col-lg-12">
                    <div class="cart-table">
                        <table>
                            <thead>
                            <tr>
                                <th></th>
                                <th>Ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                                <th><i class="ti-close">Xóa</i></th>
                            </tr>
                            </thead>
                            <tbody>
                            <input style="display: none" type="number" id="num">
                            <c:forEach items="${itemDtos}" var="itemDto">
                                <tr>
                                    <td><input style="margin-left: 20px;" type="checkbox" class="form-check-input" id="${itemDto.item.id}"/></td>
                                    <td class="cart-pic first-row"><img width="100" src="<c:url value="/resources/images/product/${itemDto.product.image}"/>" alt=""></td>
                                    <td class="cart-title first-row">
                                        <a href="<c:url value="/product/${itemDto.product.id}"/>">
                                            <h5>${itemDto.product.name}</h5>
                                        </a>
<%--                                        <h6>Size:${item.detailProduct.size},Màu:${item.detailProduct.color}</h6>--%>
                                    </td>
                                    <input id="price1${itemDto.item.id}" type="hidden" value="${itemDto.product.price}">
                                    <td id="price${itemDto.item.id}" class="p-price first-row"></td>
                                        <input style="display: none" type="number" id="num${itemDto.item.id}" value="${itemDto.item.number}">
                                    <td class="qua-col first-row">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input id="number${itemDto.item.id}" readonly type="text" value="${itemDto.item.number}">
                                            </div>
                                        </div>
                                    </td>
                                    <input id="money1${itemDto.item.id}" type="hidden" value="${itemDto.itemMoney}">
                                    <td id="money${itemDto.item.id}" class="total-price first-row"></td>
                                    <td class="close-td first-row">
                                        <a class="btn btn-outline-dark" href="<c:url value="/delete-item/${itemDto.item.id}"/>"><i class="ti-close">x</i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="cart-buttons">
                                <input type="submit" id="update_btn" value="Cập nhật giỏ hàng" class="primary-btn up-cart">
                            </div>
                        </div>
                        <div class="col-lg-4 offset-lg-4">
                            <div class="proceed-checkout">
                                <ul>
                                    <input id="total_money1" type="hidden"/>
                                    <li class="cart-total">Tổng tiền <span id="total_money"></span></li>
                                </ul>
                                <br>
                                <button id="checkout" class="proceed-btn">Mua ngay</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Login Form Section End -->
    <jsp:include page="footer.jsp"/>

    <script>
        $(document).ready(function (){
            <c:forEach items="${itemDtos}" var="itemDto">
            var price=$("#price1${itemDto.item.id}").val();
            $("#price${itemDto.item.id}").text(new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price));
            var money=$("#money1${itemDto.item.id}").val();
            $("#money${itemDto.item.id}").text(new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(money));
            </c:forEach>

            $("#update_btn").click(function (){
                <c:forEach items="${itemDtos}" var="itemDto">
                var tonkho=$("#num${itemDto.item.id}").val();
                var sl=$("#number${itemDto.item.id}").val();
                var old_sl=${itemDto.item.number}
                if(parseInt(sl)>tonkho){
                    alert("Quá số lượng cho phép");
                    return false;
                }else {
                    if(old_sl!=sl){
                        $.ajax({
                            url:"<c:url value="/update-cart"/>",
                            type:"get",
                            data:{
                                itemId:${itemDto.item.id},
                                number:sl,
                            },
                            success:function (result){
                                window.location.replace("<c:url value="/giohang"/>");
                            }
                        });
                    }
                }
                </c:forEach>
            });
            var totalMoney=0;
            <c:forEach items="${itemDtos}" var="itemDto">
                $('#${itemDto.item.id}').click(function (){
                    if(this.checked){
                        totalMoney+=parseInt($('#money1${itemDto.item.id}').val());

                    }else {
                        totalMoney-=parseInt($('#money1${itemDto.item.id}').val());
                    }
                    $("#total_money1").val(totalMoney);
                    var show=$("#total_money1").val();
                    $("#total_money").text(new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(show));
                });
            </c:forEach>
            $("#checkout").click(function (){
                var listChecked = new Array();
                <c:forEach items="${itemDtos}" var="itemDto">
                    if($('#${itemDto.item.id}').is(':checked')){
                        listChecked.push(${itemDto.item.id});
                    }
                    debugger;
                </c:forEach>
                $.ajax({
                    url: "<c:url value="/getSelectedItem"/>",
                    type: "get",
                    data:{
                        listChecked:listChecked
                    },
                    success:function (){
                        window.location.replace("<c:url value="/thanh-toan"/>");
                    }
                });
            });
        });
    </script>
</div>
</body>
</html>
