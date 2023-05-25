package com.ceyloneseenvoy.ceyloneseenvoy.servlet.customer;

import com.ceyloneseenvoy.ceyloneseenvoy.util.GenerateCustomToken;
import com.google.firebase.auth.FirebaseAuthException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet("/generate-custom-token")
public class GenerateCustomTokenServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String token = GenerateCustomToken.generateToken();
            resp.getWriter().write(token);
        } catch (FirebaseAuthException | NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
