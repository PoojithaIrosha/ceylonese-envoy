package com.ceyloneseenvoy.ceyloneseenvoy.util;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;

public class ImageURIUtil {
    public static String convertFileToDataURI(String filepath) {
        try {
            Path filePath = Paths.get(filepath);
            byte[] fileContent = Files.readAllBytes(filePath);
            String base64Content = Base64.getEncoder().encodeToString(fileContent);
            String mimeType = Files.probeContentType(filePath);
            return "data:" + mimeType + ";base64," + base64Content;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
