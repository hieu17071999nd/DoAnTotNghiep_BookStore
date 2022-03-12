<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Mua hàng</title>
</head>
<body class="tg-home tg-homeone">
<div id="tg-wrapper" class="tg-wrapper tg-haslayout">

    <jsp:include page="header.jsp"/>
    <br>
    <section class="checkout-section spad">
        <div class="container">
            <p style="font-size: 20px;color: red">${msg}</p>
<%--            <form action="<c:url value="/checkout"/>" class="checkout-form" method="post">--%>
            <form action="<c:url value="/processOrder"/>" class="checkout-form" method="post">
                <div class="row">
                    <div class="col-lg-5">
                        <h4>Thông tin thanh toán</h4>
                        <div class="row">
                            <input name="customer_id" type="hidden" value="${customer.id}">
                            <div class="col-lg-12">
                                <label for="name">Họ tên</label>
                                <input readonly type="text" id="name" value="${customer.name}">
                            </div>
                            <div class="col-lg-12">
                                <label for="phone">Số điện thoại<span>*</span></label>
                                <input readonly type="text" id="phone" value="${customer.phone}">
                            </div>
                            <div class="col-lg-12">
                                <label for="mail">Địa chỉ email<span>*</span></label>
                                <input readonly type="text" id="mail" value="${customer.email}">
                            </div>
                            <div class="col-lg-12">
                                <label for="address">Địa chỉ giao hàng<span>*</span></label>
                                <button type="button" data-toggle="modal" data-target="#edit">Chọn địa chỉ khác</button>
                                <textarea name="address" style="height: 80px;" class="col-lg-12" id="address">${customer.address}</textarea>
                            </div>
                            <div class="col-lg-12">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="place-order">
                            <h4>Đơn hàng của bạn</h4>
                            <div class="order-total">
                                <ul class="order-table">
                                    <li>Sản phẩm <span>Tạm tính</span></li>
                                    <c:forEach items="${itemDtos}" var="itemDto">
                                        <input name="item_id" type="hidden" value="${itemDto.item.id}">
                                        <input type="hidden" id="money1${itemDto.item.id}" value="${itemDto.itemMoney}">
                                        <li>
                                                ${itemDto.product.name} x ${itemDto.item.number} <span id="money${itemDto.item.id}"></span>
                                        </li>
                                    </c:forEach>
                                    <input type="hidden" id="total_money1">
                                    <li class="total-price">Tổng <span id="total_money"></span></li>
                                </ul>
                                <div class="order-btn">
                                    <button type="submit" class="site-btn place-btn">Đặt hàng</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <div class="modal fade" id="edit" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Sửa địa chỉ</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tỉnh / Thành phố</label>
                        <select name="province" id="province" class="form-control" required>
                            <option value="">-- Không chọn --</option>
                            <c:forEach items="${provinces}" var="province">
                                <option value="${province.id}">${province.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Quận / Huyện</label>
                        <select name="district" id="district" class="form-control" required>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Xã / Phường</label>
                        <select name="ward" id="ward" class="form-control" required>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Địa chỉ cụ thể</label>
                        <input id="detail" class="form-control" type="text" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="edit_address" class="btn btn-primary">Lưu</button>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
    <script>
        $(document).ready(function () {
            var totalMoney = 0;
            <c:forEach items="${itemDtos}" var="itemDto">
                var money = $("#money1${itemDto.item.id}").val();
                $("#money${itemDto.item.id}").text(new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(money));
                totalMoney += parseInt(${itemDto.itemMoney});
                $("#total_money1").val(totalMoney);
                var show = $("#total_money1").val();
                $("#total_money").text(new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(show));
            </c:forEach>
            $("#province").change(function () {
                var provinceId = $("#province").val();
                $.ajax({
                    url: "<c:url value="/get-list-district"/>",
                    type: "get",
                    data: {
                        provinceId: provinceId
                    },
                    dataType: "json",
                    success: function (result) {
                        var html = '';
                        html += '<option value="">--Không chọn--</option>';
                        $.each(result, function (index, value) {
                            html += '<option value=' + value.id + '>' + value.name + '</option>';
                        });
                        $("#district").html(html);
                    }
                });
            });
            $("#district").change(function () {
                var districtId = $("#district").val();
                $.ajax({
                    url: "<c:url value="/get-list-ward"/>",
                    type: "get",
                    data: {
                        districtId: districtId
                    },
                    dataType: "json",
                    success: function (result) {
                        var html = '';
                        html += '<option value="">--Không chọn--</option>';
                        $.each(result, function (index, value) {
                            html += '<option value=' + value.id + '>' + value.name + '</option>';
                        });
                        $("#ward").html(html);
                    }
                });
            });
            $("#edit_address").click(function () {
                var detail = $("#detail").val();
                var ward = $("#ward option:selected").text();
                var district = $("#district option:selected").text();
                var province = $("#province option:selected").text();
                var address = "";
                var check=false;
                if (province!="--Không chọn--") {
                    if(district!="--Không chọn--"){
                        if(ward!="--Không chọn--"){
                            if(detail!=""){
                                address = detail + "," + ward + "," + district + "," + province;
                                check=true;
                            }
                        }
                    }
                }
                if(check){
                    alert("Chọn địa chỉ thành công");
                    $("#address").val(address);
                }else {
                    alert("Địa chỉ không hợp lệ");
                }
            });
        });
    </script>
</div>
</body>
</html>
