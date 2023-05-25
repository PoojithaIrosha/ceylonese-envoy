<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="dashboard__sidebar bg-light-2 scroll-bar-1">
    <div class="sidebar -dashboard">
        <%-- <div class="sidebar__item "> --%>
        <%--     <a href="index.jsp" class="sidebar__button d-flex items-center text-15 lh-1 fw-500"> --%>
        <%--         <img src="${contextPath}/assets/img/dashboard/sidebar/compass.svg" alt="image" class="mr-15"> --%>
        <%--         Dashboard --%>
        <%--     </a> --%>
        <%-- </div> --%>

        <div class="sidebar__item ">
            <a href="booking-manager.jsp" class="sidebar__button d-flex items-center text-15 lh-1 fw-500">
                <img src="${contextPath}/assets/img/dashboard/sidebar/booking.svg" alt="image" class="mr-15">
                Booking Manager
            </a>
        </div>

        <div class="sidebar__item ">
            <a href="all-customers.jsp" class="sidebar__button d-flex items-center text-15 lh-1 fw-500">
                <img src="${contextPath}/assets/img/dashboard/sidebar/hotel.svg" alt="image" class="mr-15">
                Manege Users
            </a>
        </div>

        <div class="sidebar__item ">
            <a href="all-admins.jsp" class="sidebar__button d-flex items-center text-15 lh-1 fw-500">
                <img src="${contextPath}/assets/img/dashboard/sidebar/gear.svg" alt="image" class="mr-15">
                Manage Admins
            </a>
        </div>

        <div class="sidebar__item ">
            <div class="accordion -db-sidebar js-accordion">
                <div class="accordion__item">
                    <div class="accordion__button">
                        <div class="sidebar__button col-12 d-flex items-center justify-between">
                            <div class="d-flex items-center text-15 lh-1 fw-500">
                                <img src="${contextPath}/assets/img/dashboard/sidebar/map.svg" alt="image" class="mr-10">
                                Manage Tours
                            </div>
                            <div class="icon-chevron-sm-down text-7"></div>
                        </div>
                    </div>

                    <div class="accordion__content">
                        <ul class="list-disc pt-15 pb-5 pl-40">

                            <li>
                                <a href="tour-packages.jsp" class="text-15">All Tour Packages</a>
                            </li>

                            <li>
                                <a href="add-tour.jsp" class="text-15">Add New Tour</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="sidebar__item ">
            <a href="admin-logout" class="sidebar__button d-flex items-center text-15 lh-1 fw-500">
                <img src="${contextPath}/assets/img/dashboard/sidebar/log-out.svg" alt="image" class="mr-15">
                Logout
            </a>
        </div>

    </div>

</div>
