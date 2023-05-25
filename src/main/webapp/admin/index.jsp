<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.getRequestDispatcher("booking-manager.jsp").forward(request, response);
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
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../assets/css/vendors.css"/>
    <link rel="stylesheet" href="../assets/css/main.css"/>

    <!-- Icon -->
    <link rel="icon" href="../assets/img/logo/favicon.jpg"/>

    <title>Ceylonese Envoy | Admin Dashboard</title>
</head>
<body>
<%@include file="../includes/preloader.jsp" %>
<%@ include file="admin-header.jsp" %>
<div class="dashboard" data-x="dashboard" data-x-toggle="-is-sidebar-open">

    <%@ include file="admin-sidebar.jsp" %>

    <div class="dashboard__main">
        <div class="dashboard__content">
            <div class="row y-gap-20 justify-between items-end pb-60 lg:pb-40 md:pb-32">
                <div class="col-auto">

                    <h1 class="text-30 lh-14 fw-600">Dashboard</h1>
                    <div class="text-15 text-light-1">Lorem ipsum dolor sit amet, consectetur.</div>

                </div>

                <div class="col-auto">

                </div>
            </div>


            <div class="row y-gap-30">

                <div class="col-xl-3 col-md-6">
                    <div class="py-30 px-30 rounded-4 bg-white shadow-3">
                        <div class="row y-gap-20 justify-between items-center">
                            <div class="col-auto">
                                <div class="fw-500 lh-14">Pending</div>
                                <div class="text-26 lh-16 fw-600 mt-5">$12,800</div>
                                <div class="text-15 lh-14 text-light-1 mt-5">Total pending</div>
                            </div>

                            <div class="col-auto">
                                <img src="${contextPath}/assets/img/dashboard/icons/1.svg" alt="icon">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6">
                    <div class="py-30 px-30 rounded-4 bg-white shadow-3">
                        <div class="row y-gap-20 justify-between items-center">
                            <div class="col-auto">
                                <div class="fw-500 lh-14">Earnings</div>
                                <div class="text-26 lh-16 fw-600 mt-5">$14,200</div>
                                <div class="text-15 lh-14 text-light-1 mt-5">Total earnings</div>
                            </div>

                            <div class="col-auto">
                                <img src="${contextPath}/assets/img/dashboard/icons/2.svg" alt="icon">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6">
                    <div class="py-30 px-30 rounded-4 bg-white shadow-3">
                        <div class="row y-gap-20 justify-between items-center">
                            <div class="col-auto">
                                <div class="fw-500 lh-14">Bookings</div>
                                <div class="text-26 lh-16 fw-600 mt-5">$8,100</div>
                                <div class="text-15 lh-14 text-light-1 mt-5">Total bookings</div>
                            </div>

                            <div class="col-auto">
                                <img src="${contextPath}/assets/img/dashboard/icons/3.svg" alt="icon">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6">
                    <div class="py-30 px-30 rounded-4 bg-white shadow-3">
                        <div class="row y-gap-20 justify-between items-center">
                            <div class="col-auto">
                                <div class="fw-500 lh-14">Services</div>
                                <div class="text-26 lh-16 fw-600 mt-5">22,786</div>
                                <div class="text-15 lh-14 text-light-1 mt-5">Total bookable services</div>
                            </div>

                            <div class="col-auto">
                                <img src="${contextPath}/assets/img/dashboard/icons/4.svg" alt="icon">
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row y-gap-30 pt-20">
                <div class="col-xl-7 col-md-6">
                    <div class="py-30 px-30 rounded-4 bg-white shadow-3">
                        <div class="d-flex justify-between items-center">
                            <h2 class="text-18 lh-1 fw-500">
                                Earning Statistics
                            </h2>


                            <div class="dropdown js-dropdown js-category-active">
                                <div class="dropdown__button d-flex items-center bg-white border-light rounded-100 px-15 py-10 text-14 lh-12"
                                     data-el-toggle=".js-category-toggle" data-el-toggle-active=".js-category-active">
                                    <span class="js-dropdown-title">This Week</span>
                                    <i class="icon icon-chevron-sm-down text-7 ml-10"></i>
                                </div>

                                <div class="toggle-element -dropdown  js-click-dropdown js-category-toggle">
                                    <div class="text-14 y-gap-15 js-dropdown-list">

                                        <div><a href="#" class="d-block js-dropdown-link">Animation</a></div>

                                        <div><a href="#" class="d-block js-dropdown-link">Design</a></div>

                                        <div><a href="#" class="d-block js-dropdown-link">Illustration</a></div>

                                        <div><a href="#" class="d-block js-dropdown-link">Business</a></div>

                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="pt-30">
                            <canvas id="lineChart"></canvas>
                        </div>
                    </div>
                </div>

                <div class="col-xl-5 col-md-6">
                    <div class="py-30 px-30 rounded-4 bg-white shadow-3">
                        <div class="d-flex justify-between items-center">
                            <h2 class="text-18 lh-1 fw-500">
                                Recent Bookings
                            </h2>

                            <div class="">
                                <a href="#" class="text-14 text-blue-1 fw-500 underline">View All</a>
                            </div>
                        </div>

                        <div class="overflow-scroll scroll-bar-1 pt-30">
                            <table class="table-2 col-12">
                                <thead class="">
                                <tr>
                                    <th>#</th>
                                    <th>Item</th>
                                    <th>Total</th>
                                    <th>Paid</th>
                                    <th>Status</th>
                                    <th>Created At</th>
                                </tr>
                                </thead>
                                <tbody>

                                <tr>
                                    <td>#1</td>
                                    <td>New York<br> Discover America</td>
                                    <td class="fw-500">$130</td>
                                    <td>$0</td>
                                    <td>
                                        <div class="rounded-100 py-4 text-center col-12 text-14 fw-500 bg-yellow-4 text-yellow-3">
                                            Pending
                                        </div>
                                    </td>
                                    <td>04/04/2022<br>08:16</td>
                                </tr>

                                <tr>
                                    <td>#2</td>
                                    <td>New York<br> Discover America</td>
                                    <td class="fw-500">$130</td>
                                    <td>$0</td>
                                    <td>
                                        <div class="rounded-100 py-4 text-center col-12 text-14 fw-500 bg-blue-1-05 text-blue-1">
                                            Confirmed
                                        </div>
                                    </td>
                                    <td>04/04/2022<br>08:16</td>
                                </tr>

                                <tr>
                                    <td>#3</td>
                                    <td>New York<br> Discover America</td>
                                    <td class="fw-500">$130</td>
                                    <td>$0</td>
                                    <td>
                                        <div class="rounded-100 py-4 text-center col-12 text-14 fw-500 bg-red-3 text-red-2">
                                            Rejected
                                        </div>
                                    </td>
                                    <td>04/04/2022<br>08:16</td>
                                </tr>

                                <tr>
                                    <td>#4</td>
                                    <td>New York<br> Discover America</td>
                                    <td class="fw-500">$130</td>
                                    <td>$0</td>
                                    <td>
                                        <div class="rounded-100 py-4 text-center col-12 text-14 fw-500 bg-blue-1-05 text-blue-1">
                                            Confirmed
                                        </div>
                                    </td>
                                    <td>04/04/2022<br>08:16</td>
                                </tr>

                                <tr>
                                    <td>#5</td>
                                    <td>New York<br> Discover America</td>
                                    <td class="fw-500">$130</td>
                                    <td>$0</td>
                                    <td>
                                        <div class="rounded-100 py-4 text-center col-12 text-14 fw-500 bg-blue-1-05 text-blue-1">
                                            Confirmed
                                        </div>
                                    </td>
                                    <td>04/04/2022<br>08:16</td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>


            <footer class="footer -dashboard mt-60">
                <div class="footer__row row y-gap-10 items-center justify-between">
                    <div class="col-auto">
                        <div class="row y-gap-20 items-center">
                            <div class="col-auto">
                                <div class="text-14 lh-14 mr-30">© 2022 GoTrip LLC All rights reserved.</div>
                            </div>

                            <div class="col-auto">
                                <div class="row x-gap-20 y-gap-10 items-center text-14">
                                    <div class="col-auto">
                                        <a href="#" class="text-13 lh-1">Privacy</a>
                                    </div>
                                    <div class="col-auto">
                                        <a href="#" class="text-13 lh-1">Terms</a>
                                    </div>
                                    <div class="col-auto">
                                        <a href="#" class="text-13 lh-1">Site Map</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-auto">
                        <div class="d-flex x-gap-5 y-gap-5 items-center">
                            <button class="text-14 fw-500 underline">English (US)</button>
                            <button class="text-14 fw-500 underline">USD</button>
                        </div>
                    </div>
                </div>
            </footer>
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
