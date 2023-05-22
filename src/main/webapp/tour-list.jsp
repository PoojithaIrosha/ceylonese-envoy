<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.model.TourPackage" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.persistence.criteria.CriteriaBuilder" %>
<%@ page import="javax.persistence.criteria.CriteriaQuery" %>
<%@ page import="javax.persistence.criteria.Root" %>
<%@ page import="javax.persistence.criteria.Predicate" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.DecimalFormatUtil" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.model.IsActive" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.ImageURIUtil" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.Objects" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: poojithairosha
  Date: 5/11/23
  Time: 6:02 PM
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
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/css/vendors.css"/>
    <link rel="stylesheet" href="assets/css/main.css"/>

    <!-- Icon -->
    <link rel="icon" href="assets/img/logo/favicon.jpg"/>

    <title>Ceylonese Envoy - Tour List</title>
</head>
<body>
<%@include file="includes/preloader.jsp" %>
<main>
    <%@include file="includes/header-light.jsp" %>


    <section class="pt-40 pb-40 bg-light-2">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="text-center">
                        <h1 class="text-30 fw-600">Awesome Tour Packages We Have</h1>
                    </div>

                    <div class="mainSearch -col-3-big bg-white px-10 py-10 lg:px-20 lg:pt-5 lg:pb-20 rounded-4 mt-30">

                        <form action="tour-list.jsp" class="searchMenuCustom m-0 p-0">
                            <div hidden="hidden">
                                <input name="page" type="text" hidden="hidden"
                                       value="<%= (request.getParameter("page") != null && !request.getParameter("page").equals("") && Integer.parseInt(request.getParameter("page")) > 0) ? request.getParameter("page") : "1"%>">
                            </div>
                            <div class="col pr-30 pl-10 lg:py-20 lg:px-0">
                                <div>
                                    <div class="ml-10">
                                        <h4 class="text-15 fw-500 ls-2 lh-16"><i
                                                class="icon-location-2 text-20 text-light-1 mt-5"></i> Location</h4>
                                        <div class="text-15 text-light-1 ls-2 lh-16">
                                            <%
                                                if (request.getParameter("search") != null) {
                                                    pageContext.setAttribute("search", request.getParameter("search"));
                                                }
                                            %>
                                            <input name="search" type="search" placeholder="Where are you going?"
                                                   value="${search}"/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col pr-30 pl-10 lg:py-20 lg:px-0">
                                <div>
                                    <div class="ml-10">
                                        <label>Sort By</label>
                                        <select name="sort">
                                            <option value="">NONE</option>
                                            <option value="PA" <%= (String.valueOf(request.getParameter("sort")).equals("PA")) ? "selected" : "" %>>Price ASC</option>
                                            <option value="PD" <%=(String.valueOf(request.getParameter("sort")).equals("PD")) ? "selected" : "" %>>Price DESC</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <button class="mainSearch__submit button -dark-1 py-15 px-40 col-12 rounded-4 bg-blue-1 text-white">
                                    <i class="icon-search text-20 mr-10"></i>
                                    Search
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="layout-pt-md layout-pb-lg">
        <div class="container">
            <div class="row y-gap-30">
                 <%-- <div class="col-xl-3 col-lg-4 lg:d-none"> --%>
                 <%--     <aside class="sidebar y-gap-40"> --%>

                 <%--         <div class="sidebar__item"> --%>
                 <%--             <h3>Filters</h3> --%>
                 <%--         </div> --%>

                 <%--         <div class="sidebar__item pb-30"> --%>
                 <%--             <h5 class="text-18 fw-500 mb-10">Price</h5> --%>
                 <%--             <div class="row x-gap-10 y-gap-30"> --%>
                 <%--                 <div class="col-12"> --%>
                 <%--                     <div class="js-price-rangeSlider"> --%>
                 <%--                         <div class="text-14 fw-500"></div> --%>

                 <%--                         <div class="d-flex justify-between mb-20"> --%>
                 <%--                             <div class="text-15 text-dark-1"> --%>
                 <%--                                 <span class="js-lower"></span> --%>
                 <%--                                 - --%>
                 <%--                                 <span class="js-upper"></span> --%>
                 <%--                             </div> --%>
                 <%--                         </div> --%>

                 <%--                         <div class="px-5"> --%>
                 <%--                             <div class="js-slider"></div> --%>
                 <%--                         </div> --%>
                 <%--                     </div> --%>
                 <%--                 </div> --%>
                 <%--             </div> --%>
                 <%--         </div> --%>

                 <%--     </aside> --%>
                 <%-- </div>  --%>

                <div class="col-12">

                    <div class=" row y-gap-30">

                        <%
                            pageContext.setAttribute("df", DecimalFormatUtil.getInstance());

                            int limit = 10;
                            int pageNo = 1;
                            String search = "";
                            String sort = "PA";

                            if (request.getParameter("page") != null) {
                                pageNo = Integer.parseInt(request.getParameter("page"));
                            }

                            if (request.getParameter("search") != null) {
                                search = request.getParameter("search");
                            }

                            if(request.getParameter("sort") != null) {
                                sort = request.getParameter("sort");
                            }

                            pageContext.setAttribute("sort", sort);
                            pageContext.setAttribute("search", search);

                            try (Session hs = HibernateUtil.getSessionFactory().openSession()) {

                                List<Predicate> predicatesList = new ArrayList<>();
                                CriteriaBuilder criteriaBuilder = hs.getCriteriaBuilder();
                                CriteriaQuery<TourPackage> query = criteriaBuilder.createQuery(TourPackage.class);
                                Root<TourPackage> root = query.from(TourPackage.class);

                                predicatesList.add(criteriaBuilder.like(root.get("name"), "%" + search + "%"));
                                predicatesList.add(criteriaBuilder.like(root.get("overview"), "%" + search + "%"));
                                predicatesList.add(criteriaBuilder.like(root.get("locations"), "%" + search + "%"));

                                query.select(root).where(criteriaBuilder.and(criteriaBuilder.equal(root.get("isActive"), IsActive.ACTIVE),criteriaBuilder.or(predicatesList.toArray(new Predicate[0]))));

                                if(sort.equals("PA")) {
                                    query.orderBy(criteriaBuilder.asc(root.get("price")));
                                }else if(sort.equals("PD")) {
                                    query.orderBy(criteriaBuilder.desc(root.get("price")));
                                }

                                List<Predicate> countPredicatesList = new ArrayList<>();
                                CriteriaQuery<Long> countQuery = criteriaBuilder.createQuery(Long.class);
                                Root<TourPackage> countRoot = countQuery.from(TourPackage.class);

                                countPredicatesList.add(criteriaBuilder.like(countRoot.get("name"), "%" + search + "%"));
                                countPredicatesList.add(criteriaBuilder.like(countRoot.get("overview"), "%" + search + "%"));
                                countPredicatesList.add(criteriaBuilder.like(countRoot.get("locations"), "%" + search + "%"));

                                countQuery.select(criteriaBuilder.count(countRoot)).where(criteriaBuilder.and(criteriaBuilder.equal(countRoot.get("isActive"), IsActive.ACTIVE),criteriaBuilder.or(countPredicatesList.toArray(new Predicate[0]))));

                                Long count = hs.createQuery(countQuery).getSingleResult();
                                int pageCount = (int) Math.ceil((double) count / limit);
                                pageContext.setAttribute("pageCount", pageCount);

                                List<TourPackage> tourPackages = hs.createQuery(query)
                                        .setFirstResult((pageNo > 0 ? pageNo - 1 : 0) * limit)
                                        .setMaxResults(limit)
                                        .getResultList();

                                // List<TourPackage> tourPackages = hs.createQuery("from TourPackage", TourPackage.class)
                                //         .setFirstResult((pageNo > 0 ? pageNo - 1 : 0) * limit)
                                //         .setMaxResults(limit)
                                //         .getResultList();

                                pageContext.setAttribute("pageNo", pageNo);
                                pageContext.setAttribute("tourPackages", tourPackages);
                            }
                        %>

                        <c:if test="${tourPackages.size() <= 0}">
                            <div class="col-12 text-center">
                                <i class="fa-solid fa-circle-exclamation fs-2 text-muted"></i>
                                <h4 class="text-muted">Sorry! No Package Found</h4>
                            </div>
                        </c:if>

                        <c:forEach var="tourPackage" items="${tourPackages}">
                            <%-- Item Start --%>
                            <div class="border-bottom-light col-12">
                                <div>
                                    <div class="row x-gap-20 y-gap-20">
                                        <div class="col-md-auto">

                                            <div class="cardImage ratio ratio-1:1 w-250 md:w-1/1 rounded-4">
                                                <div class="cardImage__content">
                                                    <c:if test="${tourPackage.tourPackageImages.size() > 0}">
                                                        <% TourPackage tp = (TourPackage) pageContext.getAttribute("tourPackage"); %>
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

                                        <div class="col-md">
                                            <h3 class="text-18 lh-16 fw-500">${tourPackage.name}</h3>
                                            <p class="text-14 lh-14 mt-5">${tourPackage.locations}</p>

                                            <div class="text-14 lh-15 fw-500 mt-20">Taking safety measures</div>
                                            <div class="text-14 text-green-2 fw-500 lh-15 mt-5">Free cancellation
                                            </div>
                                        </div>

                                            <%-- Reviews Start --%>
                                        <div class="col-md-auto text-right md:text-left">
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

                                            <div class="d-flex x-gap-5 items-center justify-end md:justify-start">

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

                                            <div class="text-14 lh-14 text-light-1 mt-10">${reviewCount} reviews</div>

                                            <div class="text-14 text-light-1 mt-50 md:mt-20">From</div>
                                            <div class="text-22 lh-12 fw-600 mt-5">
                                                USD ${df.format(tourPackage.price)}</div>

                                            <a href="tour-details.jsp?package=${tourPackage.id}"
                                               class="button -md -dark-1 bg-warning text-white mt-24">
                                                View Detail
                                                <div class="icon-arrow-top-right ml-15"></div>
                                            </a>
                                        </div>
                                            <%-- Reviews End --%>
                                    </div>
                                </div>
                            </div>
                            <%-- Item End --%>
                        </c:forEach>
                    </div>

                    <%-- Pagination Start --%>
                    <div class="mt-30 pt-30">
                        <div class="row x-gap-10 y-gap-20 justify-between md:justify-center">
                            <div class="col-auto md:order-1">
                                <c:if test="${pageNo > 1}">
                                    <a href="?page=${pageNo - 1}&search=${search}"
                                       class="button -blue-1 size-40 rounded-full border-light">
                                        <i class="icon-chevron-left text-12"></i>
                                    </a>
                                </c:if>
                            </div>

                            <div class="col-md-auto md:order-3">
                                <div class="row x-gap-20 y-gap-20 items-center">

                                    <c:forEach var="i" begin="1" end="${pageCount}">
                                        <div class="col-auto">
                                            <a href="?page=${i}&search=${search}"
                                               class="size-40 flex-center rounded-full pagination_number ${(pageNo == i) ? "pagination_num_selected" : ""}">${i}</a>
                                        </div>
                                    </c:forEach>

                                </div>
                            </div>

                            <div class="col-auto md:order-2">
                                <c:if test="${pageNo < pageCount}">
                                    <a href="?page=${pageNo + 1}&search=${search}"
                                       class="button -blue-1 size-40 rounded-full border-light">
                                        <i class="icon-chevron-right text-12"></i>
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <%-- Pagination End --%>
                </div>
            </div>
        </div>
    </section>

</main>

<!-- JavaScript -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAAz77U5XQuEME6TpftaMdX0bBelQxXRlM"></script>
<script src="https://unpkg.com/@googlemaps/markerclusterer/dist/index.min.js"></script>

<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/vendors.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>
