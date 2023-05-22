package com.ceyloneseenvoy.ceyloneseenvoy.servlet.admin;

import com.ceyloneseenvoy.ceyloneseenvoy.dto.ResponseDTO;
import com.ceyloneseenvoy.ceyloneseenvoy.model.Admin;
import com.ceyloneseenvoy.ceyloneseenvoy.model.IsActive;
import com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.hibernate.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChangeAdminStatusServlet", urlPatterns = "/admin/change-admin-status")
public class ChangeAdminStatusServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        String id = req.getParameter("id");

        try(Session session = HibernateUtil.getSessionFactory().openSession()) {
            try {
                session.beginTransaction();
                Admin admin= session.get(Admin.class, Long.parseLong(id));
                if (admin.getStatus() == IsActive.ACTIVE) {
                    admin.setStatus(IsActive.INACTIVE);
                } else {
                    admin.setStatus(IsActive.ACTIVE);
                }
                session.update(admin);
                session.getTransaction().commit();

                resp.getWriter().print(mapper.writeValueAsString(ResponseDTO.builder().status(true).message("Admin status changed successfully").build()));
            }catch (Exception e) {
                session.getTransaction().rollback();
                resp.getWriter().print(mapper.writeValueAsString(ResponseDTO.builder().status(false).message("Admin status change failed").build()));
                throw e;
            }
        }
    }
}
