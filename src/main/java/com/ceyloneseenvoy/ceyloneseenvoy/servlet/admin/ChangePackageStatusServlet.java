package com.ceyloneseenvoy.ceyloneseenvoy.servlet.admin;

import com.ceyloneseenvoy.ceyloneseenvoy.dto.ResponseDTO;
import com.ceyloneseenvoy.ceyloneseenvoy.model.IsActive;
import com.ceyloneseenvoy.ceyloneseenvoy.model.TourPackage;
import com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.hibernate.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChangePackageStatusServlet", urlPatterns = "/admin/change-package-status")
public class ChangePackageStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        String id = req.getParameter("id");

        try(Session session = HibernateUtil.getSessionFactory().openSession()) {
            try {
                session.beginTransaction();
                TourPackage tourPackage = session.get(TourPackage.class, Long.parseLong(id));
                if (tourPackage.getIsActive() == IsActive.ACTIVE) {
                    tourPackage.setIsActive(IsActive.INACTIVE);
                } else {
                    tourPackage.setIsActive(IsActive.ACTIVE);
                }
                session.update(tourPackage);
                session.getTransaction().commit();

                resp.getWriter().print(mapper.writeValueAsString(ResponseDTO.builder().status(true).message("Package status changed successfully").build()));
            }catch (Exception e) {
                session.getTransaction().rollback();
                resp.getWriter().print(mapper.writeValueAsString(ResponseDTO.builder().status(false).message("Package status change failed").build()));
                throw e;
            }
        }
    }
}
