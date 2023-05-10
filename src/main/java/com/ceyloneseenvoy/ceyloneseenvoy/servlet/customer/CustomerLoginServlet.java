package com.ceyloneseenvoy.ceyloneseenvoy.servlet.customer;

import com.ceyloneseenvoy.ceyloneseenvoy.dto.AuthResponseDTO;
import com.ceyloneseenvoy.ceyloneseenvoy.model.User;
import com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil;
import com.ceyloneseenvoy.ceyloneseenvoy.util.PasswordHasher;
import org.hibernate.Session;

import javax.json.bind.Jsonb;
import javax.json.bind.JsonbBuilder;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
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

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try (Session session = HibernateUtil.getSessionFactory().openSession(); Jsonb jb = JsonbBuilder.create()) {

            CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
            CriteriaQuery<User> query = criteriaBuilder.createQuery(User.class);
            Root<User> root = query.from(User.class);

            query.select(root).where(criteriaBuilder.equal(root.get("email"), email));
            User user = session.createQuery(query).uniqueResult();

            if (user != null && PasswordHasher.checkPassword(password, user.getPassword())) {
                req.getSession().setAttribute("user", user.getEmail());
                resp.getWriter().println(jb.toJson(new AuthResponseDTO(true, req.getContextPath()+"/auth/customer/login.jsp")));
            } else {
                resp.getWriter().println(jb.toJson(new AuthResponseDTO(false, "Invalid email or password")));
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
