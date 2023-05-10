package com.ceyloneseenvoy.ceyloneseenvoy.servlet.customer;

import com.ceyloneseenvoy.ceyloneseenvoy.dto.AuthResponseDTO;
import com.ceyloneseenvoy.ceyloneseenvoy.model.User;
import com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil;
import com.ceyloneseenvoy.ceyloneseenvoy.util.PasswordHasher;
import org.hibernate.Session;
import org.hibernate.Transaction;

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

@WebServlet("/auth/customer/reset-password")
public class CustomerResetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String uuid = req.getParameter("uuid");
        String confirmPassword = req.getParameter("cPassword");

        if (password.equals(confirmPassword)) {
            try (Session session = HibernateUtil.getSessionFactory().openSession(); Jsonb jb = JsonbBuilder.create()) {
                session.beginTransaction();
                CriteriaBuilder builder = session.getCriteriaBuilder();
                CriteriaQuery<User> query = builder.createQuery(User.class);
                Root<User> root = query.from(User.class);

                query.select(root).where(builder.and(builder.equal(root.get("email"), email), builder.equal(root.get("verificationCode"), uuid)));
                User user = session.createQuery(query).uniqueResult();

                if (user != null) {
                    user.setPassword(PasswordHasher.hashPassword(password));
                    user.setVerificationCode(null);
                    try {
                        session.update(user);
                        session.getTransaction().commit();
                    } catch (Exception e) {
                        session.getTransaction().commit();
                        throw new RuntimeException(e);
                    }

                    resp.getWriter().print(jb.toJson(new AuthResponseDTO(true, req.getContextPath() + "/auth/customer/login.jsp")));
                } else {
                    resp.getWriter().print(jb.toJson(new AuthResponseDTO(false, "Invalid email or verification code")));
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            try (Jsonb jb = JsonbBuilder.create()) {
                resp.getWriter().print(jb.toJson(new AuthResponseDTO(false, "Password mismatch")));
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }

}
