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

    <section class="tg-sectionspace tg-haslayout">
      <div class="container">
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="tg-sectionhead">
              <h2><span>People’s Choice</span>Bestselling Books</h2>
              <a class="tg-btn" href="javascript:void(0);">View All</a>
            </div>
          </div>
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div id="tg-bestsellingbooksslider" class="tg-bestsellingbooksslider tg-bestsellingbooks owl-carousel">
            <c:forEach items="${list_product}" var="product">
              <div class="item">
                <div class="tg-postbook">
                  <figure class="tg-featureimg">
                    <div class="tg-bookimg">
                      <div class="tg-frontcover"><img src="<c:url value="/resources/images/product/${product.image}"/>" alt=""></div>
                      <div class="tg-backcover"><img src="<c:url value="/resources/images/product/${product.image}"/>" alt=""></div>
                    </div>
<%--                    <a class="tg-btnaddtowishlist" href="javascript:void(0);">--%>
                    <a class="tg-btnaddtowishlist" href="<c:url value="/product/${product.id}"/>">  Xem chi tiết</a>
                  </figure>
                  <div class="tg-postbookcontent">
                    <ul class="tg-bookscategories">
                      <li><a href="javascript:void(0);">Adventure</a></li>
                      <li><a href="javascript:void(0);">Fun</a></li>
                    </ul>
                    <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
                    <div class="tg-booktitle">
                      <h3><a href="<c:url value="/product/${product.id}"/>">${product.name}</a></h3>
                    </div>
                    <span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
                    <span class="tg-stars"><span></span></span>
                    <span class="tg-bookprice">
                                                  <ins>${product.price} VND</ins>
                                                  <del>$27.20</del>
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
    <section class="tg-sectionspace tg-haslayout">
      <div class="container">
        <div class="row">
          <div class="tg-newrelease">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
              <div class="tg-sectionhead">
                <h2><span>Taste The New Spice</span>New Release Books</h2>
              </div>
              <div class="tg-description">
                <p>Consectetur adipisicing elit sed do eiusmod tempor incididunt labore toloregna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoiars nisiuip commodo consequat aute irure dolor in aprehenderit aveli esseati cillum dolor fugiat nulla pariatur cepteur sint occaecat cupidatat.</p>
              </div>
              <div class="tg-btns">
                <a class="tg-btn tg-active" href="javascript:void(0);">View All</a>
                <a class="tg-btn" href="javascript:void(0);">Read More</a>
              </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
              <div class="row">
                <div class="tg-newreleasebooks">
                  <div class="col-xs-4 col-sm-4 col-md-6 col-lg-4">
                    <div class="tg-postbook">
                      <figure class="tg-featureimg">
                        <div class="tg-bookimg">
                          <div class="tg-frontcover"><img src="images/books/img-07.jpg" alt="image description"></div>
                          <div class="tg-backcover"><img src="images/books/img-07.jpg" alt="image description"></div>
                        </div>
                        <a class="tg-btnaddtowishlist" href="javascript:void(0);">
                          <i class="icon-heart"></i>
                          <span>add to wishlist</span>
                        </a>
                      </figure>
                      <div class="tg-postbookcontent">
                        <ul class="tg-bookscategories">
                          <li><a href="javascript:void(0);">Adventure</a></li>
                          <li><a href="javascript:void(0);">Fun</a></li>
                        </ul>
                        <div class="tg-booktitle">
                          <h3><a href="javascript:void(0);">Help Me Find My Stomach</a></h3>
                        </div>
                        <span class="tg-bookwriter">By: <a href="javascript:void(0);">Kathrine Culbertson</a></span>
                        <span class="tg-stars"><span></span></span>
                      </div>
                    </div>
                  </div>
                  <div class="col-xs-4 col-sm-4 col-md-6 col-lg-4">
                    <div class="tg-postbook">
                      <figure class="tg-featureimg">
                        <div class="tg-bookimg">
                          <div class="tg-frontcover"><img src="images/books/img-08.jpg" alt="image description"></div>
                          <div class="tg-backcover"><img src="images/books/img-08.jpg" alt="image description"></div>
                        </div>
                        <a class="tg-btnaddtowishlist" href="javascript:void(0);">
                          <i class="icon-heart"></i>
                          <span>add to wishlist</span>
                        </a>
                      </figure>
                      <div class="tg-postbookcontent">
                        <ul class="tg-bookscategories">
                          <li><a href="javascript:void(0);">Adventure</a></li>
                          <li><a href="javascript:void(0);">Fun</a></li>
                        </ul>
                        <div class="tg-booktitle">
                          <h3><a href="javascript:void(0);">Drive Safely, No Bumping</a></h3>
                        </div>
                        <span class="tg-bookwriter">By: <a href="javascript:void(0);">Sunshine Orlando</a></span>
                        <span class="tg-stars"><span></span></span>
                      </div>
                    </div>
                  </div>
                  <div class="col-xs-4 col-sm-4 col-md-3 col-lg-4 hidden-md">
                    <div class="tg-postbook">
                      <figure class="tg-featureimg">
                        <div class="tg-bookimg">
                          <div class="tg-frontcover"><img src="images/books/img-09.jpg" alt="image description"></div>
                          <div class="tg-backcover"><img src="images/books/img-09.jpg" alt="image description"></div>
                        </div>
                        <a class="tg-btnaddtowishlist" href="javascript:void(0);">
                          <i class="icon-heart"></i>
                          <span>add to wishlist</span>
                        </a>
                      </figure>
                      <div class="tg-postbookcontent">
                        <ul class="tg-bookscategories">
                          <li><a href="javascript:void(0);">Adventure</a></li>
                          <li><a href="javascript:void(0);">Fun</a></li>
                        </ul>
                        <div class="tg-booktitle">
                          <h3><a href="javascript:void(0);">Let The Good Times Roll Up</a></h3>
                        </div>
                        <span class="tg-bookwriter">By: <a href="javascript:void(0);">Elisabeth Ronning</a></span>
                        <span class="tg-stars"><span></span></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="tg-parallax tg-bgcollectioncount tg-haslayout" data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll" data-image-src="images/parallax/bgparallax-04.jpg">
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
              <h2><span>Latest News &amp; Articles</span>What's Hot in The News</h2>
              <a class="tg-btn" href="javascript:void(0);">View All</a>
            </div>
          </div>
          <div id="tg-postslider" class="tg-postslider tg-blogpost owl-carousel">
            <article class="item tg-post">
              <figure><a href="javascript:void(0);"><img src="images/blog/img-01.jpg" alt="image description"></a></figure>
              <div class="tg-postcontent">
                <ul class="tg-bookscategories">
                  <li><a href="javascript:void(0);">Adventure</a></li>
                  <li><a href="javascript:void(0);">Fun</a></li>
                </ul>
                <div class="tg-themetagbox"><span class="tg-themetag">featured</span></div>
                <div class="tg-posttitle">
                  <h3><a href="javascript:void(0);">Where The Wild Things Are</a></h3>
                </div>
                <span class="tg-bookwriter">By: <a href="javascript:void(0);">Kathrine Culbertson</a></span>
                <ul class="tg-postmetadata">
                  <li><a href="javascript:void(0);"><i class="fa fa-comment-o"></i><i>21,415 Comments</i></a></li>
                  <li><a href="javascript:void(0);"><i class="fa fa-eye"></i><i>24,565 Views</i></a></li>
                </ul>
              </div>
            </article>
            <article class="item tg-post">
              <figure><a href="javascript:void(0);"><img src="images/blog/img-02.jpg" alt="image description"></a></figure>
              <div class="tg-postcontent">
                <ul class="tg-bookscategories">
                  <li><a href="javascript:void(0);">Adventure</a></li>
                  <li><a href="javascript:void(0);">Fun</a></li>
                </ul>
                <div class="tg-themetagbox"><span class="tg-themetag">featured</span></div>
                <div class="tg-posttitle">
                  <h3><a href="javascript:void(0);">All She Wants To Do Is Dance</a></h3>
                </div>
                <span class="tg-bookwriter">By: <a href="javascript:void(0);">Kathrine Culbertson</a></span>
                <ul class="tg-postmetadata">
                  <li><a href="javascript:void(0);"><i class="fa fa-comment-o"></i><i>21,415 Comments</i></a></li>
                  <li><a href="javascript:void(0);"><i class="fa fa-eye"></i><i>24,565 Views</i></a></li>
                </ul>
              </div>
            </article>
            <article class="item tg-post">
              <figure><a href="javascript:void(0);"><img src="images/blog/img-03.jpg" alt="image description"></a></figure>
              <div class="tg-postcontent">
                <ul class="tg-bookscategories">
                  <li><a href="javascript:void(0);">Adventure</a></li>
                  <li><a href="javascript:void(0);">Fun</a></li>
                </ul>
                <div class="tg-themetagbox"><span class="tg-themetag">featured</span></div>
                <div class="tg-posttitle">
                  <h3><a href="javascript:void(0);">Why Walk When You Can Climb?</a></h3>
                </div>
                <span class="tg-bookwriter">By: <a href="javascript:void(0);">Kathrine Culbertson</a></span>
                <ul class="tg-postmetadata">
                  <li><a href="javascript:void(0);"><i class="fa fa-comment-o"></i><i>21,415 Comments</i></a></li>
                  <li><a href="javascript:void(0);"><i class="fa fa-eye"></i><i>24,565 Views</i></a></li>
                </ul>
              </div>
            </article>
            <article class="item tg-post">
              <figure><a href="javascript:void(0);"><img src="images/blog/img-04.jpg" alt="image description"></a></figure>
              <div class="tg-postcontent">
                <ul class="tg-bookscategories">
                  <li><a href="javascript:void(0);">Adventure</a></li>
                  <li><a href="javascript:void(0);">Fun</a></li>
                </ul>
                <div class="tg-themetagbox"><span class="tg-themetag">featured</span></div>
                <div class="tg-posttitle">
                  <h3><a href="javascript:void(0);">Dance Like Nobody’s Watching</a></h3>
                </div>
                <span class="tg-bookwriter">By: <a href="javascript:void(0);">Kathrine Culbertson</a></span>
                <ul class="tg-postmetadata">
                  <li><a href="javascript:void(0);"><i class="fa fa-comment-o"></i><i>21,415 Comments</i></a></li>
                  <li><a href="javascript:void(0);"><i class="fa fa-eye"></i><i>24,565 Views</i></a></li>
                </ul>
              </div>
            </article>
            <article class="item tg-post">
              <figure><a href="javascript:void(0);"><img src="images/blog/img-02.jpg" alt="image description"></a></figure>
              <div class="tg-postcontent">
                <ul class="tg-bookscategories">
                  <li><a href="javascript:void(0);">Adventure</a></li>
                  <li><a href="javascript:void(0);">Fun</a></li>
                </ul>
                <div class="tg-themetagbox"><span class="tg-themetag">featured</span></div>
                <div class="tg-posttitle">
                  <h3><a href="javascript:void(0);">All She Wants To Do Is Dance</a></h3>
                </div>
                <span class="tg-bookwriter">By: <a href="javascript:void(0);">Kathrine Culbertson</a></span>
                <ul class="tg-postmetadata">
                  <li><a href="javascript:void(0);"><i class="fa fa-comment-o"></i><i>21,415 Comments</i></a></li>
                  <li><a href="javascript:void(0);"><i class="fa fa-eye"></i><i>24,565 Views</i></a></li>
                </ul>
              </div>
            </article>
            <article class="item tg-post">
              <figure><a href="javascript:void(0);"><img src="images/blog/img-03.jpg" alt="image description"></a></figure>
              <div class="tg-postcontent">
                <ul class="tg-bookscategories">
                  <li><a href="javascript:void(0);">Adventure</a></li>
                  <li><a href="javascript:void(0);">Fun</a></li>
                </ul>
                <div class="tg-themetagbox"><span class="tg-themetag">featured</span></div>
                <div class="tg-posttitle">
                  <h3><a href="javascript:void(0);">Why Walk When You Can Climb?</a></h3>
                </div>
                <span class="tg-bookwriter">By: <a href="javascript:void(0);">Kathrine Culbertson</a></span>
                <ul class="tg-postmetadata">
                  <li><a href="javascript:void(0);"><i class="fa fa-comment-o"></i><i>21,415 Comments</i></a></li>
                  <li><a href="javascript:void(0);"><i class="fa fa-eye"></i><i>24,565 Views</i></a></li>
                </ul>
              </div>
            </article>
          </div>
        </div>
      </div>
    </section>

    <jsp:include page="footer.jsp"/>
  </div>
</body>
</html>
