package com.ceyloneseenvoy.ceyloneseenvoy.servlet.admin;

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

@WebServlet(name = "UpdateTourServlet", urlPatterns = "/admin/update-tour")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class UpdateTourServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
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

        if(departure == null || departure.isEmpty()) {
            departure = null;
        }

        if(cancellation == null || cancellation.isEmpty()) {
            cancellation = null;
        }

        if(inclusions == null || inclusions.isEmpty()) {
            inclusions = null;
        }

        if(exclusions == null || exclusions.isEmpty()) {
            exclusions = null;
        }

        if(highlights == null || highlights.isEmpty()) {
            highlights = null;
        }

        if(additionalInfo == null || additionalInfo.isEmpty()) {
            additionalInfo = null;
        }

        if(erroMsg != null) {
            resp.sendRedirect(req.getContextPath() + "/admin/edit-tour.jsp?package=" + id + "&error=" + erroMsg);
        }else {
            try (Session session = HibernateUtil.getSessionFactory().openSession()) {
                TourPackage tourPackage = session.get(TourPackage.class, Long.parseLong(id));
                tourPackage.setName(name);
                tourPackage.setPrice(Double.parseDouble(price));
                tourPackage.setLocations(locations);
                tourPackage.setOverview(overview);
                tourPackage.setDepartureDetails(departure);
                tourPackage.setCancellationPolicy(cancellation);
                tourPackage.setInclusions(inclusions);
                tourPackage.setExclusions(exclusions);
                tourPackage.setHighlights(highlights);
                tourPackage.setAdditionalInformation(additionalInfo);

                Collection<Part> parts = req.getParts();
                List<TourPackageImage> tourPackageImages = new ArrayList<>();

                String uploadPath = System.getProperty("catalina.home") + File.separator + "ceylonese-envoy" + File.separator + "tours";

                File directory = new File(uploadPath);
                if (!directory.exists()) {
                    directory.mkdirs();
                }

                for (Part part : parts) {
                    if (part.getName().equals("images") && part.getSize() > 0) {
                        String filePath = uploadPath + File.separator + name + UUID.randomUUID() + ".jpg";
                        tourPackageImages.add(TourPackageImage.builder().image(filePath).build());

                        File file = new File(filePath);
                        try (InputStream input = part.getInputStream()) {
                            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }

                try {
                    session.beginTransaction();

                    if (!tourPackageImages.isEmpty()) {
                        for (TourPackageImage tpi : tourPackage.getTourPackageImages()) {
                            File file = new File(tpi.getImage());
                            if (file.exists()) {
                                file.delete();
                            }

                            session.createQuery("delete from TourPackageImage where id = :id")
                                    .setParameter("id", tpi.getId())
                                    .executeUpdate();
                        }
                        tourPackage.setTourPackageImages(tourPackageImages);
                    }

                    session.update(tourPackage);
                    session.getTransaction().commit();

                    resp.sendRedirect(req.getContextPath() + "/admin/tour-packages.jsp");
                } catch (Exception e) {
                    session.getTransaction().rollback();
                    req.getRequestDispatcher(req.getContextPath() + "/errors/500.jsp").forward(req, resp);
                    e.printStackTrace();
                }
            }
        }
    }
}
