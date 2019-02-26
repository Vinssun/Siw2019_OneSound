package controller.upload;
import controller.upload.google.FindFilesByName;
import controller.upload.google.GetSubFoldersByName;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.api.services.drive.model.File;

@WebServlet("/download")
public class DownloadImage extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<File> rootGoogleFolders = FindFilesByName.getGoogleFilesByName("","targetFile.jpg");
		for (File folder : rootGoogleFolders) {
			//java.io.File f = new java.io.File(folder.getWebContentLink());
			System.out.println(folder.getId());

			req.setAttribute("path", "https://drive.google.com/uc?id="+folder.getId());
			System.out.println("Mime Type: " + folder.getMimeType() + " --- Name: " + folder.getName());
		}

		System.out.println("Done!");

		
		RequestDispatcher rd = req.getRequestDispatcher("test.jsp");
		rd.forward(req, resp);

	}
}
