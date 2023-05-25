package com.ceyloneseenvoy.ceyloneseenvoy.servlet.admin;

import com.ceyloneseenvoy.ceyloneseenvoy.dto.ResponseDTO;
import com.ceyloneseenvoy.ceyloneseenvoy.model.Admin;
import com.ceyloneseenvoy.ceyloneseenvoy.util.EmailUtil;
import com.ceyloneseenvoy.ceyloneseenvoy.util.HibernateUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.hibernate.Session;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/auth/admin/forgot-password")
public class AdminForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        String email = req.getParameter("email");

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            Admin result = session.createQuery("from Admin where email = :email", Admin.class).setParameter("email", email).uniqueResult();

            if (result != null) {
                try {
                    UUID uuid = UUID.randomUUID();

                    String message = "<!DOCTYPE HTML\n" +
                            "  PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" +
                            "<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\"\n" +
                            "  xmlns:o=\"urn:schemas-microsoft-com:office:office\">\n" +
                            "\n" +
                            "<head>\n" +
                            "  <!--[if gte mso 9]>\n" +
                            "<xml>\n" +
                            "  <o:OfficeDocumentSettings>\n" +
                            "    <o:AllowPNG/>\n" +
                            "    <o:PixelsPerInch>96</o:PixelsPerInch>\n" +
                            "  </o:OfficeDocumentSettings>\n" +
                            "</xml>\n" +
                            "<![endif]-->\n" +
                            "  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
                            "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                            "  <meta name=\"x-apple-disable-message-reformatting\">\n" +
                            "  <!--[if !mso]><!-->\n" +
                            "  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->\n" +
                            "  <title></title>\n" +
                            "\n" +
                            "  <style type=\"text/css\">\n" +
                            "    @media only screen and (min-width: 620px) {\n" +
                            "      .u-row {\n" +
                            "        width: 600px !important;\n" +
                            "      }\n" +
                            "\n" +
                            "      .u-row .u-col {\n" +
                            "        vertical-align: top;\n" +
                            "      }\n" +
                            "\n" +
                            "      .u-row .u-col-50 {\n" +
                            "        width: 300px !important;\n" +
                            "      }\n" +
                            "\n" +
                            "      .u-row .u-col-100 {\n" +
                            "        width: 600px !important;\n" +
                            "      }\n" +
                            "\n" +
                            "    }\n" +
                            "\n" +
                            "    @media (max-width: 620px) {\n" +
                            "      .u-row-container {\n" +
                            "        max-width: 100% !important;\n" +
                            "        padding-left: 0px !important;\n" +
                            "        padding-right: 0px !important;\n" +
                            "      }\n" +
                            "\n" +
                            "      .u-row .u-col {\n" +
                            "        min-width: 320px !important;\n" +
                            "        max-width: 100% !important;\n" +
                            "        display: block !important;\n" +
                            "      }\n" +
                            "\n" +
                            "      .u-row {\n" +
                            "        width: 100% !important;\n" +
                            "      }\n" +
                            "\n" +
                            "      .u-col {\n" +
                            "        width: 100% !important;\n" +
                            "      }\n" +
                            "\n" +
                            "      .u-col>div {\n" +
                            "        margin: 0 auto;\n" +
                            "      }\n" +
                            "    }\n" +
                            "\n" +
                            "    body {\n" +
                            "      margin: 0;\n" +
                            "      padding: 0;\n" +
                            "    }\n" +
                            "\n" +
                            "    table,\n" +
                            "    tr,\n" +
                            "    td {\n" +
                            "      vertical-align: top;\n" +
                            "      border-collapse: collapse;\n" +
                            "    }\n" +
                            "\n" +
                            "    p {\n" +
                            "      margin: 0;\n" +
                            "    }\n" +
                            "\n" +
                            "    .ie-container table,\n" +
                            "    .mso-container table {\n" +
                            "      table-layout: fixed;\n" +
                            "    }\n" +
                            "\n" +
                            "    * {\n" +
                            "      line-height: inherit;\n" +
                            "    }\n" +
                            "\n" +
                            "    a[x-apple-data-detectors='true'] {\n" +
                            "      color: inherit !important;\n" +
                            "      text-decoration: none !important;\n" +
                            "    }\n" +
                            "\n" +
                            "    table,\n" +
                            "    td {\n" +
                            "      color: #000000;\n" +
                            "    }\n" +
                            "\n" +
                            "    #u_body a {\n" +
                            "      color: #161a39;\n" +
                            "      text-decoration: underline;\n" +
                            "    }\n" +
                            "  </style>\n" +
                            "\n" +
                            "\n" +
                            "\n" +
                            "  <!--[if !mso]><!-->\n" +
                            "  <link href=\"https://fonts.googleapis.com/css?family=Lato:400,700&display=swap\" rel=\"stylesheet\" type=\"text/css\">\n" +
                            "  <!--<![endif]-->\n" +
                            "\n" +
                            "</head>\n" +
                            "\n" +
                            "<body class=\"clean-body u_body\"\n" +
                            "  style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #f9f9f9;color: #000000\">\n" +
                            "  <!--[if IE]><div class=\"ie-container\"><![endif]-->\n" +
                            "  <!--[if mso]><div class=\"mso-container\"><![endif]-->\n" +
                            "  <table id=\"u_body\"\n" +
                            "    style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #f9f9f9;width:100%\"\n" +
                            "    cellpadding=\"0\" cellspacing=\"0\">\n" +
                            "    <tbody>\n" +
                            "      <tr style=\"vertical-align: top\">\n" +
                            "        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
                            "          <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #f9f9f9;\"><![endif]-->\n" +
                            "\n" +
                            "\n" +
                            "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: #f9f9f9\">\n" +
                            "            <div class=\"u-row\"\n" +
                            "              style=\"Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #f9f9f9;\">\n" +
                            "              <div\n" +
                            "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                            "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: #f9f9f9;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:600px;\"><tr style=\"background-color: #f9f9f9;\"><![endif]-->\n" +
                            "\n" +
                            "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"600\" style=\"width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                            "                <div class=\"u-col u-col-100\"\n" +
                            "                  style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\">\n" +
                            "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                            "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                            "                    <div\n" +
                            "                      style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                            "                      <!--<![endif]-->\n" +
                            "\n" +
                            "                      <table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\"\n" +
                            "                        width=\"100%\" border=\"0\">\n" +
                            "                        <tbody>\n" +
                            "                          <tr>\n" +
                            "                            <td\n" +
                            "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:15px;font-family:'Lato',sans-serif;\"\n" +
                            "                              align=\"left\">\n" +
                            "\n" +
                            "                              <table height=\"0px\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\n" +
                            "                                style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 1px solid #f9f9f9;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
                            "                                <tbody>\n" +
                            "                                  <tr style=\"vertical-align: top\">\n" +
                            "                                    <td\n" +
                            "                                      style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
                            "                                      <span>&#160;</span>\n" +
                            "                                    </td>\n" +
                            "                                  </tr>\n" +
                            "                                </tbody>\n" +
                            "                              </table>\n" +
                            "\n" +
                            "                            </td>\n" +
                            "                          </tr>\n" +
                            "                        </tbody>\n" +
                            "                      </table>\n" +
                            "\n" +
                            "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                            "                    </div><!--<![endif]-->\n" +
                            "                  </div>\n" +
                            "                </div>\n" +
                            "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                            "              </div>\n" +
                            "            </div>\n" +
                            "          </div>\n" +
                            "\n" +
                            "\n" +
                            "\n" +
                            "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                            "            <div class=\"u-row\"\n" +
                            "              style=\"Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;\">\n" +
                            "              <div\n" +
                            "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                            "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:600px;\"><tr style=\"background-color: #ffffff;\"><![endif]-->\n" +
                            "\n" +
                            "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"600\" style=\"width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                            "                <div class=\"u-col u-col-100\"\n" +
                            "                  style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\">\n" +
                            "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                            "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                            "                    <div\n" +
                            "                      style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                            "                      <!--<![endif]-->\n" +
                            "\n" +
                            "                      <table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\"\n" +
                            "                        width=\"100%\" border=\"0\">\n" +
                            "                        <tbody>\n" +
                            "                          <tr>\n" +
                            "                            <td\n" +
                            "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:25px 10px;font-family:'Lato',sans-serif;\"\n" +
                            "                              align=\"left\">\n" +
                            "\n" +
                            "                              <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
                            "                                <tr>\n" +
                            "                                  <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\n" +
                            "\n" +
                            "                                    <img align=\"center\" border=\"0\" src=\"https://i.ibb.co/QPHKntY/CE-Logo.png\"\n" +
                            "                                      alt=\"Image\" title=\"Image\"\n" +
                            "                                      style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 29%;max-width: 168.2px;\"\n" +
                            "                                      width=\"168.2\" />\n" +
                            "\n" +
                            "                                  </td>\n" +
                            "                                </tr>\n" +
                            "                              </table>\n" +
                            "\n" +
                            "                            </td>\n" +
                            "                          </tr>\n" +
                            "                        </tbody>\n" +
                            "                      </table>\n" +
                            "\n" +
                            "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                            "                    </div><!--<![endif]-->\n" +
                            "                  </div>\n" +
                            "                </div>\n" +
                            "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                            "              </div>\n" +
                            "            </div>\n" +
                            "          </div>\n" +
                            "\n" +
                            "\n" +
                            "\n" +
                            "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                            "            <div class=\"u-row\"\n" +
                            "              style=\"Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #161a39;\">\n" +
                            "              <div\n" +
                            "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                            "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:600px;\"><tr style=\"background-color: #161a39;\"><![endif]-->\n" +
                            "\n" +
                            "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"600\" style=\"width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                            "                <div class=\"u-col u-col-100\"\n" +
                            "                  style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\">\n" +
                            "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                            "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                            "                    <div\n" +
                            "                      style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                            "                      <!--<![endif]-->\n" +
                            "\n" +
                            "                      <table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\"\n" +
                            "                        width=\"100%\" border=\"0\">\n" +
                            "                        <tbody>\n" +
                            "                          <tr>\n" +
                            "                            <td\n" +
                            "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:35px 10px 10px;font-family:'Lato',sans-serif;\"\n" +
                            "                              align=\"left\">\n" +
                            "                            </td>\n" +
                            "                          </tr>\n" +
                            "                        </tbody>\n" +
                            "                      </table>\n" +
                            "\n" +
                            "                      <table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\"\n" +
                            "                        width=\"100%\" border=\"0\">\n" +
                            "                        <tbody>\n" +
                            "                          <tr>\n" +
                            "                            <td\n" +
                            "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:0px 10px 30px;font-family:'Lato',sans-serif;\"\n" +
                            "                              align=\"left\">\n" +
                            "\n" +
                            "                              <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">\n" +
                            "                                <p style=\"font-size: 14px; line-height: 140%; text-align: center;\"><span\n" +
                            "                                    style=\"font-size: 28px; line-height: 39.2px; color: #ffffff; font-family: Lato, sans-serif;\">Please\n" +
                            "                                    reset your password </span></p>\n" +
                            "                              </div>\n" +
                            "\n" +
                            "                            </td>\n" +
                            "                          </tr>\n" +
                            "                        </tbody>\n" +
                            "                      </table>\n" +
                            "\n" +
                            "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                            "                    </div><!--<![endif]-->\n" +
                            "                  </div>\n" +
                            "                </div>\n" +
                            "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                            "              </div>\n" +
                            "            </div>\n" +
                            "          </div>\n" +
                            "\n" +
                            "\n" +
                            "\n" +
                            "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                            "            <div class=\"u-row\"\n" +
                            "              style=\"Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;\">\n" +
                            "              <div\n" +
                            "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                            "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:600px;\"><tr style=\"background-color: #ffffff;\"><![endif]-->\n" +
                            "\n" +
                            "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"600\" style=\"width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                            "                <div class=\"u-col u-col-100\"\n" +
                            "                  style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\">\n" +
                            "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                            "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                            "                    <div\n" +
                            "                      style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                            "                      <!--<![endif]-->\n" +
                            "\n" +
                            "                      <table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\"\n" +
                            "                        width=\"100%\" border=\"0\">\n" +
                            "                        <tbody>\n" +
                            "                          <tr>\n" +
                            "                            <td\n" +
                            "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:40px 40px 30px;font-family:'Lato',sans-serif;\"\n" +
                            "                              align=\"left\">\n" +
                            "\n" +
                            "                              <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">\n" +
                            "                                <p style=\"font-size: 14px; line-height: 140%;\"><span\n" +
                            "                                    style=\"font-size: 18px; line-height: 25.2px; color: #666666;\">Hello,</span></p>\n" +
                            "                                <p style=\"font-size: 14px; line-height: 140%;\"> </p>\n" +
                            "                                <p style=\"font-size: 14px; line-height: 140%;\"><span\n" +
                            "                                    style=\"font-size: 18px; line-height: 25.2px; color: #666666;\">We have sent you this\n" +
                            "                                    email in response to your request to reset your password on Ceylonese Envoy.</span>\n" +
                            "                                </p>\n" +
                            "                                <p style=\"font-size: 14px; line-height: 140%;\"> </p>\n" +
                            "                                <p style=\"font-size: 14px; line-height: 140%;\"><span\n" +
                            "                                    style=\"font-size: 18px; line-height: 25.2px; color: #666666;\">To reset your\n" +
                            "                                    password, please follow the link below: </span></p>\n" +
                            "                              </div>\n" +
                            "\n" +
                            "                            </td>\n" +
                            "                          </tr>\n" +
                            "                        </tbody>\n" +
                            "                      </table>\n" +
                            "\n" +
                            "                      <table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\"\n" +
                            "                        width=\"100%\" border=\"0\">\n" +
                            "                        <tbody>\n" +
                            "                          <tr>\n" +
                            "                            <td\n" +
                            "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:0px 40px;font-family:'Lato',sans-serif;\"\n" +
                            "                              align=\"left\">\n" +
                            "\n" +
                            "                              <!--[if mso]><style>.v-button {background: transparent !important;}</style><![endif]-->\n" +
                            "                              <div align=\"left\">\n" +
                            "                                <!--[if mso]><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"http://localhost:8080/CeyloneseEnvoy-1.0-SNAPSHOT/auth/admin/reset-password.jsp?email=" + email + "&uuid=" + uuid.toString() + "\" style=\"height:47px; v-text-anchor:middle; width:177px;\" arcsize=\"2%\"  stroke=\"f\" fillcolor=\"#18163a\"><w:anchorlock/><center style=\"color:#FFFFFF;font-family:'Lato',sans-serif;\"><![endif]-->\n" +
                            "                                <a href=\"http://localhost:8080/CeyloneseEnvoy-1.0-SNAPSHOT/auth/admin/reset-password.jsp?email=" + email + "&uuid=" + uuid.toString() + "\"\n" +
                            "                                  target=\"_blank\" class=\"v-button\"\n" +
                            "                                  style=\"box-sizing: border-box;display: inline-block;font-family:'Lato',sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #18163a; border-radius: 1px;-webkit-border-radius: 1px; -moz-border-radius: 1px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;font-size: 14px;\">\n" +
                            "                                  <span style=\"display:block;padding:15px 40px;line-height:120%;\"><span\n" +
                            "                                      style=\"line-height: 16.8px;\">Reset Password</span></span>\n" +
                            "                                </a>\n" +
                            "                                <!--[if mso]></center></v:roundrect><![endif]-->\n" +
                            "                              </div>\n" +
                            "\n" +
                            "                            </td>\n" +
                            "                          </tr>\n" +
                            "                        </tbody>\n" +
                            "                      </table>\n" +
                            "\n" +
                            "                      <table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\"\n" +
                            "                        width=\"100%\" border=\"0\">\n" +
                            "                        <tbody>\n" +
                            "                          <tr>\n" +
                            "                            <td\n" +
                            "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:40px 40px 30px;font-family:'Lato',sans-serif;\"\n" +
                            "                              align=\"left\">\n" +
                            "\n" +
                            "                              <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">\n" +
                            "                                <p style=\"font-size: 14px; line-height: 140%;\"><span\n" +
                            "                                    style=\"color: #888888; font-size: 14px; line-height: 19.6px;\"><em><span\n" +
                            "                                        style=\"font-size: 16px; line-height: 22.4px;\">Please ignore this email if you\n" +
                            "                                        did not request a password change.</span></em></span><br /><span\n" +
                            "                                    style=\"color: #888888; font-size: 14px; line-height: 19.6px;\"><em><span\n" +
                            "                                        style=\"font-size: 16px; line-height: 22.4px;\"> </span></em></span></p>\n" +
                            "                              </div>\n" +
                            "\n" +
                            "                            </td>\n" +
                            "                          </tr>\n" +
                            "                        </tbody>\n" +
                            "                      </table>\n" +
                            "\n" +
                            "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                            "                    </div><!--<![endif]-->\n" +
                            "                  </div>\n" +
                            "                </div>\n" +
                            "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                            "              </div>\n" +
                            "            </div>\n" +
                            "          </div>\n" +
                            "\n" +
                            "\n" +
                            "\n" +
                            "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                            "            <div class=\"u-row\"\n" +
                            "              style=\"Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #18163a;\">\n" +
                            "              <div\n" +
                            "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                            "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:600px;\"><tr style=\"background-color: #18163a;\"><![endif]-->\n" +
                            "\n" +
                            "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"300\" style=\"width: 300px;padding: 20px 20px 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                            "                <div class=\"u-col u-col-50\"\n" +
                            "                  style=\"max-width: 320px;min-width: 300px;display: table-cell;vertical-align: top;\">\n" +
                            "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                            "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                            "                    <div\n" +
                            "                      style=\"box-sizing: border-box; height: 100%; padding: 20px 20px 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                            "                      <!--<![endif]-->\n" +
                            "\n" +
                            "                      <table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\"\n" +
                            "                        width=\"100%\" border=\"0\">\n" +
                            "                        <tbody>\n" +
                            "                          <tr>\n" +
                            "                            <td\n" +
                            "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:'Lato',sans-serif;\"\n" +
                            "                              align=\"left\">\n" +
                            "\n" +
                            "                              <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">\n" +
                            "                                <p style=\"font-size: 14px; line-height: 140%;\"><span\n" +
                            "                                    style=\"font-size: 16px; line-height: 22.4px; color: #ecf0f1;\">Contact</span></p>\n" +
                            "                                <p style=\"font-size: 14px; line-height: 140%;\"><span\n" +
                            "                                    style=\"color: #ecf0f1; line-height: 19.6px;\">ceyloneseenvoy@gmail.com</span></p>\n" +
                            "                                <p style=\"font-size: 14px; line-height: 140%;\"><span\n" +
                            "                                    style=\"font-size: 14px; line-height: 19.6px; color: #ecf0f1;\">+94 72 123 4566 \n" +
                            "                                    Info@ceyloneseenvoy.com</span></p>\n" +
                            "                              </div>\n" +
                            "\n" +
                            "                            </td>\n" +
                            "                          </tr>\n" +
                            "                        </tbody>\n" +
                            "                      </table>\n" +
                            "\n" +
                            "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                            "                    </div><!--<![endif]-->\n" +
                            "                  </div>\n" +
                            "                </div>\n" +
                            "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"300\" style=\"width: 300px;padding: 0px 0px 0px 20px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                            "                <div class=\"u-col u-col-50\"\n" +
                            "                  style=\"max-width: 320px;min-width: 300px;display: table-cell;vertical-align: top;\">\n" +
                            "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                            "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                            "                    <div\n" +
                            "                      style=\"box-sizing: border-box; height: 100%; padding: 0px 0px 0px 20px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                            "                      <!--<![endif]-->\n" +
                            "\n" +
                            "                      <table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\"\n" +
                            "                        width=\"100%\" border=\"0\">\n" +
                            "                        <tbody>\n" +
                            "                          <tr>\n" +
                            "                            <td\n" +
                            "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:25px 10px 10px;font-family:'Lato',sans-serif;\"\n" +
                            "                              align=\"left\">\n" +
                            "                            </td>\n" +
                            "                          </tr>\n" +
                            "                        </tbody>\n" +
                            "                      </table>\n" +
                            "\n" +
                            "                      <table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\"\n" +
                            "                        width=\"100%\" border=\"0\">\n" +
                            "                        <tbody>\n" +
                            "                          <tr>\n" +
                            "                            <td\n" +
                            "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:5px 10px 10px;font-family:'Lato',sans-serif;\"\n" +
                            "                              align=\"left\">\n" +
                            "\n" +
                            "                              <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">\n" +
                            "                                <p style=\"line-height: 140%; font-size: 14px;\"><span\n" +
                            "                                    style=\"font-size: 14px; line-height: 19.6px;\"><span\n" +
                            "                                      style=\"color: #ecf0f1; font-size: 14px; line-height: 19.6px;\"><span\n" +
                            "                                        style=\"line-height: 19.6px; font-size: 14px;\">Ceylonese Envoy ©  All Rights\n" +
                            "                                        Reserved</span></span></span></p>\n" +
                            "                              </div>\n" +
                            "\n" +
                            "                            </td>\n" +
                            "                          </tr>\n" +
                            "                        </tbody>\n" +
                            "                      </table>\n" +
                            "\n" +
                            "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                            "                    </div><!--<![endif]-->\n" +
                            "                  </div>\n" +
                            "                </div>\n" +
                            "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                            "              </div>\n" +
                            "            </div>\n" +
                            "          </div>\n" +
                            "\n" +
                            "\n" +
                            "\n" +
                            "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: #f9f9f9\">\n" +
                            "            <div class=\"u-row\"\n" +
                            "              style=\"Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #1c103b;\">\n" +
                            "              <div\n" +
                            "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                            "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: #f9f9f9;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:600px;\"><tr style=\"background-color: #1c103b;\"><![endif]-->\n" +
                            "\n" +
                            "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"600\" style=\"width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                            "                <div class=\"u-col u-col-100\"\n" +
                            "                  style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\">\n" +
                            "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                            "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                            "                    <div\n" +
                            "                      style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                            "                      <!--<![endif]-->\n" +
                            "\n" +
                            "                      <table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\"\n" +
                            "                        width=\"100%\" border=\"0\">\n" +
                            "                        <tbody>\n" +
                            "                          <tr>\n" +
                            "                            <td\n" +
                            "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:15px;font-family:'Lato',sans-serif;\"\n" +
                            "                              align=\"left\">\n" +
                            "\n" +
                            "                              <table height=\"0px\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\n" +
                            "                                style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 1px solid #1c103b;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
                            "                                <tbody>\n" +
                            "                                  <tr style=\"vertical-align: top\">\n" +
                            "                                    <td\n" +
                            "                                      style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
                            "                                      <span>&#160;</span>\n" +
                            "                                    </td>\n" +
                            "                                  </tr>\n" +
                            "                                </tbody>\n" +
                            "                              </table>\n" +
                            "\n" +
                            "                            </td>\n" +
                            "                          </tr>\n" +
                            "                        </tbody>\n" +
                            "                      </table>\n" +
                            "\n" +
                            "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                            "                    </div><!--<![endif]-->\n" +
                            "                  </div>\n" +
                            "                </div>\n" +
                            "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                            "              </div>\n" +
                            "            </div>\n" +
                            "          </div>\n" +
                            "\n" +
                            "\n" +
                            "          <!--[if (mso)|(IE)]></td></tr></table><![endif]-->\n" +
                            "        </td>\n" +
                            "      </tr>\n" +
                            "    </tbody>\n" +
                            "  </table>\n" +
                            "  <!--[if mso]></div><![endif]-->\n" +
                            "  <!--[if IE]></div><![endif]-->\n" +
                            "</body>\n" +
                            "\n" +
                            "</html>";


                    session.beginTransaction();
                    try {
                        result.setVerificationCode(uuid.toString());
                        session.update(result);
                        session.getTransaction().commit();
                    } catch (Exception e) {
                        session.getTransaction().rollback();
                        throw new RuntimeException(e);
                    }

                    EmailUtil.sendEmail(email, "Password Reset", message, "ceyloneseenvoy001@gmail.com");
                    resp.getWriter().print(objectMapper.writeValueAsString(new ResponseDTO(true, req.getContextPath() + "/auth/admin/login.jsp")));
                } catch (MessagingException e) {
                    resp.getWriter().print(objectMapper.writeValueAsString(new ResponseDTO(false, "Unable to send email")));
                    throw new RuntimeException("Unable to send email");
                }
            } else {
                resp.getWriter().print(objectMapper.writeValueAsString(new ResponseDTO(false, "Admin not found with the given email")));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
