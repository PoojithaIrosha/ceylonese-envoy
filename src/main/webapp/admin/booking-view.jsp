<%--
  Created by IntelliJ IDEA.
  User: poojithairosha
  Date: 5/25/23
  Time: 11:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-x="html" data-x-toggle="html-overflow-hidden">

<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Google fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com/">
  <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jost:wght@400;500;600&amp;display=swap" rel="stylesheet">

  <!-- Stylesheets -->
  <link rel="stylesheet" href="../assets/css/vendors.css">
  <link rel="stylesheet" href="../assets/css/main.css">
  <script type="module" src="../assets/js/booking-view.js"></script>

  <title>Booking View | Ceylonese Envoy</title>
</head>

<body>
<div id="loading-container">
  <div id="loading-spinner"></div>
</div>

<main>
  <section class="layout-pt-lg layout-pb-lg bg-blue-2">
    <div class="container">
      <div class="row justify-center">
        <div class="col-xl-10 col-lg-11">
          <div class="bg-white rounded-4 mt-50">
            <div class="layout-pt-lg layout-pb-lg px-50">
              <div class="row justify-between">
                <div class="col-auto">
                  <img src="../assets/img/logo/logo.png" style="height: 80px;" alt="logo icon">
                </div>

                <div class="col-xl-4">
                  <div class="row justify-between items-center">
                    <div class="col-auto">
                      <div class="text-26 fw-600">Request #</div>
                    </div>

                    <div class="col-auto">
                      <div id="reqId" class="text-18 fw-500 text-light-1"></div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="row justify-between pt-50">
                <div class="col-auto">
                  <div class="text-15 text-light-1">Requested date:</div>
                  <div id="requestedAt" class="text-15 fw-500 lh-15"></div>
                </div>
              </div>

              <div class="row justify-between pt-50">
                <div class="col-auto">
                  <div class="text-20 fw-500">Customer</div>
                  <div id="customerName" class="text-15 fw-500 mt-20"></div>
                  <div id="customerAddress" class="text-15 text-light-1 mt-10"></div>
                  <div id="customerMobile" class="text-15 text-light-1"></div>
                </div>
              </div>

              <div class="row pt-50">
                <div class="col-12">
                  <table class="table col-12">
                    <thead class="bg-blue-1-05 text-blue-1">
                    <tr>
                      <th>Package Name</th>
                      <th>Check In</th>
                      <th>Check Out</th>
                      <th>No of Members</th>
                      <th>Total</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">
                    </tbody>
                  </table>
                </div>
              </div>

              <div class="row mt-10">
                <div class="col-12">
                    <h5>More Information</h5>
                  <div id="moreInfo" class="text-light-1 text-15"></div>
                </div>
              </div>
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
<script src="https://code.jquery.com/jquery-3.7.0.slim.js" integrity="sha256-7GO+jepT9gJe9LB4XFf8snVOjX3iYNb0FHYr5LI1N5c=" crossorigin="anonymous"></script>
<script src="../assets/js/vendors.js"></script>
<script src="../assets/js/main.js"></script>
</body>

</html>
