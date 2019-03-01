package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
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
import org.json.JSONObject;

import com.google.api.services.drive.model.File;
import com.google.common.io.Files;

import controller.upload.google.CreateGoogleFile;
import model.Album;
import model.Brano;
import model.PlaylistPrivata;
import model.PlaylistPubblica;
import model.Utente;
import persistence.DAOFactory;
import persistence.UtenteCredenziali;
import persistence.dao.AlbumDao;
import persistence.dao.BranoDao;
import persistence.dao.PlaylistPrivataDao;
import persistence.dao.PlaylistPubblicaDao;
import persistence.dao.UtenteDao;

/**
 * Servlet implementation class gestioneProfilo
 */
@WebServlet(urlPatterns = {"/getProfile","/modificaInformazioni","/seguiUtente",
		"/seguiAlbum","/seguiPlaylist","/unfollowUtente","/unfollowAlbum","/unfollowPlaylist",
		"/inserisciBrano","/cambiaFoto","/getMieiAlbum","/getInformazioniPersonali","/getMiePlaylistPrivate","/getMiePlaylistPubbliche",
		"/addPreferito","/removePreferito","/getPreferenzeBrani","/accountPremium","/diventaPremium"})

public class gestioneProfilo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		String email=(String) req.getSession().getAttribute("email");
		DAOFactory factory=DAOFactory.getDAOFactory(2);
		UtenteDao uDao=factory.getUtenteDAO();
		AlbumDao aDao=factory.getAlbumDAO();
		BranoDao bDao=factory.getBranoDAO();
		PlaylistPubblicaDao pbDao=factory.getPlaylistPubblicaDAO();
		PlaylistPrivataDao prDao=factory.getPlaylistPrivataDAO();
		
		RequestDispatcher rd = null;
		if(path.equals("/getProfile")) {
			UtenteCredenziali u = uDao.findByPrimaryKeyCredential(email);
			System.out.println(u.getFollower());
			System.out.println(u.getNickname());
			System.out.println(u.getDataNascita());
			req.setAttribute("utente", u);

			rd = req.getRequestDispatcher("profile.jsp");
			rd.forward(req, resp);
		}else if(path.equals("/getInformazioniPersonali")) {
			UtenteCredenziali u = uDao.findByPrimaryKeyCredential(email);
			req.setAttribute("utente", u);
			rd = req.getRequestDispatcher("informazioniPersonali.jsp");
			rd.forward(req, resp);
		}else if(path.equals("/getMieiAlbum")) {
			String gestione=req.getParameter("gestione");
			String page="inserisciBrano.jsp";
			if(gestione==null)
				page="mieiAlbum.jsp";
			List<Album> albums=aDao.findByUtenteCaricatore(email);
			req.setAttribute("albums", albums);
			rd = req.getRequestDispatcher(page);
			rd.forward(req, resp);
		}else if(path.equals("/getMiePlaylistPubbliche")) {
			List<PlaylistPubblica> playlists=pbDao.findByUtenteCreatore(email);
			req.setAttribute("playlists", playlists);
			rd = req.getRequestDispatcher("miePlaylistPubbliche.jsp");
			rd.forward(req, resp);
		}else if(path.equals("/getMiePlaylistPrivate")) {
			List<PlaylistPrivata> playlists=prDao.findByUtenteCreatore(email);
			req.setAttribute("playlists", playlists);
			rd = req.getRequestDispatcher("miePlaylistPrivate.jsp");
			rd.forward(req, resp);
		}else if(path.equals("/getPreferenzeBrani")) {
			List<Brano> brani=bDao.getPreferenzeBrani(email);
			req.setAttribute("brani", brani);
			Brano brano=brani.get(0);
			req.setAttribute("brano", brano);	
			rd = req.getRequestDispatcher("braniPreferiti.jsp");
			rd.forward(req, resp);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		String email=(String) req.getSession().getAttribute("email");
		DAOFactory factory=DAOFactory.getDAOFactory(2);
		UtenteDao uDao=factory.getUtenteDAO();
		AlbumDao aDao=factory.getAlbumDAO();
		BranoDao bDao=factory.getBranoDAO();
		PlaylistPrivataDao pPrivDao = factory.getPlaylistPrivataDAO();
		PlaylistPubblicaDao pPubbDao = factory.getPlaylistPubblicaDAO();
		
		if(path.equals("/seguiUtente")) {
			String emailDaSeguire=req.getParameter("id");
			System.out.println(emailDaSeguire);
			uDao.seguiUtente(email, emailDaSeguire);
		}else if(path.equals("/seguiAlbum")) {
			int id=Integer.parseInt(req.getParameter("id"));
			uDao.seguiAlbum(email, id);
		}else if(path.equals("/seguiPlaylist")) {
			int id=Integer.parseInt(req.getParameter("id"));
			uDao.seguiPlaylist(email, id);
		}
		else if(path.equals("/unfollowUtente")) {
			String emailDaNonSeguire=req.getParameter("id");
			uDao.unfollowUtente(email, emailDaNonSeguire);
		}else if(path.equals("/unfollowAlbum")) {
			int id=Integer.parseInt(req.getParameter("id"));
			uDao.unfollowAlbum(email, id);
		}else if(path.equals("/unfollowPlaylist")) {
			int id=Integer.parseInt(req.getParameter("id"));
			uDao.unfollowPlaylist(email, id);
		}else if(path.equals("/modificaInformazioni")) {
			String jsonReceived = "";
			BufferedReader reader = new BufferedReader(new InputStreamReader(req.getInputStream()));
			String line = reader.readLine();
			while (line != null) {
				jsonReceived = jsonReceived + line + "\n";
				line = reader.readLine();
			}

			JSONObject json = new JSONObject(jsonReceived);
			String first_name = json.getString("name");
			String last_name = json.getString("surname");
			String date = json.getString("date");
			String psw = json.getString("password");
			String premium = json.getString("premium");
			req.getSession().setAttribute("name", first_name);
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ITALIAN);
			try {
				Date dataNascita = format.parse(date);
				Utente u = new Utente(email, first_name, last_name, dataNascita);
				if(premium.equals("true")) {
					u.setPremium(true);
				}
				uDao.update(u);
				uDao.setPassword(u, psw);
			} catch (ParseException e) {
				e.printStackTrace();
			}

		}else if(path.equals("/cambiaFoto")) {
			cambiaFoto(req,email,uDao);
		}else if(path.equals("/addPreferito")) {
			int id=Integer.parseInt(req.getParameter("id"));
			uDao.addPreferiti(email, id);
		}else if(path.equals("/removePreferito")) {
			int id=Integer.parseInt(req.getParameter("id"));
			uDao.removePreferiti(email, id);
		}else if(path.equals("/accountPremium")) {
			Utente u = uDao.findByPrimaryKey(email, false, false, false);
			
			System.out.println("PREMIUM "+u.isPremium());
			if(u.isPremium()) {
				//DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				Calendar cal = Calendar.getInstance();
				long t = u.getScadenzaPremium().getTime()-cal.getTime().getTime();
		        //System.out.println(sdf.format(u.getScadenzaPremium().getTime()-cal.getTime().getTime()));
				t/=1000;
				System.out.println(t);
				RequestDispatcher rd = req.getRequestDispatcher("accountPremium.jsp");
				req.setAttribute("time", t);
				rd.forward(req, resp);
			}else {
				RequestDispatcher rd = req.getRequestDispatcher("premium.jsp");
				rd.forward(req, resp);
			}
			
			
		}else if(path.equals("/diventaPremium")) {
			uDao.becomePremium(email);
			Utente u = uDao.findByPrimaryKey(email, false, false, false);
			Calendar cal = Calendar.getInstance();
			long t = u.getScadenzaPremium().getTime()-cal.getTime().getTime();
			t/=1000;
			req.setAttribute("time", t);
			RequestDispatcher rd = req.getRequestDispatcher("accountPremium.jsp");
			rd.forward(req, resp);
		}
	}

	
	public void cambiaFoto(HttpServletRequest request,String email,UtenteDao uDao) {
		String path = request.getServletContext().getRealPath("/WEB-INF");
		String applicationPath = request.getServletContext().getRealPath("/WEB-INF");
		String uploadFilePath = applicationPath + java.io.File.separator + "uploads";
		java.io.File fileSaveDir = new java.io.File(uploadFilePath);

		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdirs();
		}

		try {
			String immagineProfilo;
			List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory())
					.parseRequest(new ServletRequestContext(request));
			FileItem item=items.get(0);
			if (!item.isFormField()) {
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

				}
				/****************************************/
				if (fieldname.equals("immagineProfilo")) {
					immagineProfilo = link;
					Utente utente=new Utente();
					utente.setEmail(email);
					utente.setImmagine(immagineProfilo);
					uDao.updateFoto(utente);

				} 			
			}

			
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	 
	
	
}
