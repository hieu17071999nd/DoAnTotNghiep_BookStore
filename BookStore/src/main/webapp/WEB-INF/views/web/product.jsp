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
              <div class="col-xs-12 col-sm-10 col-md-10 col-lg-11 pull-left">
                <div id="tg-content" class="tg-content">
                  <div class="tg-products">
                    <div class="tg-productgrid">
                      <div class="tg-refinesearch">
                        <span>Tìm thấy ... sản phẩm</span>
                        <form class="tg-formtheme tg-formsortshoitems">
                          <fieldset>
                            <div class="form-group">
                              <label>Sắp xếp theo:</label>
                              <span class="tg-select">
																<select>
																	<option>Giá</option>
																	<option>Tên</option>
																	<option>name</option>
																</select>
															</span>
                            </div>
                          </fieldset>
                        </form>
                      </div>
                      <c:forEach items="${list_product}" var="product">
                        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3">
                          <div class="tg-postbook">
                            <figure class="tg-featureimg">
                              <div class="tg-bookimg">
                                <div class="tg-frontcover"><img src="<c:url value="/resources/images/product/${product.image}"/>" alt="image description"></div>
                                <div class="tg-backcover"><img src="<c:url value="/resources/images/product/${product.image}"/>" alt="image description"></div>
                              </div>
                              <a class="tg-btnaddtowishlist" href="<c:url value="/product/${product.id}"/>">
                                <span>Xem chi tiết</span>
                              </a>
                            </figure>
                            <div class="tg-postbookcontent">
                              <ul class="tg-bookscategories">
                                <li><a href="javascript:void(0);">Art &amp; Photography</a></li>
                              </ul>
                              <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
                              <div class="tg-booktitle">
                                <h3><a href="javascript:void(0);">${product.name}</a></h3>
                              </div>
                              <span class="tg-bookwriter">By: <a href="javascript:void(0);">Angela Gunning</a></span>
                              <span class="tg-stars"><span></span></span>
                              <span class="tg-bookprice">
                                                              <ins>${product.price} VND</ins>
                                                              <del>$27.20</del>
                                                          </span>
<%--                              <a class="tg-btn tg-btnstyletwo" href="javascript:void(0);" >--%>
<%--                                <i class="fa fa-shopping-basket"></i>--%>
<%--                                <em>Add To Basket</em>--%>
<%--                              </a>--%>
                            </div>
                          </div>
                        </div>
                      </c:forEach>
                    </div>
                  </div>
                </div>
              </div>
<%--              <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3 pull-left">--%>
<%--                <aside id="tg-sidebar" class="tg-sidebar">--%>
<%--                  <div class="tg-widget tg-widgetsearch">--%>
<%--                    <form class="tg-formtheme tg-formsearch">--%>
<%--                      <div class="form-group">--%>
<%--                        <button type="submit"><i class="icon-magnifier"></i></button>--%>
<%--                        <input type="search" name="search" class="form-group" placeholder="Search by title, author, key...">--%>
<%--                      </div>--%>
<%--                    </form>--%>
<%--                  </div>--%>
<%--                  <div class="tg-widget tg-catagories">--%>
<%--                    <div class="tg-widgettitle">--%>
<%--                      <h3>Các loại sách</h3>--%>
<%--                    </div>--%>
<%--                    <div class="tg-widgetcontent">--%>
<%--                      <ul>--%>
<%--                        <c:forEach items="${categories}" var="category">--%>
<%--                          <li><a href="<c:url value="/product/category/${category.id}"/>">--%>
<%--                            <span>${category.name}</span><em>28245</em></a></li>--%>
<%--                        </c:forEach>--%>
<%--                      </ul>--%>
<%--                    </div>--%>
<%--                  </div>--%>
<%--                  <div class="tg-widget tg-widgettrending">--%>
<%--                    <div class="tg-widgettitle">--%>
<%--                      <h3>Trending Products</h3>--%>
<%--                    </div>--%>
<%--                    <div class="tg-widgetcontent">--%>
<%--                      <ul>--%>
<%--                        <li>--%>
<%--                          <article class="tg-post">--%>
<%--                            <figure><a href="javascript:void(0);"><img src="images/products/img-04.jpg" alt="image description"></a></figure>--%>
<%--                            <div class="tg-postcontent">--%>
<%--                              <div class="tg-posttitle">--%>
<%--                                <h3><a href="javascript:void(0);">Where The Wild Things Are</a></h3>--%>
<%--                              </div>--%>
<%--                              <span class="tg-bookwriter">By: <a href="javascript:void(0);">Kathrine Culbertson</a></span>--%>
<%--                            </div>--%>
<%--                          </article>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                          <article class="tg-post">--%>
<%--                            <figure><a href="javascript:void(0);"><img src="images/products/img-05.jpg" alt="image description"></a></figure>--%>
<%--                            <div class="tg-postcontent">--%>
<%--                              <div class="tg-posttitle">--%>
<%--                                <h3><a href="javascript:void(0);">Where The Wild Things Are</a></h3>--%>
<%--                              </div>--%>
<%--                              <span class="tg-bookwriter">By: <a href="javascript:void(0);">Kathrine Culbertson</a></span>--%>
<%--                            </div>--%>
<%--                          </article>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                          <article class="tg-post">--%>
<%--                            <figure><a href="javascript:void(0);"><img src="images/products/img-06.jpg" alt="image description"></a></figure>--%>
<%--                            <div class="tg-postcontent">--%>
<%--                              <div class="tg-posttitle">--%>
<%--                                <h3><a href="javascript:void(0);">Where The Wild Things Are</a></h3>--%>
<%--                              </div>--%>
<%--                              <span class="tg-bookwriter">By: <a href="javascript:void(0);">Kathrine Culbertson</a></span>--%>
<%--                            </div>--%>
<%--                          </article>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                          <article class="tg-post">--%>
<%--                            <figure><a href="javascript:void(0);"><img src="images/products/img-07.jpg" alt="image description"></a></figure>--%>
<%--                            <div class="tg-postcontent">--%>
<%--                              <div class="tg-posttitle">--%>
<%--                                <h3><a href="javascript:void(0);">Where The Wild Things Are</a></h3>--%>
<%--                              </div>--%>
<%--                              <span class="tg-bookwriter">By: <a href="javascript:void(0);">Kathrine Culbertson</a></span>--%>
<%--                            </div>--%>
<%--                          </article>--%>
<%--                        </li>--%>
<%--                      </ul>--%>
<%--                    </div>--%>
<%--                  </div>--%>
<%--                </aside>--%>
<%--              </div>--%>
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
        }else {
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
