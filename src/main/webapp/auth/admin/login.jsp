<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("admin") != null) {
        response.sendRedirect(request.getContextPath() + "/admin");
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

    <title>Ceylonese Envoy | Admin Login</title>
</head>
<body>
<%-- Preloader --%>
<%@include file="../../includes/preloader.jsp" %>

<main class="bg-blue-2 min-vh-100">

    <section class="layout-pt-lg layout-pb-lg ">
        <div class="container">
            <div class="row justify-center">
                <div class="col-xl-6 col-lg-7 col-md-9">
                    <div class="px-50 py-50 sm:px-20 sm:py-20 bg-white shadow-4 rounded-4">
                        <form method="post" id="adminLoginForm" class="row y-gap-20">
                            <div class="col-12">
                                <h1 class="text-22 fw-500">Admin Login!</h1>
                            </div>

                            <div class="col-12">
                                <div class="form-input ">
                                    <input type="text" id="email" name="email" required>
                                    <label for="email" class="lh-1 text-14 text-light-1">Username</label>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-input ">
                                    <input type="password" id="password" name="password" required>
                                    <label for="password" class="lh-1 text-14 text-light-1">Password</label>
                                </div>
                            </div>
                            <div>
                                <span class="text-danger" id="adminLoginError"></span>
                            </div>

                            <div class="col-12 d-grid">

                                <button type="submit" class="button py-20 -dark-1 bg-blue-1 text-white">
                                    Sign In
                                    <div class="icon-arrow-top-right ml-15"></div>
                                </button>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

</main>

<!-- JavaScript -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAAz77U5XQuEME6TpftaMdX0bBelQxXRlM"></script>
<script src="https://unpkg.com/@googlemaps/markerclusterer/dist/index.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="../../assets/js/bootstrap.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="../../assets/js/vendors.js"></script>
<script src="../../assets/js/main.js"></script>
<script src="../../assets/js/admin.js"></script>
</body>
</html>
