<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="javax.persistence.criteria.Predicate" %>
<%@ page import="javax.persistence.criteria.CriteriaBuilder" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.model.TourPackage" %>
<%@ page import="javax.persistence.criteria.CriteriaQuery" %>
<%@ page import="javax.persistence.criteria.Root" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.model.IsActive" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.DecimalFormatUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    <title>Manage Tour Packages | Ceylonese Envoy</title>
</head>
<body>
<%@ include file="../includes/preloader.jsp" %>

<%@ include file="admin-header.jsp" %>

<div class="dashboard" data-x="dashboard" data-x-toggle="-is-sidebar-open">
    <%@ include file="admin-sidebar.jsp" %>


    <div class="dashboard__main">
        <div class="dashboard__content py-10 px-40">

            <div class="row y-gap-20 justify-between items-end">
                <div class="col-auto">
                    <h1 class="text-30 lh-14 fw-600">All Tour Packages</h1>
                </div>

                <div class="col-auto">
                    <a href="add-tour.jsp" class="button h-50 px-24 -dark-1 bg-blue-1 text-white">
                        Add Tours
                        <div class="icon-arrow-top-right ml-15"></div>
                    </a>
                </div>
            </div>

            <div class="py-10 px-30 rounded-4 bg-white shadow-3">
                <div class="tabs js-tabs">
                    <div class="tabs__content pt-30 js-tabs-content">
                        <div class="tabs__pane -tab-item-1 is-tab-el-active">
                            <div class="overflow-scroll scroll-bar-1">

                                <form action="tour-packages.jsp" class="py-2 d-flex gap-4">
                                    <input type="hidden" name="page"
                                           value="<%= (request.getParameter("page") != null && !request.getParameter("page").equals("") && Integer.parseInt(request.getParameter("page")) > 0) ? request.getParameter("page") : "1"%>">
                                    <input type="text" name="search" class="border ps-3" placeholder="Search..."
                                           value="${search}">
                                    <button type="submit" class="btn btn-warning">SEARCH</button>
                                </form>

                                <table class="table-4 -border-bottom col-12">
                                    <thead class="bg-light-2">
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <%
                                        pageContext.setAttribute("df", DecimalFormatUtil.getInstance());

                                        int limit = 10;
                                        int pageNo = 1;
                                        String search = "";

                                        if (request.getParameter("page") != null) {
                                            pageNo = Integer.parseInt(request.getParameter("page"));
                                        }


                                        if (request.getParameter("search") != null) {
                                            search = request.getParameter("search");
                                        }

                                        pageContext.setAttribute("search", search);

                                        try (Session hs = HibernateUtil.getSessionFactory().openSession()) {
                                            List<Predicate> predicatesList = new ArrayList<>();

                                            CriteriaBuilder criteriaBuilder = hs.getCriteriaBuilder();
                                            CriteriaQuery<TourPackage> query = criteriaBuilder.createQuery(TourPackage.class);
                                            Root<TourPackage> root = query.from(TourPackage.class);

                                            predicatesList.add(criteriaBuilder.like(root.get("name"), "%" + search + "%"));
                                            predicatesList.add(criteriaBuilder.like(root.get("overview"), "%" + search + "%"));
                                            predicatesList.add(criteriaBuilder.like(root.get("locations"), "%" + search + "%"));

                                            query.select(root).where(criteriaBuilder.or(predicatesList.toArray(new Predicate[0])));

                                            List<Predicate> countPredicatesList = new ArrayList<>();
                                            CriteriaQuery<Long> countQuery = criteriaBuilder.createQuery(Long.class);
                                            Root<TourPackage> countRoot = countQuery.from(TourPackage.class);

                                            countPredicatesList.add(criteriaBuilder.like(countRoot.get("name"), "%" + search + "%"));
                                            countPredicatesList.add(criteriaBuilder.like(countRoot.get("overview"), "%" + search + "%"));
                                            countPredicatesList.add(criteriaBuilder.like(countRoot.get("locations"), "%" + search + "%"));

                                            countQuery.select(criteriaBuilder.count(countRoot)).where(criteriaBuilder.or(countPredicatesList.toArray(new Predicate[0])));

                                            Long count = hs.createQuery(countQuery).getSingleResult();
                                            int pageCount = (int) Math.ceil((double) count / limit);
                                            pageContext.setAttribute("pageCount", pageCount);

                                            List<TourPackage> tourPackages = hs.createQuery(query)
                                                    .setFirstResult((pageNo > 0 ? pageNo - 1 : 0) * limit)
                                                    .setMaxResults(limit)
                                                    .getResultList();

                                            if (tourPackages != null) {
                                                pageContext.setAttribute("pageNo", pageNo);
                                                pageContext.setAttribute("tourPackages", tourPackages);
                                            } else {
                                                request.getRequestDispatcher("errors/404.jsp").forward(request, response);
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>

                                    <c:if test="${tourPackages.size() <= 0}">
                                        <tr>
                                            <td colspan="8" class="text-center">No packages found!</td>
                                        </tr>
                                    </c:if>

                                    <%
                                        List<TourPackage> tourPackagesList = (List<TourPackage>) pageContext.getAttribute("tourPackages");
                                        for (TourPackage tp : tourPackagesList) {
                                    %>
                                    <tr>
                                        <td><%= tp.getId() %></td>
                                        <td class="text-blue-1 fw-500"><%= tp.getName() %></td>
                                        <td>USD <%= DecimalFormatUtil.getInstance().format(tp.getPrice()) %></td>
                                        <td>
                                            <span class="rounded-100 py-4 px-10 text-center text-14 fw-500 bg-yellow-4 text-yellow-3"><%=tp.getIsActive()%></span>
                                        </td>
                                        <td>
                                            <div class="row x-gap-10 y-gap-10 items-center">

                                                <div class="col-auto">
                                                    <a href="${contextPath}/tour-details.jsp?package=<%= tp.getId() %>"
                                                       target="_blank"
                                                       class="flex-center bg-light-2 rounded-4 size-35">
                                                        <i class="icon-eye text-16 text-light-1"></i>
                                                    </a>
                                                </div>

                                                <div class="col-auto">
                                                    <a href="edit-tour.jsp?package=<%= tp.getId() %>"
                                                       class="flex-center bg-light-2 rounded-4 size-35">
                                                        <i class="icon-edit text-16 text-light-1"></i>
                                                    </a>
                                                </div>

                                                <div class="col-auto">

                                                    <%
                                                        if (tp.getIsActive() == IsActive.ACTIVE) {
                                                    %>
                                                    <button onclick="changePackageStatus(<%= tp.getId() %>)"
                                                            class="flex-center bg-light-2 rounded-4 size-35">
                                                        <i class="icon-access-denied fw-bold text-16 text-light-1"></i>
                                                    </button>
                                                    <%
                                                    } else {
                                                    %>
                                                    <button onclick="changePackageStatus(<%= tp.getId() %>)"
                                                            class="flex-center bg-light-2 rounded-4 size-35">
                                                        <i class="icon-check text-16 text-light-1"></i>
                                                    </button>
                                                    <%
                                                        }
                                                    %>
                                                </div>

                                            </div>
                                        </td>
                                    </tr>
                                    <%
                                        }

                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

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
