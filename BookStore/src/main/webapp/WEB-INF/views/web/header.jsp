<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>

    <link href="<c:url value="/template/web/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/template/web/css/normalize.css"/>" rel="stylesheet">
    <link href="<c:url value="/template/web/css/font-awesome.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/template/web/css/icomoon.css"/>" rel="stylesheet">
    <link href="<c:url value="/template/web/css/jquery-ui.css"/>" rel="stylesheet">
    <link href="<c:url value="/template/web/css/owl.carousel.css"/>" rel="stylesheet">
    <link href="<c:url value="/template/web/css/transitions.css"/>" rel="stylesheet">
    <link href="<c:url value="/template/web/css/main.css"/>" rel="stylesheet">
    <link href="<c:url value="/template/web/css/color.css"/>" rel="stylesheet">
    <link href="<c:url value="/template/web/css/responsive.css"/>" rel="stylesheet">
    <link href="<c:url value="/template/web/css/style.css"/>" rel="stylesheet">
    <script src="<c:url value="/template/web/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"/>"></script>
</head>
<body>
    <header id="tg-header" class="tg-header tg-haslayout">
        <div class="tg-middlecontainer">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <strong class="tg-logo"><a href="index-2.html"><img style="width:150px; margin-top: 20px" src="<c:url value="/resources/images/background/logo.png"/>" alt="company name here"></a></strong>
                        <div class="tg-wishlistandcart">
                            <c:choose>
                                <c:when test="${customer!=null}">
                                    <div class="dropdown tg-themedropdown tg-wishlistdropdown">
                                        <a href="<c:url value="/giohang"/>" id="tg-wishlisst" aria-haspopup="true" aria-expanded="false">
                                            <span class="tg-themebadge" id="num_item"><%=session.getAttribute("num_item")%></span>
                                            <i class="icon-cart"></i>
                                            <span>Giỏ hàng</span>
                                        </a>
                                    </div>
                                    <div class="dropdown tg-themedropdown tg-minicartdropdown">
                                        <a href="javascript:void(0);" id="tg-minicart" class="tg-btnthemedropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: #77b748">
                                            <i class="icon-user" style="color: #77b748"></i>
                                            <span style="color: #77b748">Tài khoản</span>
<%--                                                <figure><img style="width: 50px; border-radius: 50%;" src="<c:url value="/resources/images/user/${customer.avatar}"/>" alt="image description"></figure>--%>
                                        </a>
                                        <div class="dropdown-menu tg-themedropdownmenu" aria-labelledby="tg-minicart">
                                            <div class="tg-minicartfoot">
                                                <div class="tg-btns">
                                                    <a class="tg-btn tg-active" href="<c:url value="/taikhoan"/>">Tài khoản của tôi</a>
                                                    <a class="tg-btn tg-active" href="<c:url value="/logout-user"/>" onclick="return confirm('Bạn muốn đăng xuất?');">Đăng xuất</a>
                                                </div>
                                                <div class="tg-btns">
                                                    <a class="tg-btn tg-active" href="<c:url value="/donhangdangdat"/>">Đơn hàng đang đặt</a>
                                                    <a class="tg-btn tg-active" href="<c:url value="/donhangdamua"/>">Sản phẩm đã mua</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:when>
                                <c:when test="${customer==null}">
                                    <button>
                                        <a href="<c:url value="/login"/>" class="btn btn-light">Đăng nhập</a>
                                    </button>
                                    <button>
                                        <a href="<c:url value="/register"/>" class="btn btn-light">Đăng ký</a>
                                    </button>
                                </c:when>
                            </c:choose>
                        </div>
                        <div class="tg-searchbox" style="margin-top: 20px">
<%--                            <c:choose>--%>
<%--                                <c:when test="${search==null}">--%>
                                    <form class="tg-formtheme tg-formsearch" action="<c:url value="/searchProduct" />">
                                        <fieldset>
                                            <input id="search" type="text" name="search" value="${search}" class="typeahead form-control" placeholder="Tìm kiếm...">
                                            <button type="submit"><i class="icon-magnifier"></i></button>
                                        </fieldset>
                                    </form>
<%--                                </c:when>--%>
<%--                                <c:when test="${search!=null}">--%>
<%--                                    <c:url value="/searchProduct" var="url"/>--%>
<%--                                    <form:form class="tg-formtheme tg-formsearch" action="${url}">--%>
<%--                                        <fieldset>--%>
<%--                                            <input type="text" name="search" class="typeahead form-control" placeholder="Tìm kiếm...">--%>
<%--                                            <form:input path="search" type="text" class="form-control" value="${search}" required="true"/>--%>
<%--                                            <button type="submit"><i class="icon-magnifier"></i></button>--%>
<%--                                        </fieldset>--%>
<%--                                    </form:form>--%>
<%--                                </c:when>--%>
<%--                            </c:choose>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tg-navigationarea">
            <div class="container" style="width: 1000px">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <nav id="tg-nav" class="tg-nav">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#tg-navigation" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div id="tg-navigation" class="collapse navbar-collapse tg-navigation">
                                <ul>
                                    <li style="width: 150px"><a href="<c:url value="/trang-chu"/>">Trang chủ</a></li>
                                    <li class="menu-item-has-children menu-item-has-mega-menu" style="width: 200px"><a href="javascript:void(0);">Thể loại</a>
                                        <div class="mega-menu">
                                            <ul class="tg-themetabnav" role="tablist">
                                                <li role="presentation" class="active">
                                                    <a href="#artandphotography" aria-controls="artandphotography" role="tab" data-toggle="tab">Sách giáo khoa/tham khảo</a>
                                                </li>
                                                <c:forEach items="${categoryParents}" var="categoryParent">
                                                    <li>
                                                        <a href="<c:url value="/product/category/${categoryParent.id}"/>">${categoryParent.name}</a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                            <div class="tab-content tg-themetabcontent">
                                                <div role="tabpanel" class="tab-pane active" id="artandphotography">
                                                    <ul>
                                                        <li>
                                                            <div class="tg-linkstitle">
                                                                <h2>Sách giáo khoa </h2>
                                                            </div>
                                                            <ul>
                                                                <c:forEach items="${categorySGKs}" var="categorySGK">
                                                                    <li><a href="<c:url value="/product/category/${categorySGK.id}"/>">${categorySGK.name}</a></li>
                                                                </c:forEach>
                                                            </ul>
<%--                                                            <a class="tg-btnviewall" href="products.html">View All</a>--%>
                                                        </li>
                                                        <li>
                                                            <div class="tg-linkstitle">
                                                                <h2>Sách tham khảo</h2>
                                                            </div>
                                                            <ul>
                                                                <c:forEach items="${categorySTKs}" var="categorySTK">
                                                                    <li><a href="<c:url value="/product/category/${categorySTK.id}"/>">${categorySTK.name}</a></li>
                                                                </c:forEach>
                                                            </ul>
<%--                                                            <a class="tg-btnviewall" href="products.html">View All</a>--%>
                                                        </li>
<%--                                                        <li>--%>
<%--                                                            <div class="tg-linkstitle">--%>
<%--                                                                <h2>Sách luyện thi THPT</h2>--%>
<%--                                                            </div>--%>
<%--                                                            <ul>--%>
<%--                                                                <li><a href="products.html">Môn toán</a></li>--%>
<%--                                                                <li><a href="products.html">Môn lý</a></li>--%>
<%--                                                                <li><a href="products.html">Môn hóa</a></li>--%>
<%--                                                                <li><a href="products.html">Môn sinh</a></li>--%>
<%--                                                                <li><a href="products.html">Môn tiếng anh</a></li>--%>
<%--                                                                <li><a href="products.html">Môn văn</a></li>--%>
<%--                                                                <li><a href="products.html">Môn lịch sử</a></li>--%>
<%--                                                                <li><a href="products.html">Môn địa lý</a></li>--%>
<%--                                                                <li><a href="products.html">Giáo dục công dân</a></li>--%>
<%--                                                                <li><a href="products.html">--</a></li>--%>
<%--                                                                <li><a href="products.html">--</a></li>--%>
<%--                                                                <li><a href="products.html">--</a></li>--%>
<%--                                                            </ul>--%>
<%--&lt;%&ndash;                                                            <a class="tg-btnviewall" href="products.html">View All</a>&ndash;%&gt;--%>
<%--                                                        </li>--%>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li style="width: 200px"><a href="<c:url value="/product/hot"/>">Sách nổi tiếng</a></li>
                                    <li style="width: 200px"><a href="<c:url value="/product/new"/>">Sách mới</a></li>
                                    <li style="width: 150px"><a href="<c:url value="/contact"/>">Liên hệ</a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
</aside>
</body>
</html>

