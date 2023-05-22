package com.ceyloneseenvoy.ceyloneseenvoy.servlet.admin;

import com.ceyloneseenvoy.ceyloneseenvoy.dto.ResponseDTO;
import com.ceyloneseenvoy.ceyloneseenvoy.model.Admin;
import com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.hibernate.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteAdminServlet", value = "/admin/delete-admin")
public class DeleteAdminServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        String id = req.getParameter("id");

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            try {
                session.beginTransaction();

                Admin admin = session.get(Admin.class, Long.parseLong(id));
                session.delete(admin);

                session.getTransaction().commit();

                resp.setContentType("application/json");
                resp.getWriter().write(mapper.writeValueAsString(ResponseDTO.builder().status(true).message("Admin deleted successfully").build()));
            } catch (Exception e) {
                session.getTransaction().rollback();
                resp.setContentType("application/json");
                resp.getWriter().write(mapper.writeValueAsString(ResponseDTO.builder().status(false).message("Admin delete failed").build()));
            }

        }
    }
}
