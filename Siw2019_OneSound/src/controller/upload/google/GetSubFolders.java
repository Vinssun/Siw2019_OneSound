package controller.upload.google;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.FileList;
 
public class GetSubFolders {
 
    // com.google.api.services.drive.model.File
    public static final List<File> getGoogleSubFolders(String path,String googleFolderIdParent) throws IOException {
 
        Drive driveService = GoogleDriveUtils.getDriveService(path);
 
        String pageToken = null;
        List<File> list = new ArrayList<File>();
 
        String query = null;
        if (googleFolderIdParent == null) {
            query = " mimeType = 'application/vnd.google-apps.folder' " //
                    + " and 'root' in parents";
        } else {
            query = " mimeType = 'application/vnd.google-apps.folder' " //
                    + " and '" + googleFolderIdParent + "' in parents";
        }
 
        do {
            FileList result = driveService.files().list().setQ(query).setSpaces("drive") //
                    // Fields will be assigned values: id, name, createdTime
                    .setFields("nextPageToken, files(id, name, createdTime)")//
                    .setPageToken(pageToken).execute();
            for (File file : result.getFiles()) {
                list.add(file);
            }
            pageToken = result.getNextPageToken();
        } while (pageToken != null);
        //
        return list;
    }
 
    // com.google.api.services.drive.model.File
    public static final List<File> getGoogleRootFolders(String path) throws IOException {
        return getGoogleSubFolders(path,null);
    }
 
    public static void main(String[] args) throws IOException {
 
        List<File> googleRootFolders = getGoogleRootFolders("");
        for (File folder : googleRootFolders) {
 
            System.out.println("Folder ID: " + folder.getId() + " --- Name: " + folder.getName());
        }
    }
 
}