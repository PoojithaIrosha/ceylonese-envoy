<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Google fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com/">
  <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jost:wght@400;500;600&amp;display=swap" rel="stylesheet">

  <!-- Stylesheets -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendors.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">

  <title>Ceylonese Envoy | 404 Internal Server Error</title>
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
              <div class="no-page__title">5<span class="text-blue-1">0</span>5</div>

              <h2 class="text-30 fw-600">Something Went Wrong</h2>

              <div class="pr-30 mt-5">Server couldn't response. Please try again shortly</div>

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
