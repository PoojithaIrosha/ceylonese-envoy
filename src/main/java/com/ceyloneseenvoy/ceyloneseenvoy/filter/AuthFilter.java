package com.ceyloneseenvoy.ceyloneseenvoy.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/customer/*"})
public class AuthFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("AuthFilter init()");
    }

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("AuthFilter doFilter()");
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        HttpSession session = httpServletRequest.getSession(false);
        String contextPath = httpServletRequest.getContextPath();

        boolean isLoggedIn = (session != null && session.getAttribute("customer") != null);

        if (isLoggedIn) {
            filterChain.doFilter(request, response);
        } else {
            httpServletResponse.sendRedirect(contextPath + "/auth/customer/login.jsp");
        }

    }
}
