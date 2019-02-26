package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringReader;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import org.json.JSONArray;
import org.json.JSONObject;

import com.google.api.client.json.Json;
import com.google.api.services.drive.model.File;
import com.google.common.io.Files;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import controller.upload.google.CreateGoogleFile;
import model.Album;
import model.Brano;
import model.Genere;
import model.Utente;
import persistence.DAOFactory;
import persistence.dao.AlbumDao;
import persistence.dao.BranoDao;
import persistence.dao.UtenteDao;
import utility.BranoUtility;

/**
 * Servlet implementation class Test
 */

@WebServlet(urlPatterns = { "/aggiornaAlbum", "/getBraniAlbum","/rimuoviBrano","/svuotaAlbum","/rimuoviAlbum","/rimuoviAlbumVuoti"})
public class GestioneAlbum extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DAOFactory factory = DAOFactory.getDAOFactory(2);
		AlbumDao aDao = factory.getAlbumDAO();
		BranoDao bDao = factory.getBranoDAO();
		String path = req.getServletPath();
		String email=(String) req.getSession().getAttribute("email"); 
		
		if (path.equals("/getBraniAlbum")) {
			int id = Integer.parseInt(req.getParameter("idAlbum"));
			System.out.println("id "+id);
			List<Brano> brani = bDao.findByAlbum(id);
			System.out.println(brani.size());
			JSONArray jsonBrani = new JSONArray();
			for (Brano brano : brani) {
				JSONObject b = new JSONObject();
				b.put("id", brano.getId());
				b.put("titolo", brano.getTitolo());
				b.put("genere", brano.getGenere().getNome());
				b.put("linkYoutube", brano.getLinkVideo());
				jsonBrani.put(b);
			}
			resp.setContentType("application/json");
			resp.setCharacterEncoding("utf-8");
			PrintWriter out = resp.getWriter();
			out.print(jsonBrani.toString());

		}else if(path.equals("/rimuoviBrano")) {
			int id = Integer.parseInt(req.getParameter("idBrano"));
			bDao.delete(id);
		}else if(path.equals("/svuotaAlbum")) {
			int id = Integer.parseInt(req.getParameter("idAlbum"));
			aDao.deleteBraniAlbum(id);
		}else if(path.equals("/aggiornaAlbum")) {
			String brani = req.getParameter("list");
			System.out.println("AGGIORNA ALBUM");
			System.out.println(brani);

			JSONArray list = new JSONArray(brani);
			
			for (int i = 0; i < list.length(); i++) {
				JSONObject obj = list.getJSONObject(i);
				
				int id = Integer.parseInt(obj.get("id").toString().trim());
				int idAlbum = Integer.parseInt(obj.get("idAlbum").toString().trim());
				String titolo = obj.get("titolo").toString().trim();
				String genere = obj.get("genere").toString().trim();
				String link = obj.get("link").toString().trim();
				Album a =  new Album();
				a.setId(idAlbum);
				Utente u = new Utente();
				u.setEmail(email);
				Brano b = new Brano();
				b.setTitolo(titolo);
				b.setAlbum(a);
				b.setGenere(new Genere(genere));
				b.setId(id);
				b.setLinkVideo(link);
				bDao.update(b);
			}
		}else if(path.equals("/rimuoviAlbum")){
			int id = Integer.parseInt(req.getParameter("idAlbum"));
			aDao.delete(id);
		}else if(path.equals("/rimuoviAlbumVuoti")){
			String album = req.getParameter("list");

			System.out.println("ELIMINA ALBUM VUOTI");
			System.out.println(album);
			
			JSONArray list = new JSONArray(album);
			if(list.length()>0) {
				List<Integer> l = new LinkedList<>();
				for (int i = 0; i < list.length(); i++) {
					JSONObject obj = list.getJSONObject(i);
					int id = Integer.parseInt(obj.get("id").toString());
					l.add(id);
					System.out.println(id);
				}
				
				aDao.delete(l);
			}
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = request.getServletPath();
		DAOFactory factory=DAOFactory.getDAOFactory(2);
		AlbumDao aDao=factory.getAlbumDAO();
		BranoDao bDao=factory.getBranoDAO();
		UtenteDao uDao=factory.getUtenteDAO();
		String email=(String) request.getSession().getAttribute("email"); 
		
		if (url.equals("/aggiornaAlbum")) {

			String titoloAlbum = null;
			String immagineAlbum = null;
			String idAlbum = null;
			String linkFlickr = null;
			String path = request.getServletContext().getRealPath("/WEB-INF");
			String applicationPath = request.getServletContext().getRealPath("/WEB-INF");
			String uploadFilePath = applicationPath + java.io.File.separator + "uploads";
			java.io.File fileSaveDir = new java.io.File(uploadFilePath);

			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdirs();
			}

			HashMap<Integer, BranoUtility> map = new HashMap<Integer, BranoUtility>();

			try {
				List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory())
						.parseRequest(new ServletRequestContext(request));

				for (FileItem item : items) {

					String fieldname2 = item.getFieldName();
					System.out.println("--- " + fieldname2);
					if (item.isFormField()) {
						String fieldname = item.getFieldName();
						String fieldvalue = item.getString();
						System.out.println("--- " + fieldname);
						if (fieldname.equals("titoloAlbum")) {
							titoloAlbum = fieldvalue;
						} else if (fieldname.equals("idAlbum")) {
							idAlbum = fieldvalue;
						}else if (fieldname.equals("flickr")) {
							linkFlickr = fieldvalue;
						}else{
							String[] splitted = fieldname.split("-");
							String type = splitted[0];
							Integer key = new Integer(splitted[1]);
							BranoUtility temp = null;
							if (map.containsKey(key)) {
								temp = map.get(key);
							} else {
								temp = new BranoUtility();
							}
							if (type.equals("titolo")) {
								temp.setTitolo(fieldvalue);
							} else if (type.equals("genere")) {
								temp.setGenere(fieldvalue);
							} else if (type.equals("link")) {
								temp.setLinkYoutube(fieldvalue);
							}
							map.put(key, temp);
						}
					} else {
						String fieldname = item.getFieldName();
						String filename = FilenameUtils.getName(item.getName());
						System.out.println(fieldname);
						System.out.println(filename);
						InputStream filecontent = item.getInputStream();
						String link = "";
						if (!filename.equals("")) {

							byte[] buffer = new byte[filecontent.available()];
							filecontent.read(buffer);

							java.io.File uploadFile = new java.io.File(
									uploadFilePath + java.io.File.separator + "targetFile.jpg");
							Files.write(buffer, uploadFile);
							// Create Google File:

							File googleFile = CreateGoogleFile.createGoogleFile(path,
									"1Aa-BeFihSzAH-mjvM_DGO55QqE6rRwUE", item.getContentType(), filename, uploadFile);
							link = "https://drive.google.com/uc?id=" + googleFile.getId();
//						System.out.println("Created Google file!");
//						System.out.println("WebContentLink: " + googleFile.getWebContentLink());
//						System.out.println("WebViewLink: " + googleFile.getWebViewLink());
//
//						System.out.println("Done!");

						}
						/****************************************/
						if (fieldname.equals("albumImage")) {
							immagineAlbum = link;
						} else {
							String[] splitted = fieldname.split("-");
							String type = splitted[0];
							Integer key = new Integer(splitted[1]);
							BranoUtility temp = null;
							if (map.containsKey(key)) {
								temp = map.get(key);
							} else {
								temp = new BranoUtility();
							}
							temp.setLinkDrive(link);

							map.put(key, temp);
						}
					}

				}
			} catch (Exception e) {
			}

			int id;
			Utente u = new Utente();
			u.setEmail(email);
			List<Brano> brani = null;
			
			if(immagineAlbum== null) {
				immagineAlbum = linkFlickr;
			}
			
			if (idAlbum != null) {
				id = Integer.parseInt(idAlbum);
				
				if (immagineAlbum != null) {
					aDao.updateFoto(id, immagineAlbum);
				}
					
			}else {
				String immagine = immagineAlbum;
				if (immagineAlbum == null)
					immagine = "https://drive.google.com/uc?id=1DnuDi-OyAMHLFmm7fP2uPPxkH65sDihS";
				Album album = new Album();
				album.setImmagine(immagine);
				album.setTitolo(titoloAlbum);
				album.setUtenteCaricatore(u);
				id = aDao.save(album);
			}
			Album a = new Album();
			a.setId(id);
			if(map.size()>0)
				brani = new LinkedList<>();
			
			for(Integer i:map.keySet()) {
				BranoUtility b = map.get(i);
				
				brani.add(new Brano(b.getTitolo(),u,"",a,new Genere(b.getGenere()),b.getLinkDrive(),b.getLinkYoutube()));
			}
			if(brani!=null)
				bDao.save(brani);
			String immagine = immagineAlbum;
			if (immagineAlbum == null)
				immagine = "https://drive.google.com/uc?id=1DnuDi-OyAMHLFmm7fP2uPPxkH65sDihS";
			
			JSONArray j = new JSONArray();
			JSONObject json = new JSONObject();
			
			json.put("id", a.getId());
			json.put("link", immagine);
			json.put("titolo", titoloAlbum);
			//response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			j.put(json);
			System.out.println(j.toString());
			out.print(j.toString());
		}
	}

}
