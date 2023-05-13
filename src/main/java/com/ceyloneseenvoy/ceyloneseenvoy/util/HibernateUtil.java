package com.ceyloneseenvoy.ceyloneseenvoy.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

    private static SessionFactory SESSION_FACTORY;

    public static SessionFactory getSessionFactory() {
        if (SESSION_FACTORY == null) {
            PropertiesUtil instance = PropertiesUtil.getInstance();

            Configuration configuration = new Configuration();
            configuration.setProperty("hibernate.connection.url", instance.getProperty("db.url"));
            configuration.setProperty("hibernate.connection.username", instance.getProperty("db.username"));
            configuration.setProperty("hibernate.connection.password", instance.getProperty("db.password"));
            configuration.setProperty("hibernate.connection.driver_class", instance.getProperty("db.driver"));
            configuration.setProperty("hibernate.dialect", instance.getProperty("db.dialect"));
            SESSION_FACTORY = configuration.configure().buildSessionFactory();
        }

        return SESSION_FACTORY;
    }

}
