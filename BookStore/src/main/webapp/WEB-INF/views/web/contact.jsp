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
      <!--************************************
              Contact Us Start
      *************************************-->
      <div class="tg-sectionspace tg-haslayout">
        <div class="container">
          <div class="row">
            <div class="tg-contactus">
              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="tg-sectionhead">
                  <h2>Thế giới sách</h2>
                </div>
              </div>
              <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                <div id="tg-locationmap" class="tg-locationmap tg-map"></div>
              </div>
              <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                <div class="tg-contactdetail">
                  <div class="tg-sectionhead">
                    <h2>Địa chỉ</h2>
                  </div>
                  <ul class="tg-contactinfo">
                    <li>
                      <i class="icon-apartment"></i>
                      <address>Số 55, đường Giải Phóng</address>
                    </li>
                    <li>
                      <i class="icon-phone-handset"></i>
                      <span>
												<em>0971 5476 - 95</em>
												<em>+84 24386 - 914 - 58</em>
											</span>
                    </li>
                    <li>
                      <i class="icon-clock"></i>
                      <span>Làm việc từ 9h - 18h</span>
                    </li>
                    <li>
                      <i class="icon-envelope"></i>
                      <span>
												<em><a href="mailto:support@domain.com">hieumv99nd@gmail.com</a></em>
												<em><a href="mailto:info@domain.com">hieu79862@nuce.edu.com</a></em>
											</span>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>

    <jsp:include page="footer.jsp"/>
  </div>
</body>
</html>

