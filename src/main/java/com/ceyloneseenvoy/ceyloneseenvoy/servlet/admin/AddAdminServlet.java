package com.ceyloneseenvoy.ceyloneseenvoy.servlet.admin;

import com.ceyloneseenvoy.ceyloneseenvoy.dto.ResponseDTO;
import com.ceyloneseenvoy.ceyloneseenvoy.model.Admin;
import com.ceyloneseenvoy.ceyloneseenvoy.model.IsActive;
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

@WebServlet(name = "AddAdminServlet", value = "/admin/add-admin")
public class AddAdminServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();

        String email = req.getParameter("email");
        String password = req.getParameter("pass");
        String rePassword = req.getParameter("re-pass");

        if (email != null && password != null && rePassword != null) {

            if (password.equals(rePassword)) {

                try(Session session = HibernateUtil.getSessionFactory().openSession()) {

                    Admin admin = session.createQuery("from Admin where email = :email", Admin.class)
                            .setParameter("email", email)
                            .uniqueResult();

                    if(admin != null) {
                        resp.getWriter().println(objectMapper.writeValueAsString(ResponseDTO.builder().status(false).message("Admin already exists").build()));
                    }else {
                        try {
                            Admin build = Admin.builder().email(email).password(PasswordHasher.hashPassword(password)).status(IsActive.ACTIVE).build();

                            session.beginTransaction();
                            session.save(build);
                            session.getTransaction().commit();

                            resp.getWriter().println(objectMapper.writeValueAsString(ResponseDTO.builder().status(true).message("Admin added successfully").build()));
                        }catch (Exception e) {
                            session.getTransaction().rollback();
                            resp.getWriter().println(objectMapper.writeValueAsString(ResponseDTO.builder().status(false).message("Something went wrong").build()));
                            e.printStackTrace();
                        }
                    }

                }

            } else {
                resp.getWriter().println(objectMapper.writeValueAsString(ResponseDTO.builder().status(false).message("Password mismatch, Please check your password").build()));
            }

        } else {
            resp.getWriter().println(objectMapper.writeValueAsString(ResponseDTO.builder().status(false).message("Invalid request").build()));
        }
    }
}
