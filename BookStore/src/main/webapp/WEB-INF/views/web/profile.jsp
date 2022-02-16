<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Thông tin người dùng</title>
</head>
<body class="tg-home tg-homeone">
<div id="tg-wrapper" class="tg-wrapper tg-haslayout">

    <jsp:include page="header.jsp"/>
    <br>
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center py-5" style="margin-left: -55px;">
                <img class="rounded-circle mt-5" src="<c:url value="/resources/images/user/${customer.avatar}"/>"
                     width="120">
                <span class="font-weight-bold">${customer.name}</span>
            </div>
        </div>
        <div class="col-md-7">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-5">
                    <h5 class="text-center"><b>Thông tin người dùng</b></h5>
                </div>
                <span style="color: red">${msg}</span>
                <c:url value="/update-profile" var="url"/>
                <form:form modelAttribute="customer" action="${url}" method="post" enctype="multipart/form-data">
                    <div class="row mt-3">
                        <form:hidden path="id" value="${customer.id}"/>
                        <form:hidden path="password" value="${customer.password}"/>
                        <div class="col-md-6">
                            <label>Tên tài khoản</label>
                            <form:input path="username" class="form-control" readonly="true"
                                        value="${customer.username}"/>
                        </div>
                        <div class="col-md-6">
                            <label>Tên</label>
                            <form:input path="name" class="form-control" value="${customer.name}" required="true"/>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <label>Số điện thoại</label>
                            <form:input path="phone" class="form-control" value="${customer.phone}" required="true"/>
                        </div>
                        <div class="col-md-6">
                            <label>Email</label>
                            <form:input path="email" type="email" class="form-control" value="${customer.email}"
                                        required="true"/>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <label>Địa chỉ(Giao hàng)</label>
                            <button type="button" data-toggle="modal" data-target="#edit">Sửa</button>
                            <form:textarea id="address" readonly="true" path="address" class="form-control"
                                           required="true" value="${customer.address}"/>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <label for="file" class="btn btn-warning">Chọn ảnh</label>
                            <form:hidden path="avatar" value="${customer.avatar}"/>
                            <input type="file" id="file" name="file" style="display:none;">
                        </div>
                    </div>
                    <div class="mt-5 text-right">
                        <button id="submit" class="btn btn-primary profile-button" type="submit">Cập nhật</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>

    <br>

<%--    <div class="modal fade" id="edit" role="dialog">--%>
<%--        <div class="modal-dialog" role="document">--%>
<%--            <div class="modal-content">--%>
<%--                <div class="modal-header">--%>
<%--                    <h5 class="modal-title">Sửa địa chỉ</h5>--%>
<%--                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                        <span aria-hidden="true">&times;</span>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--                <div class="modal-body">--%>
<%--                    <div class="form-group">--%>
<%--                        <label>Tỉnh / Thành phố</label>--%>
<%--                        <select name="province" id="province" class="form-control" required>--%>
<%--                            <option value="">-- Không chọn --</option>--%>
<%--                            <c:forEach items="${provinces}" var="province">--%>
<%--                                <option value="${province.id}">${province.name}</option>--%>
<%--                            </c:forEach>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label>Quận / Huyện</label>--%>
<%--                        <select name="district" id="district" class="form-control" required>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label>Xã / Phường</label>--%>
<%--                        <select name="ward" id="ward" class="form-control" required>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label>Địa chỉ cụ thể</label>--%>
<%--                        <input id="detail" class="form-control" type="text" required>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                    <button type="button" id="edit_address" class="btn btn-primary">Lưu</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
