<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("user") != null) {
        response.sendRedirect(request.getContextPath() + "/customer");
        return;
    }
%>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- Google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com/"/>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@400;500;600&amp;display=swap" rel="stylesheet"/>

    <!-- Stylesheets -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="../../assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../assets/css/vendors.css"/>
    <link rel="stylesheet" href="../../assets/css/main.css"/>

    <!-- Icon -->
    <link rel="icon" href="../../assets/img/logo/favicon.jpg"/>

    <title>Ceylonese Envoy | Login</title>
</head>
<body>
<%-- Preloader --%>
<%@include file="../../includes/preloader.jsp" %>

<main>
    <%-- Header Start --%>
    <%@include file="../../includes/header-light.jsp" %>
    <%-- Header End --%>

    <section class="layout-pt-lg layout-pb-lg bg-blue-2">
        <div class="container">
            <div class="row justify-center">
                <div class="col-xl-6 col-lg-7 col-md-9">
                    <div class="px-50 py-50 sm:px-20 sm:py-20 bg-white shadow-4 rounded-4">
                        <form method="post" id="loginForm" class="row y-gap-20">
                            <div class="col-12">
                                <h1 class="text-22 fw-500">Welcome back!!!</h1>
                                <p class="mt-10">Don't have an account yet? <a
                                        href="${contextPath}/auth/customer/register.jsp" class="text-blue-1">Register
                                    for
                                    free</a></p>
                            </div>

                            <div class="col-12">
                                <div class="form-input ">
                                    <input type="text" id="email" name="email" required>
                                    <label for="email" class="lh-1 text-14 text-light-1">Email</label>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-input ">
                                    <input type="password" id="password" name="password" required>
                                    <label for="password" class="lh-1 text-14 text-light-1">Password</label>
                                </div>
                            </div>
                            <div>
                                <span class="text-danger" id="loginError"></span>
                            </div>

                            <div class="col-12">
                                <a href="forgot-password.jsp" class="text-14 fw-500 text-blue-1 underline">Forgot your
                                    password?</a>
                            </div>

                            <div class="col-12 d-grid">

                                <button type="submit" class="button py-20 -dark-1 bg-blue-1 text-white">
                                    Sign In
                                    <div class="icon-arrow-top-right ml-15"></div>
                                </button>

                            </div>
                        </form>

                        <div class="row y-gap-20 pt-30">
                            <%-- <div class="col-12"> --%>
                            <%--     <div class="text-center">or sign in with</div> --%>

                            <%--     <button class="button col-12 -outline-blue-1 text-blue-1 py-15 rounded-8 mt-10"> --%>
                            <%--         <i class="icon-apple text-15 mr-10"></i> --%>
                            <%--         Facebook --%>
                            <%--     </button> --%>

                            <%--     <button class="button col-12 -outline-red-1 text-red-1 py-15 rounded-8 mt-15"> --%>
                            <%--         <i class="icon-apple text-15 mr-10"></i> --%>
                            <%--         Google --%>
                            <%--     </button> --%>

                            <%--     <button class="button col-12 -outline-dark-2 text-dark-2 py-15 rounded-8 mt-15"> --%>
                            <%--         <i class="icon-apple text-15 mr-10"></i> --%>
                            <%--         Apple --%>
                            <%--     </button> --%>
                            <%-- </div> --%>

                            <%-- <div class="col-12"> --%>
                            <%--     <div class="text-center px-30">By creating an account, you agree to our Terms of Service and Privacy Statement.</div> --%>
                            <%-- </div> --%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%-- Footer Start --%>
    <%@include file="../../includes/footer.jsp" %>
    <%-- Footer End --%>
</main>

<!-- JavaScript -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAAz77U5XQuEME6TpftaMdX0bBelQxXRlM"></script>
<script src="https://unpkg.com/@googlemaps/markerclusterer/dist/index.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="../../assets/js/bootstrap.min.js"></script>
<script src="../../assets/js/vendors.js"></script>
<script src="../../assets/js/main.js"></script>
<script src="../../assets/js/script.js"></script>
</body>
</html>
