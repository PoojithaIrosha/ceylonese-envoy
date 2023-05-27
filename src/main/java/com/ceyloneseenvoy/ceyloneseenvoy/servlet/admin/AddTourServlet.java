package com.ceyloneseenvoy.ceyloneseenvoy.servlet.admin;

import com.ceyloneseenvoy.ceyloneseenvoy.model.IsActive;
import com.ceyloneseenvoy.ceyloneseenvoy.model.TourPackage;
import com.ceyloneseenvoy.ceyloneseenvoy.model.TourPackageImage;
import com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "AddTourServlet", urlPatterns = "/admin/add-tour")
public class AddTourServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = null;
        String name = null;
        String price = null;
        String locations = null;
        String overview = null;
        String departure = null;
        String cancellation = null;
        String inclusions = null;
        String exclusions = null;
        String highlights = null;
        String additionalInfo = null;
        String erroMsg = "Please fill all the fields";
        List<FileItem> images = new ArrayList<>();

        // Create a DiskFileItemFactory
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Set the temporary directory for storing uploaded files
        String tempDirPath = System.getProperty("java.io.tmpdir");
        File tempDir = new File(tempDirPath);
        factory.setRepository(tempDir);

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            // Parse the request to get the list of FileItems
            List<FileItem> items = upload.parseRequest(req);

            // Process each file item
            for (FileItem item : items) {
                // Check if the item is a form field or a file
                if (item.isFormField()) {
                    // This is a regular form field
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();

                    if ((fieldName.equals("id") || fieldName.equals("name") || fieldName.equals("price") || fieldName.equals("locations") || fieldName.equals("overview")) && fieldValue.isEmpty()) {
                        resp.sendRedirect(req.getContextPath() + "/admin/add-tour.jsp?error=" + erroMsg);
                        return;
                    }

                    switch (fieldName) {
                        case "id":
                            id = fieldValue;
                            break;
                        case "name":
                            name = fieldValue;
                            break;
                        case "price":
                            price = fieldValue;
                            break;
                        case "locations":
                            locations = fieldValue;
                            break;
                        case "overview":
                            overview = fieldValue;
                            break;
                        case "departure":
                            departure = fieldValue;
                            break;
                        case "cancellation":
                            cancellation = fieldValue;
                            break;
                        case "inclusions":
                            inclusions = fieldValue;
                            break;
                        case "exclusions":
                            exclusions = fieldValue;
                            break;
                        case "highlights":
                            highlights = fieldValue;
                            break;
                        case "addInfo":
                            additionalInfo = fieldValue;
                            break;
                        default:
                            resp.sendRedirect(req.getContextPath() + "/admin/add-tour.jsp?error=" + erroMsg);
                            return;
                    }

                } else {

                    if (item.getSize() > 0) {
                        images.add(item);
                    }
                }
            }

            try (Session session = HibernateUtil.getSessionFactory().openSession()) {

                TourPackage tourPackage = TourPackage.builder().name(name).price(Double.parseDouble(price)).locations(locations).overview(overview).departureDetails(departure).cancellationPolicy(cancellation).inclusions(inclusions).exclusions(exclusions).highlights(highlights).additionalInformation(additionalInfo).isActive(IsActive.ACTIVE).build();

                List<TourPackageImage> tourPackageImages = new ArrayList<>();

                images.forEach((item) -> {
                    // This is an uploaded file
                    String fileName = UUID.randomUUID() + ".jpg";

                    // Save the file to disk
                    String uploadDirPath = System.getProperty("user.home") + File.separator + "/ceylonese-envoy/uploads/";
                    File uploadDir = new File(uploadDirPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }

                    File uploadedFile = new File(uploadDir, fileName);
                    try {
                        item.write(uploadedFile);
                        tourPackageImages.add(TourPackageImage.builder().image(uploadDirPath + fileName).build());
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                });

                if (tourPackageImages.size() > 0) {
                    tourPackage.setTourPackageImages(tourPackageImages);
                }

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


        } catch (FileUploadException e) {
            // Handle file upload exception
            e.printStackTrace();
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace();
        }

        // String erroMsg = null;
        //
        // if (name == null || name.isEmpty()) {
        //     erroMsg = "Name cannot be empty!";
        // } else if (price == null || price.isEmpty()) {
        //     erroMsg = "Price cannot be empty!";
        // } else if (locations == null || locations.isEmpty()) {
        //     erroMsg = "Locations cannot be empty!";
        // } else if (overview == null || overview.isEmpty()) {
        //     erroMsg = "Overview cannot be empty!";
        // }
        //
        // if (erroMsg != null) {
        //     resp.sendRedirect(req.getContextPath() + "/admin/add-tour.jsp?error=" + erroMsg);
        // } else {
        //
        //     try (Session session = HibernateUtil.getSessionFactory().openSession()) {
        //
        //         TourPackage tourPackage = TourPackage.builder().name(name).price(Double.parseDouble(price)).locations(locations).overview(overview).departureDetails(departure).cancellationPolicy(cancellation).inclusions(inclusions).exclusions(exclusions).highlights(highlights).additionalInformation(additionalInfo).isActive(IsActive.ACTIVE).build();
        //
        //         Collection<Part> parts = req.getParts();
        //
        //         String uploadPath = System.getProperty("catalina.home") + File.separator + "ceylonese-envoy" + File.separator + "tours";
        //
        //         File directory = new File(uploadPath);
        //         if (!directory.exists()) {
        //             directory.mkdirs();
        //         }
        //         System.out.println("uploadPath: " + uploadPath);
        //
        //         List<TourPackageImage> tourPackageImages = new ArrayList<>();
        //
        //         for (Part part : parts) {
        //             if (part.getName().equals("images") && part.getSize() > 0) {
        //                 String filePath = uploadPath + File.separator + name + UUID.randomUUID() + ".jpg";
        //                 tourPackageImages.add(TourPackageImage.builder().image(filePath).build());
        //
        //                 File file = new File(filePath);
        //                 try (InputStream input = part.getInputStream()) {
        //                     Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        //                 } catch (Exception e) {
        //                     e.printStackTrace();
        //                 }
        //             }
        //         }
        //
        //         if (tourPackageImages.size() > 0) {
        //             tourPackage.setTourPackageImages(tourPackageImages);
        //         }
        //
        //         try {
        //             session.beginTransaction();
        //             session.save(tourPackage);
        //             session.getTransaction().commit();
        //
        //             resp.sendRedirect(req.getContextPath() + "/admin/tour-packages.jsp");
        //         } catch (Exception e) {
        //             session.getTransaction().rollback();
        //             req.getRequestDispatcher(req.getContextPath() + "/errors/500.jsp").forward(req, resp);
        //             e.printStackTrace();
        //         }
        //
        //     } catch (Exception e) {
        //         e.printStackTrace();
        //     }
        // }
    }
}

