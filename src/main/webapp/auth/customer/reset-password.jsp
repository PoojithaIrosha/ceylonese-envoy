<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("user") != null) {
        response.sendRedirect(request.getContextPath() + "/customer");
        return;
    }

    String email = request.getParameter("email");
    String uuid = request.getParameter("uuid");

    if ((email == null || email.isEmpty()) && (uuid == null || uuid.isEmpty())) {
        response.sendRedirect(request.getContextPath() + "/auth/customer/login.jsp");
        return;
    }

%>
<html>
<head>
    <title>Ceylonese Envoy | Reset Password</title>

    <link rel="stylesheet" href="../../assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../assets/css/main.css"/>
</head>
<body>
<%@ include file="../../includes/preloader.jsp" %>
<main>
    <section class="vh-100 layout-pt-lg layout-pb-lg bg-blue-2">
        <div class="container">
            <div class="row justify-center">
                <div class="col-xl-6 col-lg-7 col-md-9">
                    <div class="px-50 py-50 sm:px-20 sm:py-20 bg-white shadow-4 rounded-4">

                        <form method="post" id="resetPwdForm" class="row y-gap-20">
                            <div class="col-12">
                                <h1 class="text-22 fw-500">Reset your password</h1>
                                <p>Create a new password for your account </p>
                            </div>

                            <div>
                                <input type="text" name="email" value="<%= email %>" hidden>
                                <input type="text" name="uuid" value="<%= uuid %>" hidden>
                            </div>

                            <div class="col-12">
                                <div class="form-input ">
                                    <input type="password" id="password" name="password" required>
                                    <label for="password" class="lh-1 text-14 text-light-1">New Password</label>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-input ">
                                    <input type="password" id="cpassword" name="cPassword" required>
                                    <label for="cpassword" class="lh-1 text-14 text-light-1">Confirm Password</label>
                                </div>
                            </div>

                            <%-- <div> --%>
                            <%--     <span class="text-danger" id="fPwdError"></span> --%>
                            <%-- </div> --%>

                            <%-- <div id="fPwdSuccessMsgContainer" class="text-center" hidden="hidden"> --%>
                            <%--     <span class="badge bg-warning text-dark py-15 px-15 fs-5" id="fPwdSuccessMsg"></span> --%>
                            <%-- </div> --%>

                            <div class="col-12 d-grid">
                                <button id="resetPwdBtn" type="submit" class="button py-20 -dark-1 bg-warning text-dark fw-bold">
                                    RESET PASSWORD
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
<script src="${contextPath}/assets/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../../assets/js/vendors.js"></script>
<script src="../../assets/js/main.js"></script>
<script src="../../assets/js/script.js"></script>
</body>
</html>
