<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-fluid position-relative p-0">
    <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
        <a href="home" class="navbar-brand p-0">
            <h1 class="text-primary m-0"><i class="fa fa-map-marker-alt me-3"></i>Search Hotel</h1>
        </a>
        <form action="search" method="get">
            <div class="position-relative w-1000 mx-auto animated slideInDown" style="width: 600px;">
                <input name="txt" class="form-control border-0 rounded-pill w-100 py-3 ps-4 pe-5" type="text" placeholder="Eg: Thailand">
                <button type="submit" class="btn btn-primary rounded-pill py-2 px-4 position-absolute top-0 end-0 me-2" style="margin-top: 7px;">Search</button>
            </div>
        </form>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="fa fa-bars"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto py-0">
                <a href="home" class="nav-item nav-link">Home</a>
                <a href="country" class="nav-item nav-link">All Hotel</a> 
             
<!--                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Manager</a>
                    <div class="dropdown-menu m-0">
                        
                        <a href="hotelmanager" class="dropdown-item">Hotel</a>
                        <a href="countrymanager" class="dropdown-item">Country</a>
                    </div>
                </div>-->
               
            </div>
            <c:if test ="${sessionScope.acc == null}">
                <a href="login.jsp" class="btn btn-primary rounded-pill py-2 px-4">Đăng nhập</a>
            </c:if>
            <c:if test ="${sessionScope.acc != null}">
                <div class="navbar-nav ms-auto py-0">
                    <a href="index.html" class="nav-item nav-link">Xin chào ${sessionScope.acc.username}</a>
                </div>
                <a href="logout" class="btn btn-primary rounded-pill py-2 px-4">Đăng xuất</a>
            </c:if>
        </div>
    </nav>
</div>