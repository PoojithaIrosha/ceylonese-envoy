package com.ceyloneseenvoy.ceyloneseenvoy.servlet.customer;

import com.ceyloneseenvoy.ceyloneseenvoy.dto.ResponseDTO;
import com.ceyloneseenvoy.ceyloneseenvoy.model.Customer;
import com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil;
import com.ceyloneseenvoy.ceyloneseenvoy.util.PasswordHasher;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.hibernate.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/auth/customer/customer-login")
public class CustomerLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            Customer customer = session.createQuery("from Customer where email = :email", Customer.class)
                    .setParameter("email", email)
                    .uniqueResult();

            if (customer != null && PasswordHasher.checkPassword(password, customer.getPassword())) {
                req.getSession().setAttribute("customer", customer.getEmail());
                resp.getWriter().println(objectMapper.writeValueAsString(new ResponseDTO(true, req.getContextPath()+"/auth/customer/login.jsp")));
            } else {
                resp.getWriter().println(objectMapper.writeValueAsString(new ResponseDTO(false, "Invalid email or password")));
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
