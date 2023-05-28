<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="header-margin"></div>
<header data-add-bg="" class="header bg-dark-1 js-header" data-x="header" data-x-toggle="is-menu-opened">
    <div data-anim="fade" class="header__container px-30 sm:px-20">
        <div class="row justify-between items-center">

            <div class="col-auto">
                <div class="d-flex items-center">
                    <a href="${contextPath}/" class="header-logo mr-20" data-x="header-logo" data-x-toggle="is-logo-dark">
                        <img src="${contextPath}/assets/img/logo/logo.png" alt="logo icon">
                        <img src="${contextPath}/assets/img/logo/logo.png" alt="logo icon">
                    </a>

                    <div class="header-menu" data-x="mobile-menu" data-x-toggle="is-menu-active">
                        <div class="mobile-overlay"></div>

                        <div class="header-menu__content">
                            <div class="mobile-bg js-mobile-bg"></div>

                            <div class="menu js-navList">
                                <ul class="menu__nav text-dark-1 -is-active">

                                    <li>
                                        <a href="${contextPath}/index.jsp">
                                            <span class="mr-10">Home</span>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="${contextPath}/tour-list.jsp"> Tour Packages </a>
                                    </li>

                                    <li>
                                        <a href="#">About Us</a>
                                    </li>

                                    <li>
                                        <a href="#">Contact Us</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="mobile-footer px-20 py-20 border-top-light js-mobile-footer">
                            </div>
                        </div>
                    </div>

                </div>
            </div>


             <div class="col-auto">
                 <div class="d-flex items-center">
                     <div class="d-none xl:d-flex x-gap-20 items-center pl-30" data-x="header-mobile-icons" data-x-toggle="text-white">
                         <div><button class="d-flex items-center icon-menu text-20" data-x-click="html, header, header-logo, header-mobile-icons, mobile-menu"></button></div>
                     </div>
                 </div>
             </div>

        </div>
    </div>
</header>