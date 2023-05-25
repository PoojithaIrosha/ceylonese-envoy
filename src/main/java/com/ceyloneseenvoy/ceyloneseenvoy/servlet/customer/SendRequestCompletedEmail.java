package com.ceyloneseenvoy.ceyloneseenvoy.servlet.customer;

import com.ceyloneseenvoy.ceyloneseenvoy.dto.ResponseDTO;
import com.ceyloneseenvoy.ceyloneseenvoy.util.EmailUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SendRequestCompletedEmail", urlPatterns = {"/request-completed-email"})
public class SendRequestCompletedEmail extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        String email = req.getParameter("email");
        String name = req.getParameter("name");

        try {
            EmailUtil.sendEmail(email, "Request Completed", "Dear " + name + ",<br/><br/>Your request has been completed.<br/><br/>Thank you,<br/>Ceylonese Envoy", "ceyloneseenvoy001@gmail.com");

            resp.getWriter().print(mapper.writeValueAsString(ResponseDTO.builder().status(true).message("Email sent successfully").build()));
        } catch (Exception e) {
            resp.getWriter().print(mapper.writeValueAsString(ResponseDTO.builder().status(false).message("Something went wrong").build()));
            e.printStackTrace();
        }
    }
}
