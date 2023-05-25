<%@ page import="org.hibernate.Session" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil" %>
<%@ page import="javax.persistence.criteria.CriteriaBuilder" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.model.TourPackage" %>
<%@ page import="javax.persistence.criteria.CriteriaQuery" %>
<%@ page import="javax.persistence.criteria.Root" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.DecimalFormatUtil" %>
<%@ page import="javax.persistence.criteria.Predicate" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.model.TourReview" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.model.IsActive" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.model.TourPackageImage" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.ImageURIUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: poojithairosha
  Date: 5/10/23
  Time: 11:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    if (request.getParameter("package") != null) {
        String packageId = request.getParameter("package");

        try (Session hs = HibernateUtil.getSessionFactory().openSession()) {
            CriteriaBuilder criteriaBuilder = hs.getCriteriaBuilder();
            CriteriaQuery<TourPackage> query = criteriaBuilder.createQuery(TourPackage.class);
            Root<TourPackage> root = query.from(TourPackage.class);
            query.select(root).where(criteriaBuilder.and(criteriaBuilder.equal(root.get("id"), packageId), criteriaBuilder.equal(root.get("isActive"), IsActive.ACTIVE)));

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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="hzttps://fonts.googleapis.com/css2?family=Jost:wght@400;500;600&amp;display=swap" rel="stylesheet">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/css/vendors.css"/>
    <link rel="stylesheet" href="assets/css/main.css"/>

    <link rel="icon" href="assets/img/logo/favicon.jpg">

    <title>Ceylonese Envoy | Tour - Six Nights</title>
</head>
<body>
<%@ include file="includes/preloader.jsp" %>

<main>
    <%@ include file="includes/header-light.jsp" %>

    <section class="py-10 d-flex items-center bg-light-2">
        <div class="container">
            <div class="row y-gap-10 items-center justify-between">
                <div class="col-auto">
                    <div class="row x-gap-10 y-gap-5 items-center text-14 text-light-1">
                        <div class="col-auto">
                            <div class="">Home</div>
                        </div>
                        <div class="col-auto">
                            <div class="">></div>
                        </div>
                        <div class="col-auto">
                            <div class="">Tour Packages</div>
                        </div>
                        <div class="col-auto">
                            <div class="">></div>
                        </div>
                        <div class="col-auto">
                            <%-- Package Name --%>
                            <div class="text-dark-1">${tourPackage.name}</div>
                        </div>
                    </div>
                </div>

                <div class="col-auto">
                    <a href="${contextPath}/tour-list.jsp" class="text-14 text-blue-1 underline">All Tour Packages</a>
                </div>
            </div>
        </div>
    </section>

    <section class="pt-40">
        <div class="container">
            <div class="row y-gap-15 justify-between items-end">
                <div class="col-auto">
                    <%-- Package Title --%>
                    <h1 class="tour-title text-30 fw-600 text-uppercase">${tourPackage.name}</h1>

                    <%-- Reviews --%>
                    <div class="row x-gap-20 y-gap-20 items-center pt-10">
                        <div class="col-auto">
                            <div class="d-flex items-center">
                                <div class="d-flex x-gap-5 items-center">

                                    <i class="icon-star text-10 text-yellow-1"></i>

                                    <i class="icon-star text-10 text-yellow-1"></i>

                                    <i class="icon-star text-10 text-yellow-1"></i>

                                    <i class="icon-star text-10 text-yellow-1"></i>

                                    <i class="icon-star text-10 text-yellow-1"></i>

                                </div>

                                <div class="text-14 text-light-1 ml-10">3,014 reviews</div>
                            </div>
                        </div>

                        <div class="col-auto">
                            <div class="row x-gap-10 items-center">
                                <div class="col-auto">
                                    <div class="d-flex x-gap-5 items-center">
                                        <i class="icon-placeholder text-16 text-light-1"></i>
                                        <div class="text-15 text-light-1"
                                             style="text-transform: capitalize">${tourPackage.locations}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-auto">
                    <div class="row x-gap-10 y-gap-10">
                        <div class="col-auto">
                            <button class="button px-15 py-10 -blue-1">
                                <i class="icon-share mr-10"></i>
                                Share
                            </button>
                        </div>

                        <div class="col-auto">
                            <button class="button px-15 py-10 -blue-1 bg-light-2">
                                <i class="icon-heart mr-10"></i>
                                Save
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="pt-40 js-pin-container">
        <div class="container">
            <div class="row y-gap-30">
                <div class="col-lg-8">
                    <div class="relative d-flex justify-center overflow-hidden js-section-slider"
                         data-slider-cols="base-1" data-nav-prev="js-img-prev" data-nav-next="js-img-next">

                        <%-- Tour Package Images --%>
                        <div class="swiper-wrapper">
                            <c:forEach items="${tourPackage.tourPackageImages}" var="image">
                                <div class="swiper-slide">
                                    <%
                                        TourPackageImage tpi = (TourPackageImage) pageContext.getAttribute("image");
                                    %>
                                    <img src="<%= ImageURIUtil.convertFileToDataURI(tpi.getImage()) %>" alt="image"
                                         class="rounded-4 col-12 h-full object-cover">
                                </div>
                            </c:forEach>
                        </div>
                        <%-- Tour Package Images --%>

                        <div class="absolute h-full col-11">
                            <button class="section-slider-nav -prev flex-center button -blue-1 bg-white shadow-1 size-40 rounded-full sm:d-none js-img-prev">
                                <i class="icon icon-chevron-left text-12"></i>
                            </button>

                            <button class="section-slider-nav -next flex-center button -blue-1 bg-white shadow-1 size-40 rounded-full sm:d-none js-img-next">
                                <i class="icon icon-chevron-right text-12"></i>
                            </button>
                        </div>
                    </div>

                    <%-- <h3 class="text-22 fw-500 mt-30"> --%>
                    <%--     Tour snapshot --%>
                    <%-- </h3> --%>

                    <%-- <div class="row y-gap-30 justify-between pt-20"> --%>

                    <%--     <div class="col-md-auto col-6"> --%>
                    <%--         <div class="d-flex"> --%>
                    <%--             <i class="icon-clock text-22 text-blue-1 mr-10"></i> --%>
                    <%--             <div class="text-15 lh-15"> --%>
                    <%--                 Duration:<br> 11 days --%>
                    <%--             </div> --%>
                    <%--         </div> --%>
                    <%--     </div> --%>

                    <%--     <div class="col-md-auto col-6"> --%>
                    <%--         <div class="d-flex"> --%>
                    <%--             <i class="icon-customer text-22 text-blue-1 mr-10"></i> --%>
                    <%--             <div class="text-15 lh-15"> --%>
                    <%--                 Group size:<br> ANY --%>
                    <%--             </div> --%>
                    <%--         </div> --%>
                    <%--     </div> --%>

                    <%--     <div class="col-md-auto col-6"> --%>
                    <%--         <div class="d-flex"> --%>
                    <%--             <i class="icon-route text-22 text-blue-1 mr-10"></i> --%>
                    <%--             <div class="text-15 lh-15"> --%>
                    <%--                 Near public<br> transportation --%>
                    <%--             </div> --%>
                    <%--         </div> --%>
                    <%--     </div> --%>

                    <%--     <div class="col-md-auto col-6"> --%>
                    <%--         <div class="d-flex"> --%>
                    <%--             <i class="icon-access-denied text-22 text-blue-1 mr-10"></i> --%>
                    <%--             <div class="text-15 lh-15"> --%>
                    <%--                 Free cancellation <br><a href='#' class='text-blue-1 underline'>Learn more</a> --%>
                    <%--             </div> --%>
                    <%--         </div> --%>
                    <%--     </div> --%>

                    <%-- </div> --%>

                    <%-- <div class="border-top-light mt-40 mb-40"></div> --%>

                    <div class="row x-gap-40 y-gap-40 mt-5">
                        <div class="col-12">
                            <h3 class="text-22 fw-900 mb-3">Overview</h3>

                            ${tourPackage.overview}
                        </div>

                        <div class="mt-40 border-top-light"></div>

                        <%-- TODO: Available Languages --%>
                        <div class="col-md-6">
                            <h5 class="text-16 fw-500">Available languages</h5>
                            <div class="text-15 mt-10">German, Chinese, Portuguese, Japanese, English, Italian, Chinese,
                                French, Spanish
                            </div>
                        </div>

                        <c:if test="${tourPackage.cancellationPolicy != null}">
                            <div class="col-md-6">
                                <h5 class="text-16 fw-500">Cancellation policy</h5>
                                <div class="text-15 mt-10">${tourPackage.cancellationPolicy}</div>
                            </div>
                        </c:if>


                        <c:if test="${tourPackage.highlights != null}">
                            <div class="col-12">
                                <h5 class="text-16 fw-500">Highlights</h5>
                                    ${tourPackage.highlights}
                            </div>
                        </c:if>
                    </div>
                </div>

                <%-- Purchase --%>
                <div class="col-lg-4">
                    <div class="d-flex justify-end js-pin-content">
                        <div class="w-360 lg:w-full d-flex flex-column items-center">
                            <div class="px-30 py-30 rounded-4 border-light bg-white shadow-4">
                                <div class="text-14 text-light-1">
                                    From <span
                                        class="text-20 fw-500 text-dark-1 ml-5">USD ${df.format(tourPackage.price)}</span>
                                    <smal>/per one person</smal>
                                </div>

                                <div class="row y-gap-20 pt-30">
                                    <%-- <div class="col-12"> --%>

                                    <%--     <div class="searchMenu-date px-20 py-10 border-light rounded-4 -right js-form-dd js-calendar"> --%>

                                    <%--         <div> --%>
                                    <%--             <h4 class="text-15 fw-500 ls-2 lh-16 mb-2">Date (From - To)</h4> --%>

                                    <%--             <div class="text-15 text-light-1 ls-2 lh-16"> --%>
                                    <%--                 <label>From</label> --%>
                                    <%--                 <input type="date" class="form-control border mb-2"/> --%>

                                    <%--                 <label>To</label> --%>
                                    <%--                 <input type="date" class="form-control border"/> --%>
                                    <%--             </div> --%>
                                    <%--         </div> --%>
                                    <%--     </div> --%>

                                    <%-- </div> --%>

                                    <form action="checkout.jsp">
                                        <input type="hidden" name="package" value="${tourPackage.id}">
                                        <div class="col-12 mb-10">
                                            <div class="searchMenu-guests px-20 py-10 border-light rounded-4 js-form-dd js-form-counters">

                                                <div>
                                                    <h4 class="text-15 fw-500 ls-2 lh-16 mb-2">Number of members</h4>

                                                    <div class="text-15 text-light-1 ls-2 lh-16">
                                                        <input type="number" class="form-control border"
                                                               placeholder="Ex: 5" name="members" required/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <button type="submit"
                                               class="button -dark-1 py-15 px-35 h-60 col-12 rounded-4 bg-blue-1 text-white">
                                                Make a Request
                                            </button>
                                        </div>
                                    </form>
                                </div>

                                <div class="d-flex items-center pt-20">
                                    <div class="size-40 flex-center bg-light-2 rounded-full">
                                        <i class="icon-heart text-16 text-green-2"></i>
                                    </div>
                                    <div class="text-14 lh-16 ml-10">94% of travelers recommend this experience</div>
                                </div>
                            </div>

                            <div class="px-30">
                                <div class="text-14 text-light-1 mt-30">Not sure? You can cancel this reservation up to
                                    24 hours in advance for a full refund.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <c:if test="${tourPackage.inclusions != null || tourPackage.exclusions != null || tourPackage.departureDetails != null || tourPackage.additionalInformation != null}">
        <section class="pt-40">
            <div class="container">
                <div class="pt-40 border-top-light">
                    <div class="row x-gap-40 y-gap-40">
                        <div class="col-auto">
                            <h3 class="text-22 fw-500">Important information</h3>
                        </div>
                    </div>


                    <div class="row x-gap-40 y-gap-40 justify-between pt-20">
                        <c:if test="${tourPackage.inclusions != null}">
                            <div class="col-lg-4 col-md-6">
                                <div class="fw-500 mb-10">Inclusions</div>

                                <ul class="list-disc">
                                        ${tourPackage.inclusions}
                                        <%-- <li>Superior Coach, Wi-Fi and USB Charging On-board</li> --%>
                                        <%-- <li>Expert guide</li> --%>
                                        <%-- <li>Admission to Windsor Castle (if option selected)</li> --%>
                                        <%-- <li>Admission to Stonehenge</li> --%>
                                </ul>
                            </div>
                        </c:if>

                        <c:if test="${tourPackage.departureDetails != null}">
                            <div class="col-lg-4 col-md-6">
                                <div class="fw-500 mb-10">Departure details</div>
                                <div class="text-15">
                                        ${tourPackage.departureDetails}
                                        <%-- Departures from 01st April 2022: Tour departs at 8 am (boarding at 7.30 am), --%>
                                        <%-- Victoria --%>
                                        <%-- Coach --%>
                                        <%-- Station Gate 1-5 --%>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${tourPackage.exclusions != null}">
                            <div class="col-lg-4 col-md-6">
                                <div class="fw-500 mb-10">Exclusions</div>
                                <ul class="list-disc">
                                        <%-- <li>Hotel pick-up and drop-off</li> --%>
                                        <%-- <li>Gratuities</li> --%>
                                        <%-- <li>Lunch</li> --%>
                                        ${tourPackage.exclusions}
                                </ul>
                            </div>
                        </c:if>

                        <c:if test="${tourPackage.additionalInformation != null}">
                            <div class="col-12">
                                <div class="fw-500 mb-10">Additional information</div>
                                    <%-- <ul class="list-disc"> --%>
                                    <%--     <li>Confirmation will be received at time of booking</li> --%>
                                    <%--     <li>Departs at 8am (boarding at 7.30am), Victoria Coach Station Gate 1-5, 164 --%>
                                    <%--         Buckingham --%>
                                    <%--         Palace Road, London, SW1W 9TP --%>
                                    <%--     </li> --%>
                                    <%--     <li>As Windsor Castle is a working royal palace, sometimes the entire Castle or the --%>
                                    <%--         State --%>
                                    <%--         Apartments within the Castle need to be closed at short notice. (if selected --%>
                                    <%--         this --%>
                                    <%--         option) --%>
                                    <%--     </li> --%>
                                    <%--     <li>Stonehenge is closed on 21 June due to the Summer Solstice. During this time, we --%>
                                    <%--         will --%>
                                    <%--         instead visit the Avebury Stone Circle. --%>
                                    <%--     </li> --%>
                                    <%--     <li>Please note: the tour itinerary and order may change</li> --%>
                                    <%-- </ul> --%>

                                    ${tourPackage.additionalInformation}
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </section>
    </c:if>

    <div class="container mt-40 mb-40">
        <div class="border-top-light"></div>
    </div>

    <section>
        <div class="container">
            <div class="row y-gap-40 justify-between">
                <div class="col-xl-3">
                    <h3 class="text-22 fw-500">Guest reviews</h3>

                    <%
                        try (Session hs = HibernateUtil.getSessionFactory().openSession()) {
                            TourPackage tr = (TourPackage) pageContext.getAttribute("tourPackage");
                            Query query = hs.createQuery("select rating, COUNT(*) as frequency from TourReview tr where tr.tourPackage.id = :id group by rating order by frequency desc").setMaxResults(1).setParameter("id", tr.getId());
                            Object[] result = (Object[]) query.uniqueResult();

                            if (result != null)
                                pageContext.setAttribute("bestRating", result);
                            else
                                pageContext.setAttribute("bestRating", new Object[]{0, 0});
                        }
                    %>
                    <div class="d-flex items-center mt-20">
                        <div class="flex-center bg-blue-1 rounded-4 size-70 text-22 fw-600 text-white">${bestRating[0]}</div>
                        <div class="ml-20">
                            <div class="text-16 text-dark-1 fw-500 lh-14">Exceptional</div>
                            <%
                                try (Session hs = HibernateUtil.getSessionFactory().openSession()) {
                                    TourPackage tr = (TourPackage) pageContext.getAttribute("tourPackage");
                                    Query<Long> query = hs.createQuery("select COUNT(*) as frequency from TourReview tr where tr.tourPackage.id = :id", Long.class).setParameter("id", tr.getId());
                                    Long result = query.uniqueResult();

                                    if (result != null) {
                                        pageContext.setAttribute("reviewCount", result);
                                    } else {
                                        pageContext.setAttribute("reviewCount", 0);
                                    }
                                }
                            %>
                            <div class="text-15 text-light-1 lh-14 mt-4">
                                ${reviewCount} reviews
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-8">
                    <div class="row y-gap-40">

                        <%
                            try (Session hs = HibernateUtil.getSessionFactory().openSession()) {

                                TourPackage tp = (TourPackage) pageContext.getAttribute("tourPackage");
                                Query<TourReview> query = hs.createQuery("from TourReview tr where tr.tourPackage.id = :id", TourReview.class).setParameter("id", tp.getId());
                                List<TourReview> tourReviewList = query.list();

                                pageContext.setAttribute("tourReviews", tourReviewList);
                            }
                        %>

                        <c:if test="${tourReviews.size() <= 0}">
                            <div class="col-12 d-flex align-items-center">
                                <i class="text-30 fa-solid fa-circle-exclamation"></i>
                                <div class="text-20 text-dark-1 ms-3">No reviews yet</div>
                            </div>
                        </c:if>

                        <c:forEach items="${tourReviews}" var="review">
                            <%-- Review --%>
                            <div class="col-12 border-bottom">
                                <div class="row x-gap-20 y-gap-20 items-center">
                                    <div class="col-auto">
                                        <img src="${contextPath}/assets/img/users/user.png" alt="image"
                                             class="review-profile-img">
                                    </div>
                                    <div class="col-auto">
                                        <div class="fw-500 lh-15">${review.name}</div>
                                        <div class="text-14 text-light-1 lh-15">${review.date}</div>
                                    </div>
                                </div>

                                <div class="d-flex x-gap-5 items-center justify-end md:justify-start">

                                    <c:forEach begin="1" end="${review.rating}">
                                        <i class="icon-star text-10 text-yellow-1"></i>
                                    </c:forEach>

                                </div>

                                <p class="text-15 text-dark-1">${review.comment}</p>

                                <div class="d-flex x-gap-30 items-center pt-20">
                                    <button class="d-flex items-center text-blue-1">
                                        <i class="icon-like text-16 mr-10"></i>
                                        Helpful
                                    </button>

                                    <button class="d-flex items-center text-light-1">
                                        <i class="icon-dislike text-16 mr-10"></i>
                                        Not helpful
                                    </button>
                                </div>
                            </div>
                            <%-- Review --%>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <div class="container mt-40 mb-40">
        <div class="border-top-light"></div>
    </div>

    <section>
        <div class="container">
            <div class="row y-gap-30 justify-between">
                <div class="col-xl-3">
                    <div class="row">
                        <div class="col-auto">
                            <h3 class="text-22 fw-500">Leave a Reply</h3>
                            <p class="text-15 text-dark-1 mt-5">Your email address will not be published.</p>
                        </div>

                        <div class="container mt-40 mb-40">
                            <div class="border-top-light"></div>
                        </div>

                        <div class="col-auto">
                            <h3 class="text-22 fw-500">Select your rating here</h3>

                            <ul class="d-flex gap-3 mt-3">
                                <li><i class="fa-regular fs-4 fa-star text-warning" id="ratingStar1"
                                       onmouseover="changeRatingStarOnHover(1)"></i></li>
                                <li><i class="fa-regular fs-4 fa-star text-warning" id="ratingStar2"
                                       onmouseover="changeRatingStarOnHover(2)"></i></li>
                                <li><i class="fa-regular fs-4 fa-star text-warning" id="ratingStar3"
                                       onmouseover="changeRatingStarOnHover(3)"></i></li>
                                <li><i class="fa-regular fs-4 fa-star text-warning" id="ratingStar4"
                                       onmouseover="changeRatingStarOnHover(4)"></i></li>
                                <li><i class="fa-regular fs-4 fa-star text-warning" id="ratingStar5"
                                       onmouseover="changeRatingStarOnHover(5)"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-xl-8">
                    <form id="addReviewForm" method="post" class="row">
                        <h3 class="mb-2">Add Your Review</h3>
                        <div>
                            <input name="packageId" id="packageId" type="text" value="${tourPackage.id}" required
                                   hidden="hidden">
                        </div>
                        <div class="col-xl-6 mb-3">
                            <div class="form-input ">
                                <input name="name" id="name" type="text" required>
                                <label class="lh-1 text-16 text-light-1">Name</label>
                            </div>

                        </div>
                        <div class="col-xl-6">

                            <div class="form-input ">
                                <input name="email" id="email" type="text" required>
                                <label class="lh-1 text-16 text-light-1">Email</label>
                            </div>

                        </div>
                        <div class="col-12 mb-3">

                            <div class="form-input ">
                                <textarea name="comment" id="comment" required rows="6"></textarea>
                                <label class="lh-1 text-16 text-light-1">Write Your Comment</label>
                            </div>

                        </div>
                        <div class="col-auto">
                            <button type="submit" class="button -md -dark-1 bg-blue-1 text-white">
                                Post Comment
                                <div class="icon-arrow-top-right ml-15"></div>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <div class="container">
        <div class="mt-50 border-top-light"></div>
    </div>

    <%
        try (Session hs = HibernateUtil.getSessionFactory().openSession()) {
            List<Predicate> predicates = new ArrayList<>();
            CriteriaBuilder criteriaBuilder = hs.getCriteriaBuilder();
            CriteriaQuery<TourPackage> criteriaQuery = criteriaBuilder.createQuery(TourPackage.class);
            Root<TourPackage> root = criteriaQuery.from(TourPackage.class);
            criteriaQuery.select(root);

            TourPackage tp = (TourPackage) pageContext.getAttribute("tourPackage");
            String[] split = tp.getLocations().split(",");
            for (String s : split) {
                predicates.add(criteriaBuilder.like(root.get("locations"), "%" + s + "%"));
            }

            criteriaQuery.where(criteriaBuilder.and(criteriaBuilder.notEqual(root.get("id"), tp.getId()), criteriaBuilder.equal(root.get("isActive"), IsActive.ACTIVE), criteriaBuilder.or(predicates.toArray(new Predicate[0]))));

            List<TourPackage> tourPackageList = hs.createQuery(criteriaQuery)
                    .setMaxResults(4)
                    .getResultList();

            pageContext.setAttribute("similarTourPackages", tourPackageList);
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    <c:if test="${not empty similarTourPackages}">
        <section class="layout-pt-md layout-pb-md mb-40">
            <div data-anim-wrap class="container">
                <div class="row y-gap-20 justify-between items-end">
                    <div class="col-auto">
                        <div class="sectionTitle -md">
                            <h2 class="sectionTitle__title">Similar Tour Packages</h2>
                        </div>
                    </div>

                    <div class="col-auto">

                        <a href="${contextPath}/tour-list.jsp" class="button -md -blue-1 bg-blue-1-05 text-blue-1">
                            More
                            <div class="icon-arrow-top-right ml-15"></div>
                        </a>

                    </div>
                </div>

                <div class="row y-gap-30 pt-40 sm:pt-20">
                    <c:forEach items="${similarTourPackages}" var="similarTourPackage">
                        <div class="col-xl-3 col-lg-3 col-sm-6">

                            <a href="${contextPath}/tour-details.jsp?package=${similarTourPackage.id}"
                               class="tourCard -type-1 rounded-4 ">
                                <div class="tourCard__image">

                                    <div class="cardImage ratio ratio-1:1">
                                        <div class="cardImage__content">
                                            <% TourPackage tp = (TourPackage) pageContext.getAttribute("similarTourPackage"); %>
                                            <img class="rounded-4 col-12"
                                                 src="<%= ImageURIUtil.convertFileToDataURI(tp.getTourPackageImages().get(0).getImage()) %>"
                                                 alt="image">
                                        </div>
                                    </div>

                                </div>

                                <div class="tourCard__content mt-10">

                                    <h4 class="tourCard__title text-dark-1 text-18 lh-16 fw-500">
                                        <span>${similarTourPackage.name}</span>
                                    </h4>

                                    <p class="text-light-1 lh-14 text-14 mt-5">
                                            ${similarTourPackage.locations}
                                    </p>

                                    <div class="row justify-between items-center pt-15">
                                        <div class="col-auto">
                                            <div class="d-flex items-center">

                                                <%
                                                    try (Session hs = HibernateUtil.getSessionFactory().openSession()) {
                                                        TourPackage tr = (TourPackage) pageContext.getAttribute("similarTourPackage");
                                                        Query query = hs.createQuery("select rating, COUNT(*) as frequency from TourReview tr where tr.tourPackage.id = :id group by rating order by frequency desc").setMaxResults(1).setParameter("id", tr.getId());
                                                        Object[] result = (Object[]) query.uniqueResult();

                                                        if (result != null)
                                                            pageContext.setAttribute("bestRating", result);
                                                        else
                                                            pageContext.setAttribute("bestRating", new Object[]{0, 0});
                                                    }
                                                %>

                                                <div class="d-flex items-center x-gap-5">

                                                    <%
                                                        for (int i = 0; i < 5; i++) {
                                                            Object[] bestRating = (Object[]) pageContext.getAttribute("bestRating");
                                                            if (i < (int) bestRating[0]) {
                                                    %>
                                                    <div class="icon-star text-yellow-1 text-10"></div>
                                                    <%
                                                    } else {
                                                    %>
                                                    <div class="icon-star text-light-1 text-10"></div>
                                                    <%
                                                            }
                                                        }
                                                    %>

                                                </div>


                                                <%
                                                    try (Session session1 = HibernateUtil.getSessionFactory().openSession()) {
                                                        TourPackage tr = (TourPackage) pageContext.getAttribute("similarTourPackage");
                                                        Query<Long> query = session1.createQuery("select COUNT(*) as frequency from TourReview tr where tr.tourPackage.id = :id", Long.class).setParameter("id", tr.getId());
                                                        Long result = query.uniqueResult();

                                                        if (result != null) {
                                                            pageContext.setAttribute("reviewCount", result);
                                                        } else {
                                                            pageContext.setAttribute("reviewCount", 0);
                                                        }
                                                    }
                                                %>
                                                <div class="text-14 text-light-1 ml-10">${reviewCount} reviews</div>
                                            </div>
                                        </div>

                                        <div class="col-auto">
                                            <div class="text-14 text-light-1">
                                                <span class="text-16 fw-500 text-dark-1">USD ${similarTourPackage.price}</span>
                                                <smal>/per one person</smal>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>

                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    </c:if>

    <%@ include file="includes/footer.jsp" %>

</main>

<!-- JavaScript -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAAz77U5XQuEME6TpftaMdX0bBelQxXRlM"></script>
<script src="https://unpkg.com/@googlemaps/markerclusterer/dist/index.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/vendors.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/script.js"></script>
</body>
</html>
