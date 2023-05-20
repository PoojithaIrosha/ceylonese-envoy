package com.ceyloneseenvoy.ceyloneseenvoy.servlet.admin;

import com.ceyloneseenvoy.ceyloneseenvoy.model.IsActive;
import com.ceyloneseenvoy.ceyloneseenvoy.model.TourPackage;
import com.ceyloneseenvoy.ceyloneseenvoy.model.TourPackageImage;
import com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil;
import org.hibernate.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "AddTourServlet", urlPatterns = "/admin/add-tour")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AddTourServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String locations = req.getParameter("locations");
        String overview = req.getParameter("overview");
        String departure = req.getParameter("departure");
        String cancellation = req.getParameter("cancellation");
        String inclusions = req.getParameter("inclusions");
        String exclusions = req.getParameter("exclusions");
        String highlights = req.getParameter("highlights");
        String additionalInfo = req.getParameter("addInfo");

        String erroMsg = null;

        if (name == null || name.isEmpty()) {
            erroMsg = "Name cannot be empty!";
        }else if(price == null || price.isEmpty()) {
            erroMsg = "Price cannot be empty!";
        }else if(locations == null || locations.isEmpty()) {
            erroMsg = "Locations cannot be empty!";
        }else if(overview == null || overview.isEmpty()) {
            erroMsg = "Overview cannot be empty!";
        }

        if(erroMsg != null) {
            resp.sendRedirect(req.getContextPath() + "/admin/add-tour.jsp?error=" + erroMsg);
        }else {

            try (Session session = HibernateUtil.getSessionFactory().openSession()) {

                TourPackage tourPackage = TourPackage.builder().name(name).price(Double.parseDouble(price)).locations(locations).overview(overview).departureDetails(departure).cancellationPolicy(cancellation).inclusions(inclusions).exclusions(exclusions).highlights(highlights).additionalInformation(additionalInfo).isActive(IsActive.ACTIVE).build();

                Collection<Part> parts = req.getParts();

                String uploadPath = getServletContext().getRealPath("/assets/img/tours");

                List<TourPackageImage> tourPackageImages = new ArrayList<>();

                for (Part part : parts) {
                    if (part.getName().equals("images") && part.getSize() > 0) {
                        String filePath = name + UUID.randomUUID() + ".jpg";
                        tourPackageImages.add(TourPackageImage.builder().image("assets/img/tours/" + filePath).build());

                        File file = new File(uploadPath + File.separator + filePath);
                        try (InputStream input = part.getInputStream()) {
                            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }

                if (tourPackageImages.isEmpty()) {
                    tourPackageImages.add(TourPackageImage.builder().image("assets/img/tours/default.png").build());
                }

                tourPackage.setTourPackageImages(tourPackageImages);
                try {
                    session.beginTransaction();
                    session.save(tourPackage);
                    session.getTransaction().commit();

                    resp.sendRedirect(req.getContextPath() + "/admin/tour-packages.jsp");
                } catch (Exception e) {
                    session.getTransaction().rollback();
                    req.getRequestDispatcher(req.getContextPath() + "/errors/500.jsp").forward(req, resp);
                    e.printStackTrace();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

