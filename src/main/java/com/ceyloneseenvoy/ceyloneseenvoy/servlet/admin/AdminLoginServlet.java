package com.ceyloneseenvoy.ceyloneseenvoy.servlet.admin;

import com.ceyloneseenvoy.ceyloneseenvoy.dto.ResponseDTO;
import com.ceyloneseenvoy.ceyloneseenvoy.model.Admin;
import com.ceyloneseenvoy.ceyloneseenvoy.model.Customer;
import com.ceyloneseenvoy.ceyloneseenvoy.model.IsActive;
import com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil;
import com.ceyloneseenvoy.ceyloneseenvoy.util.PasswordHasher;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/auth/admin/login")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();

        String email = req.getParameter("email");
        String password = req.getParameter("password");


        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
            CriteriaQuery<Admin> query = criteriaBuilder.createQuery(Admin.class);
            Root<Admin> root = query.from(Admin.class);

            query.select(root).where(criteriaBuilder.equal(root.get("email"), email));
            Admin admin = session.createQuery(query).uniqueResult();

            if(admin == null) {
                resp.getWriter().println(objectMapper.writeValueAsString(new ResponseDTO(false, "No account found with this email. Please register first.")));
            } else if (admin.getStatus() == IsActive.INACTIVE) {
                resp.getWriter().println(objectMapper.writeValueAsString(new ResponseDTO(false, "Your account is not active. Please contact the administrator.")));
            } else if (PasswordHasher.checkPassword(password, admin.getPassword())) {
                req.getSession().setAttribute("admin", admin.getEmail());
                resp.getWriter().println(objectMapper.writeValueAsString(new ResponseDTO(true, req.getContextPath() + "/auth/admin/login.jsp")));
            } else {
                resp.getWriter().println(objectMapper.writeValueAsString(new ResponseDTO(false, "Invalid email or password")));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
