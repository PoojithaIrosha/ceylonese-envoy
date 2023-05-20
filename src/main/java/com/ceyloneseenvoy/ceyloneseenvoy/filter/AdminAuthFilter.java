package com.ceyloneseenvoy.ceyloneseenvoy.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/admin/*"})
public class AdminAuthFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("AuthFilter init()");
    }

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        HttpSession session = httpServletRequest.getSession(false);
        String contextPath = httpServletRequest.getContextPath();

        boolean isLoggedIn = (session != null && session.getAttribute("admin") != null);

        if (isLoggedIn) {
            filterChain.doFilter(request, response);
        } else {
            httpServletRequest.getRequestDispatcher("/errors/401.jsp").forward(request, response);
        }

    }
}
