<%--
  Created by IntelliJ IDEA.
  User: poojithairosha
  Date: 5/24/23
  Time: 6:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
     <link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../assets/css/vendors.css"/>
    <link rel="stylesheet" href="../assets/css/main.css"/>

    <%-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"> --%>
    <%-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script> --%>

    <!-- Icon -->
    <link rel="icon" href="../assets/img/logo/favicon.jpg"/>
    <title>Booking Manager | Ceylonese Envoy</title>
</head>
<body>
<div id="loading-container">
    <div id="loading-spinner"></div>
</div>

<%@ include file="../includes/preloader.jsp" %>
<%@ include file="admin-header.jsp" %>

<div class="dashboard" data-x="dashboard" data-x-toggle="-is-sidebar-open">
    <%@ include file="admin-sidebar.jsp" %>

    <div class="dashboard__main">
        <div class="dashboard__content py-10 px-40">

            <div class="row y-gap-20 justify-between items-end">
                <div class="col-auto">
                    <h1 class="text-30 lh-14 fw-600">Bookings Manager</h1>
                </div>
            </div>

            <div class="py-10 px-30 rounded-4 bg-white shadow-3">

                <div class="container">
                    <div class="row">
                        <div class="col-12 overflow-x-scroll">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Req Id</th>
                                    <th>Tour Package</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Mobile</th>
                                    <th>Total</th>
                                    <th>Requested At</th>
                                    <th>Action</th>
                                </tr>
                                </thead>

                                <tbody id="dataList">

                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>

                <div class="mt-30 pt-30">
                    <div class="row x-gap-10 y-gap-20 justify-between md:justify-center">
                        <div class="col-auto md:order-1">
                            <button id="previousButton" class="button -blue-1 size-40 rounded-full border-light">
                                <i class="icon-chevron-left text-12"></i>
                            </button>
                        </div>

                        <div class="col-auto md:order-2">
                            <button id="nextButton"
                                    class="button -blue-1 size-40 rounded-full border-light">
                                <i class="icon-chevron-right text-12"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript -->
<!-- JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"
        integrity="sha512-QSkVNOCYLtj73J4hbmVoOV6KVZuMluZlioC+trLpewV8qMjsWqlIQvkn1KGX2StWvPMdWGBqim1xlC8krl1EKQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAAz77U5XQuEME6TpftaMdX0bBelQxXRlM"></script>
<script src="https://unpkg.com/@googlemaps/markerclusterer/dist/index.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="../assets/js/vendors.js"></script>
<script src="../assets/js/main.js"></script>
<script type="module" src="../assets/js/bookings.js"></script>
</body>
</html>

