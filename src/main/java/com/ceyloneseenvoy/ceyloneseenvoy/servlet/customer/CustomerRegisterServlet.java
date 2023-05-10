package com.ceyloneseenvoy.ceyloneseenvoy.servlet.customer;

import com.ceyloneseenvoy.ceyloneseenvoy.dto.AuthResponseDTO;
import com.ceyloneseenvoy.ceyloneseenvoy.model.User;
import com.ceyloneseenvoy.ceyloneseenvoy.model.UserAddress;
import com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil;
import com.ceyloneseenvoy.ceyloneseenvoy.util.PasswordHasher;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.json.bind.Jsonb;
import javax.json.bind.JsonbBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/auth/customer/customer-register")
public class CustomerRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String mobile = req.getParameter("mobile");
        String address = req.getParameter("address");
        String province = req.getParameter("province");
        String postalCode = req.getParameter("postalCode");
        String city = req.getParameter("city");
        String country = req.getParameter("country");

        String errorMsg = "";
        if (firstName == null || firstName.isBlank()) {
            errorMsg = "First Name is required";
        } else if (lastName == null || lastName.isBlank()) {
            errorMsg = "Last Name is required";
        } else if (email == null || email.isBlank()) {
            errorMsg = "Email is required";
        } else if (password == null || password.isBlank()) {
            errorMsg = "Password is required";
        } else if (mobile == null || mobile.isBlank()) {
            errorMsg = "Mobile is required";
        } else if (address == null || address.isBlank()) {
            errorMsg = "Address is required";
        } else if (province == null || province.isBlank()) {
            errorMsg = "Province is required";
        } else if (postalCode == null || postalCode.isBlank()) {
            errorMsg = "Postal Code is required";
        } else if (city == null || city.isBlank()) {
            errorMsg = "City is required";
        } else if (country == null || country.isBlank()) {
            errorMsg = "Country is required";
        }

        try (Session session = HibernateUtil.getSessionFactory().openSession(); Jsonb jsonb = JsonbBuilder.create()) {
            if (!errorMsg.isBlank()) {
                resp.getWriter().print(jsonb.toJson(new AuthResponseDTO(false, errorMsg)));
            } else {

                User user = new User(firstName, lastName, email, PasswordHasher.hashPassword(password), mobile);
                user.setUserAddress(new UserAddress(address, province, city, postalCode, user));
                session.beginTransaction();
                try {
                    session.save(user);
                    session.getTransaction().commit();
                    req.getSession().setAttribute("user", user.getEmail());
                    resp.getWriter().print(jsonb.toJson(new AuthResponseDTO(true, req.getContextPath()+"/customer")));
                } catch (Exception e) {
                    resp.getWriter().print(jsonb.toJson(new AuthResponseDTO(false, "Email already exists")));
                    session.getTransaction().rollback();
                    throw new RuntimeException(e);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
