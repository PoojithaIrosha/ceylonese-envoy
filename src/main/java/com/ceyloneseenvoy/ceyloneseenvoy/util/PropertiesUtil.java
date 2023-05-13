package com.ceyloneseenvoy.ceyloneseenvoy.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtil {
    private static final PropertiesUtil INSTANCE = new PropertiesUtil();
    private final Properties properties;

    private PropertiesUtil() {
        properties = new Properties();
        try (InputStream inputStream = PropertiesUtil.class.getClassLoader().getResourceAsStream("application.properties")) {
            properties.load(inputStream);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static PropertiesUtil getInstance() {
        return INSTANCE;
    }

    public String getProperty(String property) {
        return properties.getProperty(property);
    }
}
