package com.ceyloneseenvoy.ceyloneseenvoy.listener;

import com.ceyloneseenvoy.ceyloneseenvoy.util.EmailUtil;
import com.ceyloneseenvoy.ceyloneseenvoy.util.GenerateCustomToken;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

import javax.mail.MessagingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.io.IOException;
import java.io.InputStream;

@WebListener
public class MyServletContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            EmailUtil.sendEmail("andruehudson9311@gmail.com", "Application Deployed - Ceylonese Envoy", "Application is being deployed to a server. Date: " + java.time.LocalDate.now() + " Time: " + java.time.LocalTime.now(), "andruehudson9311@gmail.com");

            InputStream adminSdkJson = MyServletContextListener.class.getClassLoader().getResourceAsStream("test-project-adminsdk.json");

            FirebaseOptions options = new FirebaseOptions.Builder()
                    .setCredentials(GoogleCredentials.fromStream(adminSdkJson))
                    .setServiceAccountId("firebase-adminsdk-jgc5f@test-project-a74b6.iam.gserviceaccount.com")
                    .setDatabaseUrl("https://test-project-a74b6-default-rtdb.firebaseio.com")
                    .build();

            FirebaseApp.initializeApp(options);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            EmailUtil.sendEmail("andruehudson9311@gmail.com", "Application Undeployed - Ceylonese Envoy", "Application is just undeployed. Date: " + java.time.LocalDate.now() + " Time: " + java.time.LocalTime.now(), "andruehudson9311@gmail.com");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
