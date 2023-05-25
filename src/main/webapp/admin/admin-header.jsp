<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="header-margin"></div>
<header data-add-bg="" class="header -dashboard bg-white js-header" data-x="header" data-x-toggle="is-menu-opened">
  <div data-anim="fade" class="header__container px-30 sm:px-20">
    <div class="-left-side">
      <a href="index.html" class="header-logo" data-x="header-logo" data-x-toggle="is-logo-dark">
        <img src="${contextPath}/assets/img/logo/logo.png" alt="logo icon">
        <img src="${contextPath}/assets/img/logo/logo.png" alt="logo icon">
      </a>
    </div>

    <div class="row justify-between items-center pl-60 lg:pl-20">
      <div class="col-auto">
        <div class="d-flex items-center">
          <button data-x-click="dashboard">
            <i class="icon-menu-2 text-20"></i>
          </button>

          <div class="single-field relative d-flex items-center md:d-none ml-30">
            <input class="pl-50 border-light text-dark-1 h-50 rounded-8" type="email" placeholder="Search">
            <button class="absolute d-flex items-center h-full">
              <i class="icon-search text-20 px-15 text-dark-1"></i>
            </button>
          </div>
        </div>
      </div>

      <div class="col-auto">
        <div class="d-flex items-center">
          <div class="row items-center x-gap-5 y-gap-20 pl-20 lg:d-none">
            <div class="col-auto">
              <button class="button -blue-1-05 size-50 rounded-22 flex-center">
                <i class="icon-email-2 text-20"></i>
              </button>
            </div>

            <div class="col-auto">
              <button class="button -blue-1-05 size-50 rounded-22 flex-center">
                <i class="icon-notification text-20"></i>
              </button>
            </div>
          </div>

          <div class="pl-15">
            <img src="${contextPath}/assets/img/users/user.png" alt="image" class="size-40 rounded-22 object-cover">
            ${sessionScope.get("admin")}
          </div>

          <div class="d-none xl:d-flex x-gap-20 items-center pl-20" data-x="header-mobile-icons" data-x-toggle="text-white">
            <div><button class="d-flex items-center icon-menu text-20" data-x-click="html, header, header-logo, header-mobile-icons, mobile-menu"></button></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>