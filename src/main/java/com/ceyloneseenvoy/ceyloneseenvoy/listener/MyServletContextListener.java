package com.ceyloneseenvoy.ceyloneseenvoy.listener;

import com.ceyloneseenvoy.ceyloneseenvoy.util.EmailUtil;

import javax.mail.MessagingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class MyServletContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            EmailUtil.sendEmail("andruehudson9311@gmail.com", "Application Deployed - Ceylonese Envoy", "Application is being deployed to a server. Date: " + java.time.LocalDate.now() + " Time: " + java.time.LocalTime.now(), "andruehudson9311@gmail.com");
        } catch (MessagingException e) {
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
