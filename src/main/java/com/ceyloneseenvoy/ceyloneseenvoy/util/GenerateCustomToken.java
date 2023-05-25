package com.ceyloneseenvoy.ceyloneseenvoy.util;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord;

import java.io.*;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

public class GenerateCustomToken {

    public static String generateToken() throws FirebaseAuthException, IOException, NoSuchAlgorithmException {
        String uid = "1a5b9a16-e034-4866-97f5-61e5c823f6b1";
        return FirebaseAuth.getInstance().createCustomToken(uid);
    }
}
