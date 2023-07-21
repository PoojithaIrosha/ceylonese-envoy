<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Discover the wonders of Sri Lanka with Ceylonese Envoy. We offer tailored travel experiences, guided tours, and unforgettable adventures. Book your journey today!">
    <meta name="keywords" content="Ceylonese Envoy, travel agency, Sri Lanka travel, guided tours, tailor-made trips, adventure travel, vacation packages, travel experiences">
    <meta name="author" content="Ceylonese Envoy"/>

    <!-- Google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@400;500;600&amp;display=swap" rel="stylesheet">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendors.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">

    <title>401 Unauthorized | Ceylonese Envoy | Escape the ordinary. It is the place to be</title>
</head>
<body>
<%@ include file="../includes/preloader.jsp" %>
<main>
    <section class="layout-pt-lg layout-pb-lg">
        <div class="container">
            <div class="row y-gap-30 justify-between items-center">
                <div class="col-lg-6">
                    <img src="${contextPath}/assets/img/masthead/404.svg" alt="image">
                </div>

                <div class="col-lg-5">
                    <div class="no-page">
                        <div class="no-page__title">40<span class="text-blue-1">1</span></div>

                        <h2 class="text-30 fw-600">Oops! It looks like you're not authorized for this content.</h2>

                        <div class="pr-30 mt-5">The page you're looking for isn't for you..</div>

                        <div class="d-inline-block mt-40 md:mt-20">
                            <a href="${contextPath}/" class="button -md -dark-1 bg-blue-1 text-white">Go back to homepage</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<!-- JavaScript -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAAz77U5XQuEME6TpftaMdX0bBelQxXRlM"></script>
<script src="https://unpkg.com/@googlemaps/markerclusterer/dist/index.min.js"></script>

<script src="${contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${contextPath}/assets/js/vendors.js"></script>
<script src="${contextPath}/assets/js/main.js"></script>
</body>
</html>
