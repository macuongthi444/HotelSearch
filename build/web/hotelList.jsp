
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Tourist - Travel Agency HTML Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <style>
            .giaTien{
                font-size: 20px
            }
        </style>
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->



        <!-- Navbar & Hero Start -->
        <jsp:include page="menu.jsp"></jsp:include>

            <div class="container-fluid bg-primary py-5 mb-5 hero-header">
                <div class="container py-5">
                    <div class="row justify-content-center py-5">
                        <div class="col-lg-10 pt-lg-5 mt-lg-5 text-center">
                            <h1 class="display-3 text-white animated slideInDown">Danh sách khách sạn</h1>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Navbar & Hero End -->


            <!-- Contact Start -->
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                        <h6 class="section-title bg-white text-center text-primary px-3">Danh sách khách sạn</h6>
                        <h1 class="mb-5">Những sự lựa chọn tốt nhất cho bạn</h1>
                    </div>
                    <div class="nav-item dropdown">
                        <div class = giaTien><a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Giá tiền</a></div>
                        <div class="dropdown-menu m-0">
                            <form action="country">
                                <input type="submit" value="accending" name="sort">
                                <input type="submit" value="decending" name="sort">
                            </form>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Mới nhất</a>
                        <div class="dropdown-menu m-0">

                            <form action="country">
                                <input type="submit" value="accending" name="sortRate">
                                <input type="submit" value="decending" name="sortRate">
                            </form>
                        </div>

                    </div>
                    <div class="row justify-content-center">

                    <c:forEach items="${listH}" var="h" varStatus="status">

                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="${status.index * 0.1}">
                            <div class="package-item">
                                <div class="overflow-hidden">
                                    <img class="imageChange" src="${h.image_url}" alt="">
                                </div>
                                <div class="d-flex border-bottom">
                                    <small class="flex-fill text-center border-end py-2"><i class="fa fa-map-marker-alt text-primary me-2"></i>${h.name}</small>
                                    <small class="flex-fill text-center border-end py-2"><i class="fa fa-map-marker-alt text-primary me-2"></i>${h.country_id}</small>
                                </div>
                                <div class="text-center p-4">
                                    <h3 class="mb-0">${h.price_range}VNĐ</h3>
                                    <p class="mb-4">Đánh giá: ${h.rate} <small class="fa fa-star text-primary"></small></p>

                                    <div class="d-flex justify-content-center mb-2">
                                        <a href="detail?hid=${h.hotel_id}" class="btn btn-primary rounded-pill py-2 px-4">Chi tiết</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- Chèn mã CSS để thêm khoảng cách giữa các cột --%>
                        <%-- (Ở đây sử dụng lớp "mb-4" để thêm khoảng cách dưới mỗi cột) --%>
                        <%-- Nếu không muốn sử dụng lớp "mb-4", bạn có thể thay thế bằng CSS tùy chỉnh --%>
                        <style>
                            .package-item {
                                margin-bottom: 2rem;
                            }
                        </style>
                        <style>
                            .imageChange {
                                max-width: 400px;
                                height: 400px;
                            }
                        </style>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- Contact End -->


        <!-- Footer Start -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>