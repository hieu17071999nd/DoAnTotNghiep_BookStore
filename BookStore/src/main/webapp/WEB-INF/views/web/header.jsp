<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="tg-topbar">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <ul class="tg-addnav">
                            <li>
                                <a href="javascript:void(0);">
                                    <i class="icon-envelope"></i>
                                    <em>Contact</em>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);">
                                    <i class="icon-question-circle"></i>
                                    <em>Help</em>
                                </a>
                            </li>
                        </ul>
                        <div class="dropdown tg-themedropdown tg-currencydropdown">
                            <a href="javascript:void(0);" id="tg-currenty" class="tg-btnthemedropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="icon-earth"></i>
                                <span>Currency</span>
                            </a>
                            <ul class="dropdown-menu tg-themedropdownmenu" aria-labelledby="tg-currenty">
                                <li>
                                    <a href="javascript:void(0);">
                                        <i>£</i>
                                        <span>British Pound</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">
                                        <i>$</i>
                                        <span>Us Dollar</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">
                                        <i>€</i>
                                        <span>Euro</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="tg-userlogin">
                            <c:choose>
                                <c:when test="${customer!=null}">
                                    <figure><a href="javascript:void(0);"><img src="<c:url value="/resources/images/user/${customer.avatar}"/>" alt="Khách hàng chính chủ"></a></figure>
                                    <span>Hi, ${customer.name}</span>
                                </c:when>
                                <c:when test="${customer==null}">
                                    <figure><a href="javascript:void(0);"><img src="<c:url value="/resources/images/user/IMG2.jpg"/>" alt="Khách hàng vãng lai"></a></figure>
                                    <span>Hi, John</span>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tg-middlecontainer">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <strong class="tg-logo"><a href="index-2.html"><img style="width:150px" src="<c:url value="/resources/images/background/logo.png"/>" alt="company name here"></a></strong>

                        <div class="tg-wishlistandcart">
                            <c:choose>
                                <c:when test="${customer!=null}">
                                    <div class="dropdown tg-themedropdown tg-wishlistdropdown">
                                        <a href="<c:url value="/giohang"/>" id="tg-wishlisst" aria-haspopup="true" aria-expanded="false">
<%--                                        <a href="<c:url value="/giohang"/>" id="tg-wishlisst" class="tg-btnthemedropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                                            <span class="tg-themebadge" id="num_item"><%=session.getAttribute("num_item")%></span>
                                            <i class="icon-cart"></i>
                                            <span>Giỏ hàng</span>
                                        </a>
<%--                                        <div class="dropdown-menu tg-themedropdownmenu" aria-labelledby="tg-wishlisst">--%>
<%--                                            <div class="tg-description"><p>No products were added to the wishlist!</p></div>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="dropdown tg-themedropdown tg-minicartdropdown">
                                        <a href="javascript:void(0);" id="tg-minicart" class="tg-btnthemedropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: #77b748">
<%--                                            <span class="tg-themebadge">3</span>--%>
                                            <i class="icon-profile"></i>
                                            <span>Tài khoản</span>
                                        </a>
                                        <div class="dropdown-menu tg-themedropdownmenu" aria-labelledby="tg-minicart">
                                            <div class="tg-minicartfoot">
                                                <div class="tg-btns">
                                                    <a class="tg-btn tg-active" href="<c:url value="/taikhoan"/>">Tài khoản của tôi</a>
                                                    <a class="tg-btn" href="<c:url value="/logout-user"/>" onclick="return confirm('Bạn muốn đăng xuất?');">Đăng xuất</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
<%--                                    <button class="cart-icon" title="Giỏ hàng" style="width: 100px">--%>
<%--                                        <a href="<c:url value="/giohang"/>">--%>
<%--                                            <i class="icon-book"></i>--%>
<%--                                            <span id="num_item"><%=session.getAttribute("num_item")%></span>--%>
<%--                                        </a>--%>
<%--                                    </button>--%>
<%--                                    <button>--%>
<%--                                        <a href="<c:url value="/taikhoan"/>" class="btn btn-light">Tài khoản</a>--%>
<%--                                    </button>--%>
<%--                                    <button>--%>
<%--                                        <a href="<c:url value="/logout-user"/>" class="btn btn-light" onclick="return confirm('Bạn muốn đăng xuất?');">Đăng xuất</a>--%>
<%--                                    </button>--%>
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


                        <div class="tg-searchbox">
                            <form class="tg-formtheme tg-formsearch">
                                <fieldset>
                                    <input type="text" name="search" class="typeahead form-control" placeholder="Search by title, author, keyword, ISBN...">
                                    <button type="submit"><i class="icon-magnifier"></i></button>
                                </fieldset>
<%--                                <a href="javascript:void(0);">+  Advanced Search</a>--%>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tg-navigationarea">
            <div class="container">
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
                                    <li><a href="<c:url value="/trang-chu"/>">Trang chủ</a></li>
                                    <li class="menu-item-has-children menu-item-has-mega-menu"><a href="javascript:void(0);">Thể loại</a>
                                        <div class="mega-menu">
                                            <ul class="tg-themetabnav" role="tablist">
                                                <li role="presentation" class="active">
                                                    <a href="#artandphotography" aria-controls="artandphotography" role="tab" data-toggle="tab">Sách giáo khoa</a>
                                                </li>
                                                <c:forEach items="${categoryParents}" var="categoryParent">
                                                    <li role="presentation">
                                                        <a href="#biography" aria-controls="biography" role="tab" data-toggle="tab">${categoryParent.name}</a>
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
                                                                    <li><a href="products.html">${categorySGK.name}</a></li>
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
                                                                    <li><a href="products.html">${categorySTK.name}</a></li>
                                                                </c:forEach>
                                                            </ul>
<%--                                                            <a class="tg-btnviewall" href="products.html">View All</a>--%>
                                                        </li>
                                                        <li>
                                                            <div class="tg-linkstitle">
                                                                <h2>Sách luyện thi THPT</h2>
                                                            </div>
                                                            <ul>
                                                                <li><a href="products.html">Lớp 10</a></li>
                                                                <li><a href="products.html">Lớp 11</a></li>
                                                                <li><a href="products.html">Lớp 12</a></li>
                                                                <li><a href="products.html">Commodo conseat</a></li>
                                                                <li><a href="products.html">Duis aute irure</a></li>
                                                            </ul>
<%--                                                            <a class="tg-btnviewall" href="products.html">View All</a>--%>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li><a href="products.html">Sách bán chạy</a></li>
                                    <li><a href="products.html">Sách đang giảm giá</a></li>
                                    <li><a href="contactus.html">Liên hệ</a></li>
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

