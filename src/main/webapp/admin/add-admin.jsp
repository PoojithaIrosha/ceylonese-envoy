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

  <!-- Icon -->
  <link rel="icon" href="../assets/img/logo/favicon.jpg"/>

  <title>Add Admin | Ceylonese Envoy</title>
</head>
<body>
<%@include file="../includes/preloader.jsp" %>

<%@include file="admin-header.jsp" %>

<div class="dashboard" data-x="dashboard" data-x-toggle="-is-sidebar-open">
  <%@include file="admin-sidebar.jsp" %>

  <div class="dashboard__main">
    <div class="dashboard__content py-10 px-40">
      <div class="row y-gap-20 justify-between items-end">
        <div class="col-auto">
          <h1 class="text-30 lh-14 fw-600">Add Admin</h1>
        </div>
      </div>


      <div class="py-30 px-30 rounded-4 bg-white shadow-3">
        <div class="tabs -underline-2 js-tabs">

          <div class="tabs__content js-tabs-content">
            <div class="tabs__pane -tab-item-1 is-tab-el-active">
              <div class="col-xl-10">

                <form method="post" id="addAdminForm" class="row x-gap-20 y-gap-20">

                  <div class="col-12">
                    <div class="form-input">
                      <input type="email" name="email" required>
                      <label class="lh-1 text-16 text-light-1">Email Address *</label>
                    </div>
                  </div>

                  <div class="col-12">
                    <div class="form-input">
                      <input type="password" name="pass" required>
                      <label class="lh-1 text-16 text-light-1">Password</label>
                    </div>
                  </div>

                  <div class="col-12">
                    <div class="form-input">
                      <input type="password" name="re-pass" required>
                      <label class="lh-1 text-16 text-light-1">Re Enter Password</label>
                    </div>
                  </div>

                  <%
                    if(request.getParameter("error") != null) {
                  %>
                  <div class="alert alert-danger mt-10">
                    <p class="text-danger"><%=request.getParameter("error")%></p>
                  </div>
                  <%
                    }
                  %>

                  <div class="d-inline-block pt-30">
                    <button type="submit" class="button h-50 px-24 -dark-1 bg-blue-1 text-white">
                      Add New Admin
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>

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
<script src="../assets/js/admin.js"></script>
</body>
</html>
