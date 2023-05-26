package com.ceyloneseenvoy.ceyloneseenvoy.util;


import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Date;
import java.util.Properties;

public class EmailUtil {

    public static void sendEmail(String toAddress, String subject, String message, String replyAddress) throws AddressException, MessagingException {

        // sets SMTP server properties
        Properties properties = new Properties();
        PropertiesUtil instance = PropertiesUtil.getInstance();
        properties.put("mail.smtp.host", instance.getProperty("smtp.host"));
        properties.put("mail.smtp.port", instance.getProperty("smtp.port"));
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(instance.getProperty("smtp.email"), instance.getProperty("smtp.password"));
            }
        };

        Session session = Session.getInstance(properties, auth);

        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(instance.getProperty("smtp.email")));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toAddress));
        msg.setReplyTo(InternetAddress.parse(replyAddress));
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setContent(message, "text/html");

        // sends the e-mail
        Transport.send(msg);
    }
}
