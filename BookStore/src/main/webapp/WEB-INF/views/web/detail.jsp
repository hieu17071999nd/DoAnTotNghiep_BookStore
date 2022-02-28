<%@ page import="com.hieuvm.bookstore.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
</head>
<body>
    <div id="tg-wrapper" class="tg-wrapper tg-haslayout">

        <jsp:include page="header.jsp"/>
        <main id="tg-main" class="tg-main tg-haslayout">
            <div class="tg-sectionspace tg-haslayout" style="padding-top: 50px">
                <div class="container">
                    <div class="row">
                        <div id="tg-twocolumns" class="tg-twocolumns">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pull-left">
                                <input type="hidden" id="product_id" value="${product.id}">
                                <div id="tg-content" class="tg-content">
                                    <div class="tg-featurebook alert" role="alert">
                                        <div class="tg-featureditm">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 hidden-sm hidden-xs">
                                                    <figure><img style="width:200px" src="<c:url value="/resources/images/product/${product.image}"/>" alt="image description"></figure>
                                                </div>
                                                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                                                    <div class="tg-featureditmcontent">
                                                        <div class="tg-booktitle">
                                                            <h3><a href="javascript:void(0);">${product.name}</a></h3>
                                                        </div>
                                                        <span class="tg-bookwriter">Tác giả: <a href="javascript:void(0);">${product.author}</a></span>
                                                        <span class="tg-stars"><span></span></span>
                                                        <div class="tg-priceandbtn">
                                                                    <span class="tg-bookprice">
                                                                        <input id="price1${product.id}" type="hidden" value="${product.price}">
                                                                        <ins style="color: forestgreen" id="price${product.id}"></ins>
<%--                                                                        <del>$30.20</del>--%>
                                                                    </span>
<%--                                                            <a class="tg-btn tg-btnstyletwo tg-active" href="javascript:void(0);">--%>
<%--                                                                <i class="fa fa-shopping-basket"></i>--%>
<%--                                                                <em>Add To Basket</em>--%>
<%--                                                            </a>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tg-productdetail">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                                <div class="tg-postbook">
                                                    <div class="tg-postbookcontent">
                                                        <div class="tg-quantityholder">
                                                            <span style="font-size: 20px;margin-top: 5px;margin-right: 10px;"><b>Số lượng còn lại:</b></span>
                                                            <span style="font-size: 20px;margin-top: 5px;margin-right: 10px;" id="quantilyOld" type="text"><b>${product.quantily}</b></span>
                                                            <div class="tg-quantityholder">
                                                                <em class="minus" id="check">-</em>
                                                                <input type="text" class="result" value="1" id="quantity1" name="quantity">
                                                                <em class="plus" id="check2">+</em>
                                                            </div>

                                                            <input type="hidden" id="oldNumberProduct" value="${product.quantily}">
<%--                                                            <div class="pro-qty">--%>
<%--                                                                <input id="n" type="number" value="1" >--%>
<%--                                                            </div>--%>
                                                            <p style="margin-top:7px;" id="sl"></p>
                                                            <input style="display: none" type="number" id="num">
                                                        </div>
                                                        <button class="tg-btn tg-active tg-btn-lg" id="add_cart" style="width: 68%">
                                                            Thêm vào giỏ hàng</button>
                                                        <button class="tg-btnaddtowishlist" id="buy" style="width: 68%">
                                                            <span>Mua ngay</span>
                                                        </button>
                                                        <%
                                                            Customer customer= (Customer) session.getAttribute("customer");
                                                        %>
                                                        <c:set var = "customer" scope = "session" value = "<%=customer%>"/>
                                                        <c:choose>
                                                            <c:when test = "${customer != null}">
                                                                <input id="customer_id" type="hidden" value="${customer.id}">
                                                            </c:when>
                                                            <c:when test = "${customer == null}">
                                                                <input id="customer_id" type="hidden">
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                                                <div class="tg-productcontent">
                                                    <ul class="tg-bookscategories">
                                                        <li><a href="javascript:void(0);"><h4>Thể loại: </h4> ${productCategory.name}</a></li>
                                                    </ul>
                                                    <div class="tg-booktitle">
                                                        <h4>Mô tả sản phẩm</h4>
                                                        <p>- ${product.description}.</p>
                                                    </div>
                                                    <div class="tg-booktitle">
                                                        <h4>Nhà xuất bản: Kim đồng</h4>
<%--                                                        <p>- ${product.description}.</p>--%>
                                                    </div>
                                                    <div class="tg-sectionhead">
                                                        <h2>Chi tiết sản phẩm</h2>
                                                    </div>
                                                    <ul class="tg-productinfo">
                                                        <li><span>Format:</span><span>Hardback</span></li>
                                                        <li><span>Pages:</span><span>528 pages</span></li>
                                                        <li><span>Dimensions:</span><span>153 x 234 x 43mm | 758g</span></li>
                                                        <li><span>Publication Date:</span><span>June 27, 2017</span></li>
                                                        <li><span>Publisher:</span><span>Sunshine Orlando</span></li>
                                                        <li><span>Language:</span><span>English</span></li>
                                                        <li><span>Illustrations note:</span><span>b&amp;w images thru-out; 1 x 16pp colour plates</span></li>
                                                        <li><span>ISBN10:</span><span>1234567890</span></li>
                                                        <li><span>ISBN13:</span><span>1234567890000</span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="tg-relatedproducts">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="tg-sectionhead">
                                                        <h2>Sản phẩm liên quan</h2>
                                                        <a class="tg-btn" href="javascript:void(0);">View All</a>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div id="tg-relatedproductslider" class="tg-relatedproductslider tg-relatedbooks owl-carousel">
                                                        <c:forEach items="${productRelatives}" var="productRelative">
                                                            <div class="item">
                                                                <div class="tg-postbook">
                                                                    <figure class="tg-featureimg">
                                                                        <div class="tg-bookimg">
                                                                            <div class="tg-frontcover"><img src="<c:url value="/resources/images/product/${productRelative.image}"/>" alt="image description" style="height: 200px"></div>
<%--                                                                            <div class="tg-backcover"><img src="<c:url value="/resources/images/product/${productRelative.image}"/>" alt="image description"></div>--%>
                                                                        </div>
<%--                                                                        <a class="tg-btnaddtowishlist" href="javascript:void(0);">--%>
<%--                                                                            <i class="icon-heart"></i>--%>
<%--                                                                            <span>add to wishlist</span>--%>
<%--                                                                        </a>--%>
                                                                    </figure>
                                                                    <div class="tg-postbookcontent">
<%--                                                                        <ul class="tg-bookscategories">--%>
<%--                                                                            <li><a href="javascript:void(0);">Adventure</a></li>--%>
<%--                                                                            <li><a href="javascript:void(0);">Fun</a></li>--%>
<%--                                                                        </ul>--%>
<%--                                                                        <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>--%>
                                                                        <div class="tg-booktitle">
                                                                            <h3><a href="<c:url value="/product/${productRelative.id}"/>">${productRelative.name}</a></h3>
                                                                        </div>
<%--                                                                        <span class="tg-bookwriter">By: <a href="javascript:void(0);">${productRelative.name}</a></span>--%>
<%--                                                                        <span class="tg-stars"><span></span></span>--%>
                                                                        <span class="tg-bookprice">
                                                                                <input id="price2${productRelative.id}" type="hidden" value="${productRelative.price}">
                                                                            <ins id="price3${productRelative.id}"></ins>
                        <%--                                                  <del>$27.20</del>--%>
                                                                        </span>
<%--                                                                        <a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">--%>
<%--                                                                            <i class="fa fa-shopping-basket"></i>--%>
<%--                                                                            <em>Add To Basket</em>--%>
<%--                                                                        </a>--%>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"/>
    </div>
    <script>
        $(document).ready(function () {
            var price=$("#price1${product.id}").val();
            $("#price${product.id}").text(new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price));

            <c:forEach items="${productRelatives}" var="product">
            var price=$("#price2${product.id}").val();
            $("#price3${product.id}").text(new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price));
            </c:forEach>

            $("#check").click(function (){
                var n=$("#quantity1").val();
                var num=$("#num").val();

                if(parseFloat(n) < 2){
                    alert("Yêu cầu chọn trên 1 sản phẩm!");
                    // $("#quantity1").text(parseInt($("#quantity1").text())+1);
                    $("#check2").click();
                }
            });

            $("#check2").click(function (){
                debugger;
                var quantilyOld=$("#oldNumberProduct").val();
                var n=$("#quantity1").val();
                var num=$("#num").val();

                if(parseFloat(n) > parseFloat(quantilyOld) -1) {
                    alert("Không thể chọn vượt quá số lượng sản phẩm còn lại trong kho!");
                    // $("#quantity1").text(parseInt($("#quantity1").text())+1);
                    $("#check").click();
                }
            });

            $("#add_cart").click(function (){
                var n=$("#quantity1").val();
                var num=$("#num").val();
                var productId = $("#product_id").val();
                var customerId=$("#customer_id").val();
                    if(parseFloat(n)==0){
                        alert("Yêu cầu chọn trên 1 sản phẩm!");
                    } else {
                        if(customerId==""){
                            alert("Vui lòng đăng nhập!")
                        }else {
                            $.ajax({
                                url:"<c:url value="/add-cart"/>",
                                type:"get",
                                data:{
                                    productId:productId,
                                    n:n,
                                    customerId:customerId
                                },
                                success:function (result){
                                    if(result=="false"){
                                        alert("Thêm vào giỏ hàng thất bại");
                                    }else {
                                        alert("Thêm vào giỏ hàng thành công");
                                        $("#num_item").text(parseInt($("#num_item").text())+1);
                                    }
                                }
                            });
                        }
                    }

            });
            $("#buy").click(function (){
                var n=$("#quantity1").val();
                var num=$("#num").val();
                var productId = $("#product_id").val();
                var customerId=$("#customer_id").val();
                    if(parseFloat(n)==0){
                        alert("Yêu cầu chọn trên 1 sản phẩm!");
                    } else {
                        if(customerId==""){
                            alert("Vui lòng đăng nhập!")
                        }else {
                            $.ajax({
                                url:"<c:url value="/buy-now"/>",
                                type:"get",
                                data:{
                                    productId:productId,
                                    n:n,
                                    customerId:customerId
                                },
                                success:function (){
                                    window.location.href="<c:url value="/thanh-toan"/>";
                                }
                            });
                        }
                    }
            });
        });
    </script>
</body>
</html>
