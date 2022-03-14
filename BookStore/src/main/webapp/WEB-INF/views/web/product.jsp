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
    <main id="tg-main" class="tg-main tg-haslayout">
      <div class="tg-sectionspace tg-haslayout">
        <div class="container">
          <div class="row">
            <div id="tg-twocolumns" class="tg-twocolumns">
              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pull-left">
                <div id="tg-content" class="tg-content">
                  <div class="tg-products">
                    <c:choose>
                      <c:when test="${products.size() != 0}">
                        <div class="tg-productgrid">
<%--                          <div class="tg-refinesearch">--%>
<%--                            <span>Tìm thấy ${products.size()} sản phẩm</span>--%>
<%--                            <form class="tg-formtheme tg-formsortshoitems">--%>
<%--                              <fieldset>--%>
<%--                                <div class="form-group">--%>
<%--                                  <label>Sắp xếp:</label>--%>
<%--                                  <span class="tg-select">--%>
<%--                                    <select>--%>
<%--                                      <option>tên</option>--%>
<%--                                      <option>giá</option>--%>
<%--                                    </select>--%>
<%--                                  </span>--%>
<%--                                </div>--%>
<%--                              </fieldset>--%>
<%--                            </form>--%>
<%--                          </div>--%>
                          <form action="<c:url value='/searchProduct'/>" id="formSubmit" method="get">
                            <c:forEach items="${products}" var="product">
                              <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3">
                                <div class="tg-postbook">
                                  <figure class="tg-featureimg">
                                    <div class="tg-bookimg" style="width: 80%">
                                      <div class="tg-frontcover"><img src="<c:url value="/resources/images/product/${product.image}"/>" alt="image description" style="height: 250px"></div>
                                      <div class="tg-backcover"><img src="<c:url value="/resources/images/product/${product.image}"/>" alt="image description"></div>
                                    </div>
                                    <a class="tg-btnaddtowishlist" href="<c:url value="/product/${product.id}"/>">
                                      <span>Xem chi tiết</span>
                                    </a>
                                  </figure>
                                  <div class="tg-postbookcontent">
                                      <%--                              <ul class="tg-bookscategories">--%>
                                      <%--                                <li><a href="javascript:void(0);">Art &amp; Photography</a></li>--%>
                                      <%--                              </ul>--%>
                                      <%--                              <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>--%>
                                    <div class="tg-booktitle">
                                      <h3><a href="javascript:void(0);">${product.name}</a></h3>
                                    </div>
                                      <%--                              <span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>--%>
                                      <%--                              <span class="tg-stars"><span></span></span>--%>
                                    <span class="tg-bookprice">
                                  <input id="price1${product.id}" type="hidden" value="${product.price}">
                                                                <ins id="price${product.id}"></ins>
  <%--                                                              <del>$27.20</del>--%>
                                                            </span>
                                      <%--                              <a class="tg-btn tg-btnstyletwo" href="javascript:void(0);" >--%>
                                      <%--                                <i class="fa fa-shopping-basket"></i>--%>
                                      <%--                                <em>Add To Basket</em>--%>
                                      <%--                              </a>--%>
                                  </div>
                                </div>
                              </div>
                            </c:forEach>
                            <input type="hidden" value="" id="page" name="page"/>
                            <input type="hidden" value="" id="maxPageItem" name="maxPageItem"/>
                            <input type="hidden" value="${search}" id="search" name="search"/>
                            <input type="hidden" value="${categoryId}" id="categoryId" name="categoryId"/>
                          </form>
                          <br>
                          <br>
                        </div>
                        <ul class="pagination" id="pagination" style="margin-left: 400px"></ul>
                      </c:when>
                      <c:when test="${products.size() == 0}">
                        <div class="tg-productgrid">
                          <div class="tg-refinesearch">
                            <span>Không tìm thấy sản phẩm nào!</span>
                          </div>
                        </div>
                      </c:when>
                    </c:choose>
                    <br>
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
    $(function () {
      debugger;
      var totalPages = ${totalPage};
      var currentPage = ${page};
      var limit = 4;
      window.pagObj = $('#pagination').twbsPagination({
        totalPages: totalPages,
        visiblePages: 10,
        startPage: currentPage,
        onPageClick: function (event, page) {
          debugger;
          if (currentPage != page) {
            debugger;
            $('#maxPageItem').val(limit);
            $('#page').val(page);
            $('#formSubmit').submit();
          }
          console.info(page + ' (from options)');
        }
      }).on('page', function (event, page) {
        console.info(page + ' (from event listening)');
      });
    });

    $(document).ready(function () {
      <c:forEach items="${products}" var="product">
      var price=$("#price1${product.id}").val();
      $("#price${product.id}").text(new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price));
      </c:forEach>
    });
  </script>
</body>
</html>
