<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.DecimalFormatUtil" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil" %>
<%@ page import="javax.persistence.criteria.Predicate" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.model.TourPackage" %>
<%@ page import="javax.persistence.criteria.CriteriaBuilder" %>
<%@ page import="javax.persistence.criteria.CriteriaQuery" %>
<%@ page import="javax.persistence.criteria.Root" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.model.Customer" %><%--
  Created by IntelliJ IDEA.
  User: poojithairosha
  Date: 5/19/23
  Time: 1:14 PM
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

  <!-- Icon -->
  <link rel="icon" href="../assets/img/logo/favicon.jpg"/>

  <title>Manage Customers | Ceylonese Envoy</title>
</head>
<body>
<%@ include file="../includes/preloader.jsp" %>

<%@ include file="admin-header.jsp" %>

<div class="dashboard" data-x="dashboard" data-x-toggle="-is-sidebar-open">
  <%@ include file="admin-sidebar.jsp" %>


  <div class="dashboard__main">
    <div class="dashboard__content py-10">

      <div class="row y-gap-20 justify-between items-end">
        <div class="col-auto">
          <h1 class="text-30 lh-14 fw-600">All Customers</h1>
        </div>
      </div>

      <div class="py-10 px-30 rounded-4 bg-white shadow-3">
        <div class="tabs js-tabs">
          <div class="tabs__content pt-30 js-tabs-content">
            <div class="tabs__pane -tab-item-1 is-tab-el-active">
              <div class="overflow-scroll scroll-bar-1">

                <form action="all-customers.jsp" class="py-2 d-flex gap-4">
                  <input type="hidden" name="page" value="<%= (request.getParameter("page") != null && !request.getParameter("page").equals("") && Integer.parseInt(request.getParameter("page")) > 0) ? request.getParameter("page") : "1"%>">
                  <input type="text" name="search" class="border ps-3" placeholder="Search..." value="${search}">
                  <button type="submit" class="btn btn-warning">SEARCH</button>
                </form>

                <table class="table-4 -border-bottom col-12">
                  <thead class="bg-light-2">
                  <tr>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>

                  <%
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
                      CriteriaQuery<Customer> query = criteriaBuilder.createQuery(Customer.class);
                      Root<Customer> root = query.from(Customer.class);

                      predicatesList.add(criteriaBuilder.like(root.get("firstName"), "%" + search + "%"));
                      predicatesList.add(criteriaBuilder.like(root.get("lastName"), "%" + search + "%"));
                      predicatesList.add(criteriaBuilder.like(root.get("email"), "%" + search + "%"));
                      predicatesList.add(criteriaBuilder.like(root.get("mobile"), "%" + search + "%"));

                      query.select(root).where(criteriaBuilder.or(predicatesList.toArray(new Predicate[0])));

                      List<Predicate> countPredicatesList = new ArrayList<>();
                      CriteriaQuery<Long> countQuery = criteriaBuilder.createQuery(Long.class);
                      Root<Customer> countRoot = countQuery.from(Customer.class);

                      countPredicatesList.add(criteriaBuilder.like(countRoot.get("firstName"), "%" + search + "%"));
                      countPredicatesList.add(criteriaBuilder.like(countRoot.get("lastName"), "%" + search + "%"));
                      countPredicatesList.add(criteriaBuilder.like(countRoot.get("email"), "%" + search + "%"));
                      countPredicatesList.add(criteriaBuilder.like(countRoot.get("mobile"), "%" + search + "%"));

                      countQuery.select(criteriaBuilder.count(countRoot)).where(criteriaBuilder.or(countPredicatesList.toArray(new Predicate[0])));

                      Long count = hs.createQuery(countQuery).getSingleResult();
                      int pageCount = (int) Math.ceil((double) count / limit);
                      pageContext.setAttribute("pageCount", pageCount);

                      List<Customer> customers = hs.createQuery(query)
                              .setFirstResult((pageNo > 0 ? pageNo - 1 : 0) * limit)
                              .setMaxResults(limit)
                              .getResultList();

                      pageContext.setAttribute("pageNo", pageNo);
                      pageContext.setAttribute("customers", customers);
                    }
                  %>

                  <c:if test="${customers.size() <= 0}">
                    <tr>
                      <td colspan="8" class="text-center">No customer found!</td>
                    </tr>
                  </c:if>

                  <c:forEach items="${customers}" var="customer">
                    <tr>
                      <td class="text-blue-1 fw-500">${customer.firstName} ${customer.lastName}</td>
                      <td>${customer.email}</td>
                        <td>${customer.mobile}</td>
                        <td>${customer.customerAddress.address}, ${customer.customerAddress.city}, ${customer.customerAddress.province}, ${customer.customerAddress.postalCode}</td>
                    </tr>
                  </c:forEach>
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
