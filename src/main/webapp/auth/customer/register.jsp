<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("customer") != null) {
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
    <link rel="stylesheet" href="../../assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../assets/css/vendors.css"/>
    <link rel="stylesheet" href="../../assets/css/main.css"/>

    <!-- Icon -->
    <link rel="icon" href="../../assets/img/logo/favicon.jpg"/>

    <title>Ceylonese Envoy | Register</title>
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
                <div class="col-xl-8">
                    <div class="px-50 py-50 sm:px-20 sm:py-20 bg-white shadow-4 rounded-4">

                        <form method="post" id="registerForm" class="row y-gap-20">
                            <div class="col-12">
                                <h1 class="text-22 fw-500">Welcome to Ceylonese Envoy</h1>
                                <p class="mt-10">Already have an account? <a
                                        href="${contextPath}/auth/customer/login.jsp" class="text-blue-1">Sign in</a>
                                </p>
                            </div>

                            <div class="col-12 col-lg-6">
                                <div class="form-input">
                                    <input name="firstName" type="text"/>
                                    <label class="lh-1 text-14 text-light-1">First Name</label>
                                </div>
                            </div>

                            <div class="col-12 col-lg-6">
                                <div class="form-input">
                                    <input name="lastName" type="text" required/>
                                    <label class="lh-1 text-14 text-light-1">Last Name</label>
                                </div>
                            </div>


                            <div class="col-12 col-lg-6">
                                <div class="form-input">
                                    <input name="email" type="text" required/>
                                    <label class="lh-1 text-14 text-light-1">Email</label>
                                </div>
                            </div>

                            <div class="col-12 col-lg-6">
                                <div class="form-input">
                                    <input name="password" type="password" required/>
                                    <label class="lh-1 text-14 text-light-1">Password</label>
                                </div>
                            </div>


                            <div class="col-12">
                                <div class="form-input">
                                    <input name="address" type="text" required/>
                                    <label class="lh-1 text-14 text-light-1">Address</label>
                                </div>
                            </div>


                            <div class="col-12 col-lg-6">
                                <div class="form-input">
                                    <input name="province" type="text" required/>
                                    <label class="lh-1 text-14 text-light-1">State / Province</label>
                                </div>
                            </div>

                            <div class="col-12 col-lg-6">
                                <div class="form-input">
                                    <input name="postalCode" type="text" required/>
                                    <label class="lh-1 text-14 text-light-1">Zip / Postal Code</label>
                                </div>
                            </div>

                            <div class="col-12 col-lg-6">
                                <div class="form-input">
                                    <input name="city" type="text" required/>
                                    <label class="lh-1 text-14 text-light-1">City</label>
                                </div>
                            </div>

                            <div class="col-12 col-lg-6">
                                <div class="form-input">
                                    <input name="country" type="text" required/>
                                    <label class="lh-1 text-14 text-light-1">Country</label>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-input">
                                    <input name="mobile" type="text" required/>
                                    <label class="lh-1 text-14 text-light-1">Mobile Number</label>
                                </div>
                            </div>

                            <div>
                                <span id="registerError" class="text-danger"></span>
                            </div>

                            <div class="col-12 d-grid">
                                <button type="submit" class="button py-20 -dark-1 bg-blue-1 text-white">
                                    Register
                                    <div class="icon-arrow-top-right ml-15"></div>
                                </button>
                            </div>
                        </form>

                        <div class="row y-gap-20 pt-30">
                            <div class="col-12">
                                <div class="text-center px-30">By creating an account, you agree to our Terms of Service
                                    and Privacy Statement.
                                </div>
                            </div>
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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="../../assets/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../../assets/js/vendors.js"></script>
<script src="../../assets/js/main.js"></script>
<script src="../../assets/js/script.js"></script>
</body>
</html>
