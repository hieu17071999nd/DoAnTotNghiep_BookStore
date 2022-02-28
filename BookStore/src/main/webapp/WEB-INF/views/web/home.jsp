<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Book Library</title>
</head>
<body class="tg-home tg-homeone">
  <div id="tg-wrapper" class="tg-wrapper tg-haslayout">

    <jsp:include page="header.jsp"/>

    <section class="tg-sectionspace tg-haslayout" style="padding-top: 50px">
      <div class="container">
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="tg-sectionhead">
              <h2>Sách bán chạy nhất</h2>
              <a class="tg-btn" href="javascript:void(0);">Xem tất cả</a>
            </div>
          </div>
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div id="tg-bestsellingbooksslider" class="tg-bestsellingbooksslider tg-bestsellingbooks owl-carousel">
            <c:forEach items="${products}" var="product">
              <div class="item">
                <div class="tg-postbook">
                  <figure class="tg-featureimg">
                    <div class="tg-bookimg">
                      <div class="tg-frontcover"><img src="<c:url value="/resources/images/product/${product.image}"/>" alt="" style="height: 220px"></div>
                      <div class="tg-backcover"><img src="<c:url value="/resources/images/product/${product.image}"/>" alt=""></div>
                    </div>
                    <a class="tg-btnaddtowishlist" href="<c:url value="/product/${product.id}"/>"> Xem chi tiết</a>
                  </figure>
                  <div class="tg-postbookcontent">
<%--                    <ul class="tg-bookscategories">--%>
<%--                      <li><a href="javascript:void(0);">Adventure</a></li>--%>
<%--                      <li><a href="javascript:void(0);">Fun</a></li>--%>
<%--                    </ul>--%>
<%--                    <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>--%>
                    <div class="tg-booktitle">
                      <h3 style="height: 30px"><a href="<c:url value="/product/${product.id}"/>">${product.name}</a></h3>
                    </div>
<%--                    <span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>--%>
<%--                    <span class="tg-stars"><span></span></span>--%>
                    <span class="tg-bookprice">
                                <input id="price1${product.id}" type="hidden" value="${product.price}">
                                                  <ins id="price${product.id}"></ins>
<%--                                                  <del>$27.20</del>--%>
                                              </span>
<%--                    <a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">--%>
<%--                      <i class="fa fa-shopping-basket"></i>--%>
<%--                      <em>Thêm vào giỏ</em>--%>
<%--                    </a>--%>
                  </div>
                </div>
              </div>
            </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="tg-bglight tg-haslayout">
      <div class="container">
        <div class="row">
          <div class="tg-featureditm">
            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 hidden-sm hidden-xs">
              <figure><img src="<c:url value="/resources/images/background/img-02.png"/>" alt=""></figure>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
              <div class="tg-featureditmcontent">
<%--                <div class="tg-themetagbox"><span class="tg-themetag">featured</span></div>--%>
                <div class="tg-booktitle">
                  <h3><a href="javascript:void(0);">Đọc sách mỗi ngày</a></h3>
                </div>
<%--                <span class="tg-bookwriter">By: <a href="javascript:void(0);">Farrah Whisenhunt</a></span>--%>
                <span class="tg-stars"><span></span></span>
<%--                <div class="tg-priceandbtn">--%>
<%--                                          <span class="tg-bookprice">--%>
<%--                                              <ins>$23.18</ins>--%>
<%--                                              <del>$30.20</del>--%>
<%--                                          </span>--%>
<%--                  <a class="tg-btn tg-btnstyletwo tg-active" href="javascript:void(0);">--%>
<%--                    <i class="fa fa-shopping-basket"></i>--%>
<%--                    <em>Add To Basket</em>--%>
<%--                  </a>--%>
<%--                </div>--%>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="tg-parallax tg-bgcollectioncount tg-haslayout" data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll"
             data-image-src="<c:url value="/resources/images/background/bgparallax-04.jpg"/>">
      <div class="tg-sectionspace tg-collectioncount tg-haslayout">
        <div class="container">
          <div class="row">
            <div id="tg-collectioncounters" class="tg-collectioncounters">
              <div class="tg-collectioncounter tg-drama">
                <div class="tg-collectioncountericon">
                  <i class="icon-bubble"></i>
                </div>
                <div class="tg-titlepluscounter">
                  <h2>Drama</h2>
                  <h3 data-from="0" data-to="6179213" data-speed="8000" data-refresh-interval="50">6,179,213</h3>
                </div>
              </div>
              <div class="tg-collectioncounter tg-horror">
                <div class="tg-collectioncountericon">
                  <i class="icon-heart-pulse"></i>
                </div>
                <div class="tg-titlepluscounter">
                  <h2>Horror</h2>
                  <h3 data-from="0" data-to="3121242" data-speed="8000" data-refresh-interval="50">3,121,242</h3>
                </div>
              </div>
              <div class="tg-collectioncounter tg-romance">
                <div class="tg-collectioncountericon">
                  <i class="icon-heart"></i>
                </div>
                <div class="tg-titlepluscounter">
                  <h2>Romance</h2>
                  <h3 data-from="0" data-to="2101012" data-speed="8000" data-refresh-interval="50">2,101,012</h3>
                </div>
              </div>
              <div class="tg-collectioncounter tg-fashion">
                <div class="tg-collectioncountericon">
                  <i class="icon-star"></i>
                </div>
                <div class="tg-titlepluscounter">
                  <h2>Fashion</h2>
                  <h3 data-from="0" data-to="1158245" data-speed="8000" data-refresh-interval="50">1,158,245</h3>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="tg-sectionspace tg-haslayout">
      <div class="container">
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="tg-sectionhead">
              <h2>Sách mới</h2>
              <a class="tg-btn" href="javascript:void(0);">Xem tất cả</a>
            </div>
          </div>
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div id="tg-relatedproductslider" class="tg-relatedproductslider tg-relatedbooks owl-carousel">
              <c:forEach items="${productNews}" var="productNew">
                <div class="item">
                  <div class="tg-postbook">
                    <figure class="tg-featureimg">
                      <div class="tg-bookimg">
                        <div class="tg-frontcover"><img src="<c:url value="/resources/images/product/${productNew.image}"/>" alt="image description" style="height: 200px"></div>
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
                        <h3><a href="<c:url value="/product/${productNew.id}"/>">${productNew.name}</a></h3>
                      </div>
                        <%--                                                                        <span class="tg-bookwriter">By: <a href="javascript:void(0);">${productRelative.name}</a></span>--%>
                        <%--                                                                        <span class="tg-stars"><span></span></span>--%>
                      <span class="tg-bookprice">
                                                                                <input id="price2${productNew.id}" type="hidden" value="${productNew.price}">
                                                                            <ins id="price3${productNew.id}"></ins>
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
    </section>

    <jsp:include page="footer.jsp"/>

    <script>
      $(document).ready(function (){
        <c:forEach items="${products}" var="product">
          var price=$("#price1${product.id}").val();
          $("#price${product.id}").text(new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price));
        </c:forEach>

        <c:forEach items="${productNews}" var="product">
        var price2=$("#price2${product.id}").val();
        $("#price3${product.id}").text(new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price2));
        </c:forEach>
      });
    </script>
  </div>
</body>
</html>

