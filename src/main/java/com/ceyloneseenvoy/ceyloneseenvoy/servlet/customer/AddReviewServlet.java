package com.ceyloneseenvoy.ceyloneseenvoy.servlet.customer;

import com.ceyloneseenvoy.ceyloneseenvoy.dto.ResponseDTO;
import com.ceyloneseenvoy.ceyloneseenvoy.model.TourPackage;
import com.ceyloneseenvoy.ceyloneseenvoy.model.TourReview;
import com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.hibernate.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/add-review")
public class AddReviewServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ObjectMapper objectMapper = new ObjectMapper();

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String comment = req.getParameter("comment");
        String rating = req.getParameter("rating");
        String packageId = req.getParameter("packageId");

        if (name != null && email != null && comment != null && rating != null && packageId != null) {

            try (Session hs = HibernateUtil.getSessionFactory().openSession()) {
                hs.beginTransaction();

                TourPackage tourPackage = hs.find(TourPackage.class, Long.parseLong(packageId));

                TourReview tourReview = TourReview.builder().name(name).email(email).comment(comment).rating(Integer.parseInt(rating)).date(LocalDate.now()).tourPackage(tourPackage).build();
                hs.persist(tourReview);

                hs.getTransaction().commit();

                resp.getWriter().print(objectMapper.writeValueAsString(ResponseDTO.builder().status(true).message("Review added successfully").build()));
            } catch (Exception e) {
                resp.getWriter().println(objectMapper.writeValueAsString(ResponseDTO.builder().status(false).message("Something went wrong").build()));
                e.printStackTrace();
            }
        } else {
            resp.getWriter().println(objectMapper.writeValueAsString(ResponseDTO.builder().status(false).message("Please fill all the fields").build()));
        }

    }
}
