<%@ page import="org.hibernate.Session" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.model.TourPackage" %>
<%@ page import="javax.persistence.criteria.CriteriaBuilder" %>
<%@ page import="javax.persistence.criteria.CriteriaQuery" %>
<%@ page import="javax.persistence.criteria.Root" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.util.DecimalFormatUtil" %>
<%@ page import="com.ceyloneseenvoy.ceyloneseenvoy.model.IsActive" %><%--
  Created by IntelliJ IDEA.
  User: poojithairosha
  Date: 5/18/23
  Time: 10:56 PM
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
            query.select(root).where(criteriaBuilder.equal(root.get("id"), packageId));

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

    <title>${tourPackage.name} | Edit Tour | Ceylonese Envoy</title>
</head>
<body>
<%@include file="../includes/preloader.jsp" %>

<%@include file="admin-header.jsp" %>

<div class="dashboard" data-x="dashboard" data-x-toggle="-is-sidebar-open">
    <%@include file="admin-sidebar.jsp" %>

    <div class="dashboard__main">
        <div class="dashboard__content">
            <div class="row y-gap-20 justify-between items-end ">
                <div class="col-auto">
                    <h1 class="text-30 lh-14 fw-600">Edit Tour Package</h1>
                </div>
            </div>


            <div class="py-30 px-30 rounded-4 bg-white shadow-3">
                <div class="tabs -underline-2 js-tabs">

                    <div class="tabs__content js-tabs-content">
                        <div class="tabs__pane -tab-item-1 is-tab-el-active">
                            <div class="col-xl-10">
                                <div class="text-18 fw-500 mb-10">Tour Content</div>
                                <form method="post" action="update-tour" enctype="multipart/form-data" class="row x-gap-20 y-gap-20">
                                    <div>
                                        <input type="hidden" name="id" value="${tourPackage.id}">
                                    </div>

                                    <div class="col-12">
                                        <div class="form-input">
                                            <input type="text" name="name" value="${tourPackage.name}">
                                            <label class="lh-1 text-16 text-light-1">Tour Name *</label>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="form-input">
                                            <input type="text" name="price" value="${tourPackage.price}">
                                            <label class="lh-1 text-16 text-light-1">Tour Price *</label>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="form-input">
                                            <input type="text" name="locations" value="${tourPackage.locations}">
                                            <label class="lh-1 text-16 text-light-1">Locations *</label>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label class="lh-1 text-16 mb-2">Tour Overview *</label>
                                        <textarea name="overview" id="overview">${tourPackage.overview}</textarea>
                                    </div>

                                    <div class="col-12">
                                        <label class="lh-1 text-16 mb-2">Departure Details (Optional)</label>
                                        <textarea name="departure"
                                                  id="departure">${tourPackage.departureDetails}</textarea>
                                    </div>

                                    <div class="col-12">
                                        <label class="lh-1 text-16 mb-2">Cancellation Policy (Optional)</label>
                                        <textarea name="cancellation"
                                                  id="cancellation">${tourPackage.cancellationPolicy}</textarea>
                                    </div>

                                    <div class="col-12">
                                        <label class="lh-1 text-16 mb-2">Inclusions (Optional)</label>
                                        <textarea name="inclusions" id="inclusions">${tourPackage.inclusions}</textarea>
                                    </div>

                                    <div class="col-12">
                                        <label class="lh-1 text-16 mb-2">Exclusions (Optional)</label>
                                        <textarea name="exclusions" id="exclusions">${tourPackage.exclusions}</textarea>
                                    </div>

                                    <div class="col-12">
                                        <label class="lh-1 text-16 mb-2">Highlights (Optional)</label>
                                        <textarea name="highlights" id="highlights">${tourPackage.highlights}</textarea>
                                    </div>

                                    <div class="col-12">
                                        <label class="lh-1 text-16 mb-2">Additional Information (Optional)</label>
                                        <textarea name="addInfo"
                                                  id="addInfo">${tourPackage.additionalInformation}</textarea>
                                    </div>

                                    <div>
                                        <label class="lh-1 text-16 mb-2">Tour Images *</label>
                                        <div class="container p-3 d-flex gap-3" id="tiContainer">
                                            <c:forEach items="${tourPackage.tourPackageImages}" var="image">
                                                <div>
                                                    <img src="${contextPath}/${image.image}" alt="image" width="250"
                                                         height="250">
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div>
                                            <input onchange="selectTourImages()" name="images" id="images" multiple
                                                   type="file" hidden="hidden">
                                            <label for="images" class="btn btn-sm btn-secondary">SELECT IMAGES</label>
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


                                    <div class="d-grid">
                                        <button type="submit" class="button h-50 px-24 -dark-1 bg-blue-1 text-white">
                                            Add New Tour
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
<script src="../assets/ckeditor/ckeditor.js"></script>
<script src="../assets/js/vendors.js"></script>
<script src="../assets/js/main.js"></script>
<script>
    ClassicEditor
        .create(document.querySelector('#overview'))
        .catch(error => {
            console.error(error);
        });
    ClassicEditor
        .create(document.querySelector('#departure'))
        .catch(error => {
            console.error(error);
        });
    ClassicEditor
        .create(document.querySelector('#cancellation'))
        .catch(error => {
            console.error(error);
        });
    ClassicEditor
        .create(document.querySelector('#inclusions'))
        .catch(error => {
            console.error(error);
        });
    ClassicEditor
        .create(document.querySelector('#exclusions'))
        .catch(error => {
            console.error(error);
        });
    ClassicEditor
        .create(document.querySelector('#highlights'))
        .catch(error => {
            console.error(error);
        });
    ClassicEditor
        .create(document.querySelector('#addInfo'))
        .catch(error => {
            console.error(error);
        });
</script>

<script src="../assets/js/admin.js"></script>
</body>
</html>
