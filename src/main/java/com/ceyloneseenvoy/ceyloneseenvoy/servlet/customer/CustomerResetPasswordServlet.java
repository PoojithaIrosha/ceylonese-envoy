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

@WebServlet("/auth/customer/reset-password")
public class CustomerResetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();

        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String uuid = req.getParameter("uuid");
        String confirmPassword = req.getParameter("cPassword");

        if (password.equals(confirmPassword)) {
            try (Session session = HibernateUtil.getSessionFactory().openSession()) {
                session.beginTransaction();

                Customer customer = session.createQuery("from Customer where email = :email and verificationCode = :uuid", Customer.class)
                        .setParameter("email", email)
                        .setParameter("uuid", uuid)
                        .uniqueResult();

                if (customer != null) {
                    customer.setPassword(PasswordHasher.hashPassword(password));
                    customer.setVerificationCode(null);
                    try {
                        session.update(customer);
                        session.getTransaction().commit();
                    } catch (Exception e) {
                        session.getTransaction().commit();
                        throw new RuntimeException(e);
                    }

                    resp.getWriter().print(objectMapper.writeValueAsString(new ResponseDTO(true, req.getContextPath() + "/auth/customer/login.jsp")));
                } else {
                    resp.getWriter().print(objectMapper.writeValueAsString(new ResponseDTO(false, "Invalid email or verification code")));
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            resp.getWriter().print(objectMapper.writeValueAsString(new ResponseDTO(false, "Password mismatch")));
        }
    }

}
