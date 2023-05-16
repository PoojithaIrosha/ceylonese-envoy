package com.ceyloneseenvoy.ceyloneseenvoy.servlet.customer;

import com.ceyloneseenvoy.ceyloneseenvoy.dto.ResponseDTO;
import com.ceyloneseenvoy.ceyloneseenvoy.model.Customer;
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
            CriteriaQuery<Customer> query = criteriaBuilder.createQuery(Customer.class);
            Root<Customer> root = query.from(Customer.class);

            query.select(root).where(criteriaBuilder.equal(root.get("email"), email));
            Customer customer = session.createQuery(query).uniqueResult();

            if (customer != null && PasswordHasher.checkPassword(password, customer.getPassword())) {
                req.getSession().setAttribute("customer", customer.getEmail());
                resp.getWriter().println(jb.toJson(new ResponseDTO(true, req.getContextPath()+"/auth/customer/login.jsp")));
            } else {
                resp.getWriter().println(jb.toJson(new ResponseDTO(false, "Invalid email or password")));
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
