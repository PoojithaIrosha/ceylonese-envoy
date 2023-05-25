<%@ page import="org.hibernate.Session" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil" %>
<%@ page import="javax.persistence.criteria.CriteriaBuilder" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.model.TourPackage" %>
<%@ page import="javax.persistence.criteria.Root" %>
<%@ page import="javax.persistence.criteria.CriteriaQuery" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.DecimalFormatUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (request.getParameter("package") != null) {
        String packageId = request.getParameter("package");

        try (Session hs = HibernateUtil.getSessionFactory().openSession()) {
            CriteriaBuilder criteriaBuilder = hs.getCriteriaBuilder();
            CriteriaQuery<TourPackage> query = criteriaBuilder.createQuery(TourPackage.class);
            Root<TourPackage> root = query.from(TourPackage.class);
            query.select(root).where(criteriaBuilder.equal(root.get("id"), packageId));

            TourPackage tourPackage = hs.createQuery(query).getSingleResult();

            if (tourPackage == null) {
                request.getRequestDispatcher("errors/404.jsp").forward(request, response);
            }

            pageContext.setAttribute("df", DecimalFormatUtil.getInstance());
            pageContext.setAttribute("tourPackage", tourPackage);
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("errors/404.jsp").forward(request, response);
        }
    } else {
        request.getRequestDispatcher("errors/404.jsp").forward(request, response);
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
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/css/vendors.css"/>
    <link rel="stylesheet" href="assets/css/main.css"/>

    <!-- Icon -->
    <link rel="icon" href="assets/img/logo/favicon.jpg"/>

    <title>Checkout | Ceylonese Envoy</title>
</head>
<body>

<%@include file="includes/preloader.jsp" %>

<main>

    <%@include file="includes/header-light.jsp" %>

    <section class="py-10 d-flex items-center bg-light-2">
        <div class="container">
            <div class="row y-gap-10 items-center justify-between">
                <div class="col-auto">
                    <div class="row x-gap-10 y-gap-5 items-center text-14 text-light-1">
                        MAKE A REQUEST
                    </div>
                </div>

                <div class="col-auto">
                    <button onclick="history.back()" class="link-primary underline">Go Back</button>
                </div>
            </div>
        </div>
    </section>

    <section class="p-5">
        <div class="container">
            <form method="post" id="checkoutForm" class="row x-gap-20 y-gap-20">

                <div class="col-12">
                    <h5>CUSTOMER DETAILS</h5>
                </div>

                <div class="col-12 col-lg-6">
                    <div class="form-input">
                        <input type="text" id="fName" required>
                        <label class="lh-1 text-16 text-light-1">First Name *</label>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="form-input">
                        <input type="text" id="lName" required/>
                        <label class="lh-1 text-16 text-light-1">Last Name *</label>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="form-input">
                        <input type="text" id="mobile" required/>
                        <label class="lh-1 text-16 text-light-1">Mobile *</label>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="form-input">
                        <input type="text" id="email" required/>
                        <label class="lh-1 text-16 text-light-1">Email Address *</label>
                    </div>
                </div>
                <div class="col-12 ">
                    <div class="form-input">
                        <input type="text" id="address" required/>
                        <label class="lh-1 text-16 text-light-1">Address *</label>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="form-input">
                        <input type="text" id="city" required/>
                        <label class="lh-1 text-16 text-light-1">City *</label>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="form-input">
                        <input type="text" id="province" required/>
                        <label class="lh-1 text-16 text-light-1">Province *</label>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="form-input">
                        <input type="text" id="country" required/>
                        <label class="lh-1 text-16 text-light-1">Country *</label>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="form-input">
                        <input type="text" id="postalCode" required/>
                        <label class="lh-1 text-16 text-light-1">Postal Code *</label>
                    </div>
                </div>

                <div class="col-12">
                    <h5>TOUR DETAILS</h5>
                </div>

                <div>
                    <input type="hidden" id="tourId" value="${tourPackage.id}">
                </div>

                <div class="col-12 col-lg-6">
                    <div class="form-input">
                        <input type="text" id="tourName" value="${tourPackage.name}" disabled/>
                        <label class="lh-1 text-16 text-light-1">Tour Name *</label>
                    </div>
                </div>

                <div class="col-12 col-lg-6">
                    <div class="form-input">
                        <input type="text" id="members" value="${pageContext.request.getParameter("members")}" disabled/>
                        <label class="lh-1 text-16 text-light-1">No of Members *</label>
                    </div>
                </div>

                <div class="col-12 col-lg-6">
                    <div class="form-input">
                        <input type="date" id="checkIn"/>
                        <label class="lh-1 text-16 text-light-1">Check In *</label>
                    </div>
                </div>

                <div class="col-12 col-lg-6">
                    <div class="form-input">
                        <input type="date" id="checkOut"/>
                        <label class="lh-1 text-16 text-light-1">Check Out *</label>
                    </div>
                </div>

                <div class="col-12 col-lg-6">
                    <div class="form-input">
                        <input type="text" id="total" value="${tourPackage.price * pageContext.request.getParameter("members")}" disabled/>
                        <label class="lh-1 text-16 text-light-1">Total (USD)</label>
                    </div>
                </div>

                <div class="col-12 col-lg-6">
                    <div class="form-input">
                        <input type="text" id="moreInfo"/>
                        <label class="lh-1 text-16 text-light-1">More Info</label>
                    </div>
                </div>

                <div class="col-12 d-grid">
                    <button id="checkoutSubmitBtn" type="submit" class="button h-50 px-24 -dark-1 bg-blue-1 text-white">SUBMIT THE REQUEST</button>
                </div>
            </form>
        </div>
    </section>
</main>

<!-- JavaScript -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAAz77U5XQuEME6TpftaMdX0bBelQxXRlM"></script>
<script src="https://unpkg.com/@googlemaps/markerclusterer/dist/index.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/vendors.js"></script>
<script src="assets/js/main.js"></script>
<script type="module" src="assets/js/firebase.js"></script>
</body>
</html>
