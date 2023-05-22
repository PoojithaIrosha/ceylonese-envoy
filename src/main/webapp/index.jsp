<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="javax.persistence.criteria.CriteriaBuilder" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.model.TourPackage" %>
<%@ page import="javax.persistence.criteria.CriteriaQuery" %>
<%@ page import="javax.persistence.criteria.Root" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.DecimalFormatUtil" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.model.IsActive" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.ImageURIUtil" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.Objects" %>
<%@page contentType="text/html; ISO-8859-1" pageEncoding="UTF-8" %>

<% HibernateUtil.getSessionFactory().openSession(); %>
<!DOCTYPE html>
<html lang="en">

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

    <!-- Title -->
    <title>Ceylonese Envoy</title>
</head>

<body>
<%-- Preloader --%>
<%@include file="includes/preloader.jsp" %>

<main>
    <%-- Header Start --%>
    <%@include file="includes/header.jsp" %>
    <%-- Header End --%>

    <%-- Hero Section Start --%>
    <section data-anim-wrap class="masthead -type-1 z-5">
        <div data-anim-child="fade" class="masthead__bg">
            <img src="#" alt="image" data-src="assets/img/masthead/web11.png" class="js-lazy"/>
        </div>

        <div class="container">
            <div class="row justify-center">
                <div class="col-auto">
                    <div class="text-center">
                        <h1 data-anim-child="slide-up delay-4" class="text-60 lg:text-40 md:text-30 text-white">
                            Find Next Place To Visit
                        </h1>
                        <p data-anim-child="slide-up delay-5" class="text-white mt-6 md:mt-10">
                            Discover amzaing places at exclusive deals
                        </p>
                    </div>

                    <div data-anim-child="slide-up delay-6" class="tabs -underline mt-60 js-tabs">
                        <div class="tabs__controls d-flex x-gap-30 y-gap-20 justify-center sm:justify-start js-tabs-controls">
                            <div class="">
                                <button class="tabs__button text-15 fw-500 text-white pb-4 js-tabs-button"
                                        data-tab-target=".-tab-item-1">
                                    Search Tour Which Matches Your Taste
                                </button>
                            </div>
                        </div>

                        <div class="tabs__content mt-30 md:mt-20 js-tabs-content">
                            <div class="tabs__pane -tab-item-1 is-tab-el-active">
                                <div class="-w-900 bg-white px-10 py-10 lg:px-20 lg:pt-5 lg:pb-20 rounded-custom">
                                    <form action="tour-list.jsp" class="searchMenuCustom justify-content-between">

                                        <div class="col pr-30 pl-10 lg:py-20 lg:px-0">
                                            <div class="ml-10">
                                                <div class="d-flex">
                                                    <i class="icon-location-2 text-15 text-light-1 mt-5"></i>&nbsp;
                                                    <h4 class="text-15 fw-500 ls-2 lh-16">Location</h4>
                                                </div>
                                                <div class="text-15 text-light-1 ls-2 lh-16">
                                                    <%
                                                        if (request.getParameter("search") != null && !request.getParameter("search").equals("")) {
                                                            pageContext.setAttribute("search", request.getParameter("search"));
                                                        }
                                                    %>
                                                    <input name="search" type="search"
                                                           placeholder="Where are you going?"
                                                           value="${search}"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="button-item">
                                            <button type="submit"
                                                    class="mainSearch__submit button -dark-1 h-60 px-35 col-12 rounded-100 bg-blue-1 text-white">
                                                <i class="fa fa-search text-20 mr-10"></i>
                                                Search
                                            </button>
                                        </div>
                                    </form>
                                </div>

                                <%-- <div class="mainSearch -col-3-big bg-white px-10 py-10 lg:px-20 lg:pt-5 lg:pb-20 rounded-4 mt-30"> --%>


                                <%--     <form action="tour-list.jsp" class="searchMenuCustom m-0 p-0"> --%>
                                <%--         <div hidden="hidden"> --%>
                                <%--             <input name="page" type="text" hidden="hidden" --%>
                                <%--                    value="<%= (request.getParameter("page") != null && !request.getParameter("page").equals("") && Integer.parseInt(request.getParameter("page")) > 0) ? request.getParameter("page") : "1"%>"> --%>
                                <%--         </div> --%>
                                <%--         <div class="col pr-30 pl-10 lg:py-20 lg:px-0"> --%>
                                <%--             <div> --%>
                                <%--                 <div class="ml-10"> --%>
                                <%--                     <h4 class="text-15 fw-500 ls-2 lh-16"><i --%>
                                <%--                             class="icon-location-2 text-20 text-light-1 mt-5"></i> Location</h4> --%>
                                <%--                     <div class="text-15 text-light-1 ls-2 lh-16"> --%>
                                <%--                         <% --%>
                                <%--                             if (request.getParameter("search") != null && !request.getParameter("search").equals("")) { --%>
                                <%--                                 pageContext.setAttribute("search", request.getParameter("search")); --%>
                                <%--                             } --%>
                                <%--                         %> --%>
                                <%--                         <input name="search" type="search" placeholder="Where are you going?" --%>
                                <%--                                value="${search}"/> --%>
                                <%--                     </div> --%>
                                <%--                 </div> --%>
                                <%--             </div> --%>
                                <%--         </div> --%>
                                <%--         <div> --%>
                                <%--             <button class="mainSearch__submit button -dark-1 py-15 px-40 col-12 rounded-4 bg-blue-1 text-white"> --%>
                                <%--                 <i class="icon-search text-20 mr-10"></i> --%>
                                <%--                 Search --%>
                                <%--             </button> --%>
                                <%--         </div> --%>
                                <%--     </form> --%>
                                <%-- </div> --%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%-- Hero Section End --%>

    <%-- Popular Destinations Start --%>
    <section class="layout-pt-lg layout-pb-md">
        <div class="container">
            <div data-anim="slide-up delay-1" class="row y-gap-20 justify-between items-end">
                <div class="col-auto">
                    <div class="sectionTitle -md">
                        <h2 class="sectionTitle__title">Popular Destinations</h2>
                        <p class="sectionTitle__text mt-5 sm:mt-0">
                            These popular destinations have a lot to offer
                        </p>
                    </div>
                </div>

                <div class="col-auto md:d-none">
                    <a href="#" class="button -md -blue-1 bg-blue-1-05 text-blue-1">
                        View All Destinations
                        <div class="icon-arrow-top-right ml-15"></div>
                    </a>
                </div>
            </div>

            <div class="relative pt-40 sm:pt-20 js-section-slider" data-gap="30" data-scrollbar
                 data-slider-cols="base-2 xl-4 lg-3 md-2 sm-2 base-1" data-anim="slide-up delay-2">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="#" class="citiesCard -type-1 d-block rounded-4">
                            <div class="citiesCard__image ratio ratio-3:4">
                                <img src="#" data-src="assets/img/destinations/1.webp" alt="image" class="js-lazy"/>
                            </div>

                            <div class="citiesCard__content d-flex flex-column justify-between text-center pt-30 pb-20 px-20">
                                <div class="citiesCard__bg"></div>

                                <div class="citiesCard__top">
                                    <div class="text-14 text-white">
                                        14 Hotel - 22 Cars - 18 Tours - 95 Activity
                                    </div>
                                </div>

                                <div class="citiesCard__bottom">
                                    <h4 class="text-26 md:text-20 lh-13 text-white mb-20">
                                        New York
                                    </h4>
                                    <button class="button col-12 h-60 -blue-1 bg-white text-dark-1">
                                        Discover
                                    </button>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="swiper-slide">
                        <a href="#" class="citiesCard -type-1 d-block rounded-4">
                            <div class="citiesCard__image ratio ratio-3:4">
                                <img src="#" data-src="assets/img/destinations/2.webp" alt="image" class="js-lazy"/>
                            </div>

                            <div class="citiesCard__content d-flex flex-column justify-between text-center pt-30 pb-20 px-20">
                                <div class="citiesCard__bg"></div>

                                <div class="citiesCard__top">
                                    <div class="text-14 text-white">
                                        14 Hotel - 22 Cars - 18 Tours - 95 Activity
                                    </div>
                                </div>

                                <div class="citiesCard__bottom">
                                    <h4 class="text-26 md:text-20 lh-13 text-white mb-20">
                                        London
                                    </h4>
                                    <button class="button col-12 h-60 -blue-1 bg-white text-dark-1">
                                        Discover
                                    </button>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="swiper-slide">
                        <a href="#" class="citiesCard -type-1 d-block rounded-4">
                            <div class="citiesCard__image ratio ratio-3:4">
                                <img src="#" data-src="assets/img/destinations/3.webp" alt="image" class="js-lazy"/>
                            </div>

                            <div class="citiesCard__content d-flex flex-column justify-between text-center pt-30 pb-20 px-20">
                                <div class="citiesCard__bg"></div>

                                <div class="citiesCard__top">
                                    <div class="text-14 text-white">
                                        14 Hotel - 22 Cars - 18 Tours - 95 Activity
                                    </div>
                                </div>

                                <div class="citiesCard__bottom">
                                    <h4 class="text-26 md:text-20 lh-13 text-white mb-20">
                                        Barcelona
                                    </h4>
                                    <button class="button col-12 h-60 -blue-1 bg-white text-dark-1">
                                        Discover
                                    </button>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="swiper-slide">
                        <a href="#" class="citiesCard -type-1 d-block rounded-4">
                            <div class="citiesCard__image ratio ratio-3:4">
                                <img src="#" data-src="assets/img/destinations/4.webp" alt="image" class="js-lazy"/>
                            </div>

                            <div class="citiesCard__content d-flex flex-column justify-between text-center pt-30 pb-20 px-20">
                                <div class="citiesCard__bg"></div>

                                <div class="citiesCard__top">
                                    <div class="text-14 text-white">
                                        14 Hotel - 22 Cars - 18 Tours - 95 Activity
                                    </div>
                                </div>

                                <div class="citiesCard__bottom">
                                    <h4 class="text-26 md:text-20 lh-13 text-white mb-20">
                                        Sydney
                                    </h4>
                                    <button class="button col-12 h-60 -blue-1 bg-white text-dark-1">
                                        Discover
                                    </button>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="swiper-slide">
                        <a href="#" class="citiesCard -type-1 d-block rounded-4">
                            <div class="citiesCard__image ratio ratio-3:4">
                                <img src="#" data-src="assets/img/destinations/5.webp" alt="image" class="js-lazy"/>
                            </div>

                            <div class="citiesCard__content d-flex flex-column justify-between text-center pt-30 pb-20 px-20">
                                <div class="citiesCard__bg"></div>

                                <div class="citiesCard__top">
                                    <div class="text-14 text-white">
                                        14 Hotel - 22 Cars - 18 Tours - 95 Activity
                                    </div>
                                </div>

                                <div class="citiesCard__bottom">
                                    <h4 class="text-26 md:text-20 lh-13 text-white mb-20">
                                        Rome
                                    </h4>
                                    <button class="button col-12 h-60 -blue-1 bg-white text-dark-1">
                                        Discover
                                    </button>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>

                <button
                        class="section-slider-nav -prev flex-center button -blue-1 bg-white shadow-1 size-40 rounded-full sm:d-none js-prev">
                    <i class="icon icon-chevron-left text-12"></i>
                </button>

                <button
                        class="section-slider-nav -next flex-center button -blue-1 bg-white shadow-1 size-40 rounded-full sm:d-none js-next">
                    <i class="icon icon-chevron-right text-12"></i>
                </button>

                <div class="slider-scrollbar bg-light-2 mt-40 sm:d-none js-scrollbar"></div>

                <div class="row pt-20 d-none md:d-block">
                    <div class="col-auto">
                        <div class="d-inline-block">
                            <a href="#" class="button -md -blue-1 bg-blue-1-05 text-blue-1">
                                View All Destinations
                                <div class="icon-arrow-top-right ml-15"></div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%-- Popular Destinations End --%>

    <%-- Two Boxed Start --%>
    <section class="layout-pt-md layout-pb-md">
        <div class="container">
            <div class="row y-gap-20">
                <div data-anim="slide-up" class="col-md-6">
                    <div class="ctaCard -type-1 rounded-4">
                        <div class="ctaCard__image ratio ratio-63:55">
                            <img class="img-ratio js-lazy" src="#" data-src="assets/img/backgrounds/1.png" alt="image"/>
                        </div>

                        <div class="ctaCard__content py-70 px-70 lg:py-30 lg:px-30">
                            <h4 class="text-40 lg:text-26 text-white">
                                Things to do on<br/>
                                your trip
                            </h4>

                            <div class="d-inline-block mt-30">
                                <a href="#"
                                   class="button px-48 py-15 -blue-1 -min-180 bg-white text-dark-1">Experiences</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div data-anim="slide-up delay-1" class="col-md-6">
                    <div class="ctaCard -type-1 rounded-4">
                        <div class="ctaCard__image ratio ratio-63:55">
                            <img class="img-ratio js-lazy" src="#" data-src="assets/img/backgrounds/2.png" alt="image"/>
                        </div>

                        <div class="ctaCard__content py-70 px-70 lg:py-30 lg:px-30">
                            <div class="text-15 fw-500 text-white mb-10">
                                Enjoy Summer Deals
                            </div>

                            <h4 class="text-40 lg:text-26 text-white">
                                Up to 70% Discount!
                            </h4>

                            <div class="d-inline-block mt-30">
                                <a href="#" class="button px-48 py-15 -blue-1 -min-180 bg-white text-dark-1">Learn
                                    More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%-- Two Boxed End --%>

    <%-- Popular Tours Section Start  --%>
    <section class="layout-pt-md layout-pb-md">
        <div data-anim-wrap class="container">
            <div data-anim-child="slide-up" class="row y-gap-20 justify-between items-end">
                <div class="col-auto">
                    <div class="sectionTitle -md">
                        <h2 class="sectionTitle__title">Most Popular Tours</h2>
                    </div>
                </div>

                <div class="col-auto">

                    <a href="tour-list.jsp" class="button -md -blue-1 bg-blue-1-05 text-blue-1">
                        More
                        <div class="icon-arrow-top-right ml-15"></div>
                    </a>

                </div>
            </div>

            <div class="row y-gap-30 pt-40 sm:pt-20">

                <%
                    // Decimal Formatter
                    pageContext.setAttribute("df", DecimalFormatUtil.getInstance());

                    try (Session hs = HibernateUtil.getSessionFactory().openSession()) {
                        CriteriaBuilder criteriaBuilder = hs.getCriteriaBuilder();
                        CriteriaQuery<TourPackage> query = criteriaBuilder.createQuery(TourPackage.class);
                        Root<TourPackage> root = query.from(TourPackage.class);
                        query.select(root);
                        query.where(criteriaBuilder.equal(root.get("isActive"), IsActive.ACTIVE));
                        query.orderBy(criteriaBuilder.desc(root.get("id")));

                        List<TourPackage> tourPackages = hs.createQuery(query)
                                .setMaxResults(4)
                                .getResultList();
                        pageContext.setAttribute("tourPackages", tourPackages);
                    }
                %>

                <c:forEach items="${tourPackages}" var="tourPackage">
                    <div data-anim-child="slide-up delay-1" class="col-xl-3 col-lg-3 col-sm-6">

                        <a href="${contextPath}/tour-details.jsp?package=${tourPackage.id}"
                           class="tourCard -type-1 rounded-4 ">
                            <div class="tourCard__image">

                                <div class="cardImage ratio ratio-1:1">
                                    <div class="cardImage__content">
                                        <c:if test="${tourPackage.tourPackageImages.size() > 0}">
                                            <%
                                                TourPackage tp = (TourPackage) pageContext.getAttribute("tourPackage");
                                            %>
                                            <img class="rounded-4 col-12"
                                                 src="<%= ImageURIUtil.convertFileToDataURI(tp.getTourPackageImages().get(0).getImage()) %>"
                                                 alt="image">
                                        </c:if>
                                        <c:if test="${tourPackage.tourPackageImages.size() == 0}">
                                            <img class="rounded-4 col-12"
                                                 src="${contextPath}/assets/img/tours/default.png"
                                                 alt="image">
                                        </c:if>
                                    </div>
                                </div>

                            </div>

                            <div class="tourCard__content mt-10">

                                <h4 class="tourCard__title text-dark-1 text-18 lh-16 fw-500">
                                    <span>${tourPackage.name}</span>
                                </h4>

                                <p class="text-light-1 lh-14 text-14 mt-5">
                                        ${tourPackage.locations}
                                </p>

                                <div class="row justify-between items-center pt-15">
                                    <div class="col-auto">
                                        <div class="d-flex items-center">

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
                                                    TourPackage tr = (TourPackage) pageContext.getAttribute("tourPackage");
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
                                            <span class="text-16 fw-500 text-dark-1">USD ${df.format(tourPackage.price)}</span>
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
    <%-- Popular Tours Section End  --%>

    <%-- Testimonial Start --%>
    <section class="layout-pt-lg layout-pb-lg bg-blue-2">
        <div data-anim-wrap class="container">
            <div class="row y-gap-40 justify-between">
                <div data-anim-child="slide-up delay-1" class="col-xl-5 col-lg-6">
                    <h2 class="text-30">
                        What our customers are<br/>
                        saying us?
                    </h2>
                    <p class="mt-20">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        Maecenas varius tortor nibh, sit amet tempor nibh finibus et.
                        Aenean eu enim justo.
                    </p>

                    <div class="row y-gap-30 pt-60 lg:pt-40">
                        <div class="col-sm-5 col-6">
                            <div class="text-30 lh-15 fw-600">13m+</div>
                            <div class="text-light-1 lh-15">Happy People</div>
                        </div>

                        <div class="col-sm-5 col-6">
                            <div class="text-30 lh-15 fw-600">4.88</div>
                            <div class="text-light-1 lh-15">Overall rating</div>

                            <div class="d-flex x-gap-5 items-center pt-10">
                                <div class="icon-star text-blue-1 text-10"></div>

                                <div class="icon-star text-blue-1 text-10"></div>

                                <div class="icon-star text-blue-1 text-10"></div>

                                <div class="icon-star text-blue-1 text-10"></div>

                                <div class="icon-star text-blue-1 text-10"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div data-anim-child="slide-up delay-2" class="col-lg-6">
                    <div class="overflow-hidden js-testimonials-slider-3" data-scrollbar>
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="row items-center x-gap-30 y-gap-20">
                                    <div class="col-auto">
                                        <img src="#" data-src="assets/img/avatars/1.png" alt="image"
                                             class="js-lazy"/>
                                    </div>

                                    <div class="col-auto">
                                        <h5 class="text-16 fw-500">Chamath Sasanka</h5>
                                    </div>
                                </div>

                                <p class="text-18 fw-500 text-dark-1 mt-30 sm:mt-20">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque volutpat
                                    gravida augue, in
                                    dignissim nunc varius
                                    et. Nam in elit iaculis, consequat arcu id, pellentesque leo. Mauris magna magna,
                                    vehicula non
                                    bibendum id, sodales eget
                                </p>
                            </div>

                            <div class="swiper-slide">
                                <div class="row items-center x-gap-30 y-gap-20">
                                    <div class="col-auto">
                                        <img src="#" data-src="assets/img/avatars/1.png" alt="image"
                                             class="js-lazy"/>
                                    </div>

                                    <div class="col-auto">
                                        <h5 class="text-16 fw-500">Chamath Sasanka</h5>
                                    </div>
                                </div>

                                <p class="text-18 fw-500 text-dark-1 mt-30 sm:mt-20">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque volutpat
                                    gravida augue, in
                                    dignissim nunc
                                    varius
                                    eget
                                </p>
                            </div>

                            <div class="swiper-slide">
                                <div class="row items-center x-gap-30 y-gap-20">
                                    <div class="col-auto">
                                        <img src="#" data-src="img/avatars/testimonials/2.png" alt="image"
                                             class="js-lazy"/>
                                    </div>

                                    <div class="col-auto">
                                        <h5 class="text-16 fw-500">Chamath Sasanka</h5>
                                    </div>
                                </div>

                                <p class="text-18 fw-500 text-dark-1 mt-30 sm:mt-20">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque volutpat
                                    gravida augue, in
                                    dignissim nunc
                                    varius
                                    et. Nam in elit iaculis, consequat arcu id, pellentesque leo. Mauris magna magna,
                                    vehicula non
                                    bibendum id, sodales
                                    eget
                                    neque. Nulla id pulvinar urna, at accumsan felis. Phasellus interdum dictum elit in
                                    sollicitudin.
                                    Morbi vel luctus
                                </p>
                            </div>

                        </div>

                        <div class="d-flex items-center mt-60 sm:mt-20 js-testimonials-slider-pag">
                            <div class="text-dark-1 fw-500 js-current">01</div>
                            <div class="slider-scrollbar bg-border ml-20 mr-20 w-max-300 js-scrollbar"></div>
                            <div class="text-dark-1 fw-500 js-all">05</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%-- Testimonial End --%>

    <%-- Footer Start--%>
    <%@include file="includes/footer.jsp" %>
    <%-- Footer End--%>
</main>

<!-- JavaScript -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAAz77U5XQuEME6TpftaMdX0bBelQxXRlM"></script>
<script src="https://unpkg.com/@googlemaps/markerclusterer/dist/index.min.js"></script>

<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/vendors.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>