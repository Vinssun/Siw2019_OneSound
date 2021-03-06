package controller.upload.google;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;

public class GoogleDriveUtils extends HttpServlet{

   private static final String APPLICATION_NAME = "Google Drive API Java Quickstart";

   private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
   ServletContext context = getServletContext();
   String fullPath = context.getRealPath("/WEB-INF");
   // Directory to store user credentials for this application.
   private static final java.io.File CREDENTIALS_FOLDERr//
           = new java.io.File(System.getProperty("user.home"), "credentials");

   private static final String CLIENT_SECRET_FILE_NAME = "client_secret.json";

   private static final List<String> SCOPES = Collections.singletonList(DriveScopes.DRIVE);

   // Global instance of the {@link FileDataStoreFactory}.
   private static FileDataStoreFactory DATA_STORE_FACTORY;

   // Global instance of the HTTP transport.
   private static HttpTransport HTTP_TRANSPORT;

   private static Drive _driveService;

   static {
       try {
           HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
           DATA_STORE_FACTORY = null;
       } catch (Throwable t) {
           t.printStackTrace();
           System.exit(1);
       }
   }

   public static Credential getCredentials(String path) throws IOException {
	   java.io.File CREDENTIALS_FOLDER = new java.io.File(path);
       java.io.File clientSecretFilePath = new java.io.File(CREDENTIALS_FOLDER, CLIENT_SECRET_FILE_NAME);
       DATA_STORE_FACTORY = new FileDataStoreFactory(CREDENTIALS_FOLDER);
       if (!clientSecretFilePath.exists()) {
           throw new FileNotFoundException("Please copy " + CLIENT_SECRET_FILE_NAME //
                   + " to folder: " + CREDENTIALS_FOLDER.getAbsolutePath());
       }

       InputStream in = new FileInputStream(clientSecretFilePath);

       GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

       // Build flow and trigger user authorization request.
       GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(HTTP_TRANSPORT, JSON_FACTORY,
               clientSecrets, SCOPES).setDataStoreFactory(DATA_STORE_FACTORY).setAccessType("offline").build();
       Credential credential = new AuthorizationCodeInstalledApp(flow, new LocalServerReceiver()).authorize("user");

       return credential;
   }

   public static Drive getDriveService(String path) throws IOException {
       if (_driveService != null) {
           return _driveService;
       }
       Credential credential = getCredentials(path);
       //
       _driveService = new Drive.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential) //
               .setApplicationName(APPLICATION_NAME).build();
       return _driveService;
   }

}