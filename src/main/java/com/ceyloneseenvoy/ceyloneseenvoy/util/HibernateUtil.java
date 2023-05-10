package com.ceyloneseenvoy.ceyloneseenvoy.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

    private static SessionFactory SESSION_FACTORY;

    public static SessionFactory getSessionFactory() {
        if (SESSION_FACTORY == null)
            SESSION_FACTORY = new Configuration().configure().buildSessionFactory();
        return SESSION_FACTORY;
    }

}
