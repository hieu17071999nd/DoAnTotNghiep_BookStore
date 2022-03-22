<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Đăng ký tài khoản</title>
</head>
<body class="tg-home tg-homeone">
<div id="tg-wrapper" class="tg-wrapper tg-haslayout">

    <jsp:include page="header.jsp"/>

    <div class="register-login-section spad" style="padding-top: 100px; padding-left: 400px">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2>Đăng ký</h2>
                        <p style="text-align: center;">${msg}</p>
                        <c:url value="/register" var="url"/>
                        <form:form modelAttribute="new_customer" action="${url}" method="post">
                            <div class="group-input">
                                <label for="name">Họ và tên</label>
                                <form:input path="name" id="name" required="true"/>
                            </div>
                            <div class="group-input">
                                <label for="phone">Số điện thoại</label>
                                <form:input path="phone" id="phone" required="true"/>
                            </div>
                            <div class="group-input">
                                <label for="email">Email</label>
                                <form:input path="email" type="email" id="email" required="true"/>
                            </div>
                            <div class="group-input">
                                <label for="username">Tài đăng nhập</label>
                                <form:input path="username" id="username" required="true"/>
                            </div>
                            <div class="group-input">
                                <label for="password">Mật khẩu</label>
                                <form:password path="password" id="password" name="password" required="true"/>
                            </div>
<%--                            <div class="group-input">--%>
<%--                                <label for="con-pass">Nhập lại mật khẩu</label>--%>
<%--                                <input type="password" id="con-pass" name="con-pass" required>--%>
<%--                            </div>--%>
                            <button id="submit" type="submit" class="site-btn register-btn">Đăng ký</button>
                        </form:form>
                        <div class="switch-login">
                            <a href="<c:url value="/login"/>" class="or-login">Đăng nhập ngay</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Login Form Section End -->
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
