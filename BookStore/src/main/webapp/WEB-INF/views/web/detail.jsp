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
            <div class="tg-sectionspace tg-haslayout">
                <div class="container">
                    <div class="row">
                        <div id="tg-twocolumns" class="tg-twocolumns">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pull-left">
                                <input type="hidden" id="product_id" value="${product.id}">
                                <div id="tg-content" class="tg-content">
                                    <div class="tg-featurebook alert" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                        <div class="tg-featureditm">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 hidden-sm hidden-xs">
                                                    <figure><img style="width:200px" src="<c:url value="/resources/images/product/${product.image}"/>" alt="image description"></figure>
                                                </div>
                                                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                                                    <div class="tg-featureditmcontent">
                                                        <div class="tg-themetagbox"><span class="tg-themetag">featured</span></div>
                                                        <div class="tg-booktitle">
                                                            <h3><a href="javascript:void(0);">Things To Know About Green Flat Design</a></h3>
                                                        </div>
                                                        <span class="tg-bookwriter">By: <a href="javascript:void(0);">Farrah Whisenhunt</a></span>
                                                        <span class="tg-stars"><span></span></span>
                                                        <div class="tg-priceandbtn">
                                                                    <span class="tg-bookprice">
                                                                        <ins>$23.18</ins>
                                                                        <del>$30.20</del>
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
                                                            <span style="font-size: 20px;margin-top: 5px;margin-right: 10px;"><b>Số lượng:</b></span>
                                                            <div class="pro-qty">
                                                                <input id="n" type="number" value="1" >
                                                            </div>
                                                            <p style="margin-top:7px;" id="sl"></p>
                                                            <input style="display: none" type="number" id="num">
                                                        </div>
                                                        <button class="tg-btn tg-active tg-btn-lg" id="add_cart">
                                                            Thêm vào giỏ hàng</button>
                                                        <button class="tg-btnaddtowishlist" id="buy">
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
                                                        <li><a href="javascript:void(0);">Art &amp; Photography</a></li>
                                                    </ul>
                                                    <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
                                                    <div class="tg-booktitle">
                                                        <h3>Drive Safely, No Bumping</h3>
                                                    </div>
                                                    <span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
                                                    <span class="tg-stars"><span></span></span>
                                                    <span class="tg-addreviews"><a href="javascript:void(0);">Add Your Review</a></span>
                                                    <div class="tg-share">
                                                        <span>Share:</span>
                                                        <ul class="tg-socialicons">
                                                            <li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
                                                            <li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
                                                            <li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
                                                            <li class="tg-googleplus"><a href="javascript:void(0);"><i class="fa fa-google-plus"></i></a></li>
                                                            <li class="tg-rss"><a href="javascript:void(0);"><i class="fa fa-rss"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="tg-description">
                                                        <p>Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore etdoloreat magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laborisi nisi ut aliquip ex ea commodo consequat aute.</p>
                                                        <p>Arure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat nulla aetur excepteur sint occaecat cupidatat non proident, sunt in culpa quistan officia serunt mollit anim id est laborum sed ut perspiciatis unde omnis iste natus... <a href="javascript:void(0);">More</a></p>
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
                                                        <li><span>Other Fomate:</span><span>CD-Audio, Paperback, E-Book</span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="tg-productdescription">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="tg-sectionhead">
                                                        <h2>Mô tả sản phẩm</h2>
                                                    </div>
                                                    <div class="tg-tab-content tab-content">
                                                        <div role="tabpanel" class="tg-tab-pane tab-pane active" id="description">
                                                            <div class="tg-description">
                                                                <p>Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veni quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenden
                                                                    voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                                                            </div>
                                                        </div>
                                                        <div role="tabpanel" class="tg-tab-pane tab-pane" id="review">
                                                            <div class="tg-description">
                                                                <p>Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veni quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenden
                                                                    voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                                                                <figure class="tg-alignleft">
                                                                    <img src="images/placeholdervtwo.jpg" alt="image description">
                                                                    <iframe src="https://www.youtube.com/embed/aLwpuDpZm1k?rel=0&amp;controls=0&amp;showinfo=0"></iframe>
                                                                </figure>
                                                                <ul class="tg-liststyle">
                                                                    <li><span>Sed do eiusmod tempor incididunt ut labore et dolore</span></li>
                                                                    <li><span>Magna aliqua enim ad minim veniam</span></li>
                                                                    <li><span>Quis nostrud exercitation ullamco laboris nisi ut</span></li>
                                                                    <li><span>Aliquip ex ea commodo consequat aute dolor reprehenderit</span></li>
                                                                    <li><span>Voluptate velit esse cillum dolore eu fugiat nulla pariatur</span></li>
                                                                    <li><span>Magna aliqua enim ad minim veniam</span></li>
                                                                    <li><span>Quis nostrud exercitation ullamco laboris nisi ut</span></li>
                                                                </ul>
                                                                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam remmata aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enimsam
                                                                    voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos quistatoa.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tg-aboutauthor">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                    <div class="tg-sectionhead">
                                                        <h2>Tác giả</h2>
                                                    </div>
                                                    <div class="tg-authorbox">
                                                        <figure class="tg-authorimg">
                                                            <img src="images/author/imag-24.jpg" alt="image description" style="width: 100px">
                                                        </figure>
                                                        <div class="tg-authorinfo">
                                                            <div class="tg-authorhead">
                                                                <div class="tg-leftarea">
                                                                    <div class="tg-authorname">
                                                                        <h2>Kathrine Culbertson</h2>
                                                                        <span>Author Since: June 27, 2017</span>
                                                                    </div>
                                                                </div>
                                                                <div class="tg-rightarea">
                                                                    <ul class="tg-socialicons">
                                                                        <li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
                                                                        <li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
                                                                        <li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
                                                                        <li class="tg-googleplus"><a href="javascript:void(0);"><i class="fa fa-google-plus"></i></a></li>
                                                                        <li class="tg-rss"><a href="javascript:void(0);"><i class="fa fa-rss"></i></a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <div class="tg-description">
                                                                <p>Laborum sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium totam rem aperiam eaque ipsa quae ab illo inventore veritatis etation.</p>
                                                            </div>
                                                        </div>
                                                    </div>
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
                                                        <div class="item">
                                                            <div class="tg-postbook">
                                                                <figure class="tg-featureimg">
                                                                    <div class="tg-bookimg">
                                                                        <div class="tg-frontcover"><img src="images/books/img-01.jpg" alt="image description"></div>
                                                                        <div class="tg-backcover"><img src="images/books/img-01.jpg" alt="image description"></div>
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
                                                                    <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
                                                                    <div class="tg-booktitle">
                                                                        <h3><a href="javascript:void(0);">Help Me Find My Stomach</a></h3>
                                                                    </div>
                                                                    <span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
                                                                    <span class="tg-stars"><span></span></span>
                                                                    <span class="tg-bookprice">
                                                                            <ins>$25.18</ins>
                                                                            <del>$27.20</del>
                                                                        </span>
                                                                    <a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">
                                                                        <i class="fa fa-shopping-basket"></i>
                                                                        <em>Add To Basket</em>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="item">
                                                            <div class="tg-postbook">
                                                                <figure class="tg-featureimg">
                                                                    <div class="tg-bookimg">
                                                                        <div class="tg-frontcover"><img src="images/books/img-02.jpg" alt="image description"></div>
                                                                        <div class="tg-backcover"><img src="images/books/img-02.jpg" alt="image description"></div>
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
                                                                    <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
                                                                    <div class="tg-booktitle">
                                                                        <h3><a href="javascript:void(0);">Drive Safely, No Bumping</a></h3>
                                                                    </div>
                                                                    <span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
                                                                    <span class="tg-stars"><span></span></span>
                                                                    <span class="tg-bookprice">
                                                                            <ins>$25.18</ins>
                                                                            <del>$27.20</del>
                                                                        </span>
                                                                    <a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">
                                                                        <i class="fa fa-shopping-basket"></i>
                                                                        <em>Add To Basket</em>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="item">
                                                            <div class="tg-postbook">
                                                                <figure class="tg-featureimg">
                                                                    <div class="tg-bookimg">
                                                                        <div class="tg-frontcover"><img src="images/books/img-03.jpg" alt="image description"></div>
                                                                        <div class="tg-backcover"><img src="images/books/img-03.jpg" alt="image description"></div>
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
                                                                    <div class="tg-themetagbox"></div>
                                                                    <div class="tg-booktitle">
                                                                        <h3><a href="javascript:void(0);">Let The Good Times Roll Up</a></h3>
                                                                    </div>
                                                                    <span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
                                                                    <span class="tg-stars"><span></span></span>
                                                                    <span class="tg-bookprice">
                                                                            <ins>$25.18</ins>
                                                                            <del>$27.20</del>
                                                                        </span>
                                                                    <a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">
                                                                        <i class="fa fa-shopping-basket"></i>
                                                                        <em>Add To Basket</em>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="item">
                                                            <div class="tg-postbook">
                                                                <figure class="tg-featureimg">
                                                                    <div class="tg-bookimg">
                                                                        <div class="tg-frontcover"><img src="images/books/img-04.jpg" alt="image description"></div>
                                                                        <div class="tg-backcover"><img src="images/books/img-04.jpg" alt="image description"></div>
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
                                                                    <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
                                                                    <div class="tg-booktitle">
                                                                        <h3><a href="javascript:void(0);">Our State Fair Is A Great State Fair</a></h3>
                                                                    </div>
                                                                    <span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
                                                                    <span class="tg-stars"><span></span></span>
                                                                    <span class="tg-bookprice">
                                                                            <ins>$25.18</ins>
                                                                            <del>$27.20</del>
                                                                        </span>
                                                                    <a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">
                                                                        <i class="fa fa-shopping-basket"></i>
                                                                        <em>Add To Basket</em>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="item">
                                                            <div class="tg-postbook">
                                                                <figure class="tg-featureimg">
                                                                    <div class="tg-bookimg">
                                                                        <div class="tg-frontcover"><img src="images/books/img-05.jpg" alt="image description"></div>
                                                                        <div class="tg-backcover"><img src="images/books/img-05.jpg" alt="image description"></div>
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
                                                                    <div class="tg-themetagbox"></div>
                                                                    <div class="tg-booktitle">
                                                                        <h3><a href="javascript:void(0);">Put The Petal To The Metal</a></h3>
                                                                    </div>
                                                                    <span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
                                                                    <span class="tg-stars"><span></span></span>
                                                                    <span class="tg-bookprice">
                                                                            <ins>$25.18</ins>
                                                                            <del>$27.20</del>
                                                                        </span>
                                                                    <a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">
                                                                        <i class="fa fa-shopping-basket"></i>
                                                                        <em>Add To Basket</em>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="item">
                                                            <div class="tg-postbook">
                                                                <figure class="tg-featureimg">
                                                                    <div class="tg-bookimg">
                                                                        <div class="tg-frontcover"><img src="images/books/img-06.jpg" alt="image description"></div>
                                                                        <div class="tg-backcover"><img src="images/books/img-06.jpg" alt="image description"></div>
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
                                                                    <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
                                                                    <div class="tg-booktitle">
                                                                        <h3><a href="javascript:void(0);">Help Me Find My Stomach</a></h3>
                                                                    </div>
                                                                    <span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
                                                                    <span class="tg-stars"><span></span></span>
                                                                    <span class="tg-bookprice">
                                                                            <ins>$25.18</ins>
                                                                            <del>$27.20</del>
                                                                        </span>
                                                                    <a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">
                                                                        <i class="fa fa-shopping-basket"></i>
                                                                        <em>Add To Basket</em>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="item">
                                                            <div class="tg-postbook">
                                                                <figure class="tg-featureimg">
                                                                    <div class="tg-bookimg">
                                                                        <div class="tg-frontcover"><img src="images/books/img-03.jpg" alt="image description"></div>
                                                                        <div class="tg-backcover"><img src="images/books/img-03.jpg" alt="image description"></div>
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
                                                                    <div class="tg-themetagbox"></div>
                                                                    <div class="tg-booktitle">
                                                                        <h3><a href="javascript:void(0);">Let The Good Times Roll Up</a></h3>
                                                                    </div>
                                                                    <span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
                                                                    <span class="tg-stars"><span></span></span>
                                                                    <span class="tg-bookprice">
                                                                            <ins>$25.18</ins>
                                                                            <del>$27.20</del>
                                                                        </span>
                                                                    <a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">
                                                                        <i class="fa fa-shopping-basket"></i>
                                                                        <em>Add To Basket</em>
                                                                    </a>
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
<%--                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3 pull-left">--%>
<%--                                <aside id="tg-sidebar" class="tg-sidebar">--%>
<%--                                    <div class="tg-widget tg-widgetsearch">--%>
<%--                                        <form class="tg-formtheme tg-formsearch">--%>
<%--                                            <div class="form-group">--%>
<%--                                                <button type="submit"><i class="icon-magnifier"></i></button>--%>
<%--                                                <input type="search" name="search" class="form-group" placeholder="Search by title, author, key...">--%>
<%--                                            </div>--%>
<%--                                        </form>--%>
<%--                                    </div>--%>
<%--                                    <div class="tg-widget tg-catagories">--%>
<%--                                        <div class="tg-widgettitle">--%>
<%--                                            <h3>Các loại sách</h3>--%>
<%--                                        </div>--%>
<%--                                        <div class="tg-widgetcontent">--%>
<%--                                            <ul>--%>
<%--                                                <c:forEach items="${categories}" var="category">--%>
<%--                                                    <li><a href="javascript:void(0);"><span>${category.name}</span><em>12345</em></a></li>--%>
<%--                                                </c:forEach>--%>
<%--                                            </ul>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="tg-widget tg-widgettrending">--%>
<%--                                        <div class="tg-widgettitle">--%>
<%--                                            <h3>Trending Products</h3>--%>
<%--                                        </div>--%>
<%--                                        <div class="tg-widgetcontent">--%>
<%--                                            <ul>--%>
<%--                                                <li>--%>
<%--                                                    <article class="tg-post">--%>
<%--                                                        <figure><a href="javascript:void(0);"><img src="images/products/img-04.jpg" alt="image description"></a></figure>--%>
<%--                                                        <div class="tg-postcontent">--%>
<%--                                                            <div class="tg-posttitle">--%>
<%--                                                                <h3><a href="javascript:void(0);">Where The Wild Things Are</a></h3>--%>
<%--                                                            </div>--%>
<%--                                                            <span class="tg-bookwriter">By: <a href="javascript:void(0);">Kathrine Culbertson</a></span>--%>
<%--                                                        </div>--%>
<%--                                                    </article>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <article class="tg-post">--%>
<%--                                                        <figure><a href="javascript:void(0);"><img src="images/products/img-05.jpg" alt="image description"></a></figure>--%>
<%--                                                        <div class="tg-postcontent">--%>
<%--                                                            <div class="tg-posttitle">--%>
<%--                                                                <h3><a href="javascript:void(0);">Where The Wild Things Are</a></h3>--%>
<%--                                                            </div>--%>
<%--                                                            <span class="tg-bookwriter">By: <a href="javascript:void(0);">Kathrine Culbertson</a></span>--%>
<%--                                                        </div>--%>
<%--                                                    </article>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <article class="tg-post">--%>
<%--                                                        <figure><a href="javascript:void(0);"><img src="images/products/img-06.jpg" alt="image description"></a></figure>--%>
<%--                                                        <div class="tg-postcontent">--%>
<%--                                                            <div class="tg-posttitle">--%>
<%--                                                                <h3><a href="javascript:void(0);">Where The Wild Things Are</a></h3>--%>
<%--                                                            </div>--%>
<%--                                                            <span class="tg-bookwriter">By: <a href="javascript:void(0);">Kathrine Culbertson</a></span>--%>
<%--                                                        </div>--%>
<%--                                                    </article>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <article class="tg-post">--%>
<%--                                                        <figure><a href="javascript:void(0);"><img src="images/products/img-07.jpg" alt="image description"></a></figure>--%>
<%--                                                        <div class="tg-postcontent">--%>
<%--                                                            <div class="tg-posttitle">--%>
<%--                                                                <h3><a href="javascript:void(0);">Where The Wild Things Are</a></h3>--%>
<%--                                                            </div>--%>
<%--                                                            <span class="tg-bookwriter">By: <a href="javascript:void(0);">Kathrine Culbertson</a></span>--%>
<%--                                                        </div>--%>
<%--                                                    </article>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </aside>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"/>
    </div>
    <script>
        $(document).ready(function () {
            <%--var price=$("#price1").val();--%>
            <%--$("#price").text("Giá: "+new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price));--%>

            <%--$("[name=size]").click(function () {--%>
            <%--    var color = $("[name=color]:checked").val();--%>
            <%--    var size = $("[name=size]:checked").val();--%>
            <%--    var productId = $("#product_id").val();--%>
            <%--    $.ajax({--%>
            <%--        url: "<c:url value="/get-detail"/>",--%>
            <%--        type: "get",--%>
            <%--        data: {--%>
            <%--            color: color,--%>
            <%--            size: size,--%>
            <%--            productId: productId--%>
            <%--        },--%>
            <%--        dataType: "json",--%>
            <%--        success: function (result) {--%>
            <%--            console.log(result);--%>
            <%--            $("#sl").html("Còn " + result.number + " hàng");--%>
            <%--            $("#num").val(result.number);--%>
            <%--            var num=result.number;--%>
            <%--            var oldValue=$("#n").val();--%>
            <%--            if(oldValue>num){--%>
            <%--                var newValue=num;--%>
            <%--                $("#n").val(newValue);--%>
            <%--            }--%>
            <%--        }--%>
            <%--    });--%>
            <%--});--%>
            <%--$("[name=color]").click(function(){--%>
            <%--    var color = $("[name=color]:checked").val();--%>
            <%--    var size = $("[name=size]:checked").val();--%>
            <%--    var productId = $("#product_id").val();--%>
            <%--    $.ajax({--%>
            <%--        url: "<c:url value="/get-detail"/>",--%>
            <%--        type: "get",--%>
            <%--        data: {--%>
            <%--            color: color,--%>
            <%--            size: size,--%>
            <%--            productId: productId--%>
            <%--        },--%>
            <%--        dataType: "json",--%>
            <%--        success: function (result) {--%>
            <%--            console.log(result);--%>
            <%--            $("#sl").html("Còn " + result.number + " hàng");--%>
            <%--            $("#num").val(result.number);--%>
            <%--            var num=result.number;--%>
            <%--            var oldValue=$("#n").val();--%>
            <%--            if(oldValue>num){--%>
            <%--                var newValue=num;--%>
            <%--                $("#n").val(newValue);--%>
            <%--            }--%>
            <%--        }--%>
            <%--    });--%>
            <%--});--%>
            $("#add_cart").click(function (){
                var n=$("#n").val();
                var num=$("#num").val();
                var productId = $("#product_id").val();
                var customerId=$("#customer_id").val();
                    if(parseFloat(n)==0){
                        alert("Nhập trên 1 sản phẩm");
                    }else {
                        if(customerId==""){
                            alert("Vui lòng đăng nhập")
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
                var n=$("#n").val();
                var num=$("#num").val();
                var productId = $("#product_id").val();
                var customerId=$("#customer_id").val();

                    if(parseFloat(n)==0){
                        alert("Nhập trên 1 sản phẩm");
                    } else {
                        if(customerId==""){
                            alert("Vui lòng đăng nhập")
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
