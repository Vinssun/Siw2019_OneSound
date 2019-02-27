package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

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
import org.json.JSONArray;
import org.json.JSONObject;

import com.google.api.services.drive.model.File;
import com.google.common.io.Files;

import controller.upload.google.CreateGoogleFile;
import model.Brano;
import model.PlaylistPrivata;
import model.PlaylistPubblica;
import model.Utente;
import persistence.DAOFactory;
import persistence.dao.BranoDao;
import persistence.dao.PlaylistPrivataDao;
import persistence.dao.PlaylistPubblicaDao;

/**
 * Servlet implementation class GestionePlaylist
 */
@WebServlet(urlPatterns = { "/aggiungiBranoPl", "/rimuoviBranoPl", "/addPlaylistPrivata", "/addPlaylistPubblica",
		"/eliminaPlaylist","/getBraniPlaylistPb","/getBraniPlaylistPr"})
public class GestionePlaylist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String path = req.getServletPath();
		DAOFactory factory=DAOFactory.getDAOFactory(2);
		PlaylistPubblicaDao pbDao=factory.getPlaylistPubblicaDAO();
		BranoDao bDao=factory.getBranoDAO();
		RequestDispatcher rd = null;
		String email=(String) req.getSession().getAttribute("email"); 
		
		if (path.equals("/getBraniPlaylistPb")) {
			int id =Integer.parseInt(req.getParameter("idPlaylist"));
			String nome = req.getParameter("nome");
			String immagine =req.getParameter("immagine");
			Brano brano=null;
			List<Brano> brani=bDao.findByPlaylistPubblica(id);
			
			
			req.setAttribute("brani", brani);
			if(!brani.isEmpty())
				brano=brani.get(0);
			
			req.setAttribute("idPlaylist", id);
			req.setAttribute("nome", nome);
			req.setAttribute("immagine", immagine);
			req.setAttribute("brano", brano);
			
			rd = req.getRequestDispatcher("braniPlaylistPb.jsp");
			rd.forward(req, res);
		}else if(path.equals("/getBraniPlaylistPr")) {
			int id =Integer.parseInt(req.getParameter("idPlaylist"));
			String nome = req.getParameter("nome");
			String immagine =req.getParameter("immagine");
			Brano brano=null;
			List<Brano> brani=bDao.findByPlaylistPrivata(id);
			
			req.setAttribute("brani", brani);
			System.out.println("Size "+brani.size());
			if(!brani.isEmpty())
				brano=brani.get(0);
			
			req.setAttribute("idPlaylist", id);
			req.setAttribute("nome", nome);
			req.setAttribute("immagine", immagine);
			req.setAttribute("brano", brano);
			
			rd = req.getRequestDispatcher("braniPlaylistPr.jsp");
			rd.forward(req, res);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DAOFactory factory = DAOFactory.getDAOFactory(2);
		PlaylistPubblicaDao pbDao = factory.getPlaylistPubblicaDAO();
		PlaylistPrivataDao prDao = factory.getPlaylistPrivataDAO();
		String path = request.getServletPath();

		String email = (String) request.getSession().getAttribute("email");
		if (path.equals("/aggiungiBranoPl")) {
			String tipo = request.getParameter("tipo");
			System.out.println(tipo);
			int idPlaylist = Integer.parseInt(request.getParameter("idPlaylist"));
			int idBrano = Integer.parseInt(request.getParameter("brano"));
			System.out.println(idPlaylist);
			System.out.println(idBrano);
			if (tipo.equals("pb")) {
				pbDao.addBrano(idPlaylist, idBrano);
			} else if (tipo.equals("pr")) {
				prDao.addBrano(idPlaylist, idBrano);
			}

		} else if (path.equals("/rimuoviBranoPl")) {
			String tipo = request.getParameter("tipo");
			int idPlaylist = Integer.parseInt(request.getParameter("idPlaylist"));
			int idBrano = Integer.parseInt(request.getParameter("brano"));
			System.out.println("TIPO:"+tipo);
			if (tipo.equals("pb")) {
				System.out.println("pubblica");
				pbDao.removeBrano(idPlaylist, idBrano);
			} else if (tipo.equals("pr")) {
				System.out.println("privata");
				prDao.removeBrano(idPlaylist, idBrano);
			}

		} else if (path.equals("/eliminaPlaylist")) {
			String tipo = request.getParameter("tipo");
			int idPlaylist = Integer.parseInt(request.getParameter("idPlaylist"));
			if (tipo.equals("pb")) {
				pbDao.delete(idPlaylist);
				;
			} else if (tipo.equals("pr")) {
				prDao.delete(idPlaylist);
			}

		} else if (path.equals("/addPlaylistPrivata")) {
			creaAggiornaPlaylist(request, response, email, prDao, null);

		} else if (path.equals("/addPlaylistPubblica")) {
			creaAggiornaPlaylist(request, response, email, null, pbDao);

		}
	}

	public void creaAggiornaPlaylist(HttpServletRequest request, HttpServletResponse response, String email,
			PlaylistPrivataDao privDao, PlaylistPubblicaDao pubbDao) throws IOException {
		String path = request.getServletContext().getRealPath("/WEB-INF");
		String applicationPath = request.getServletContext().getRealPath("/WEB-INF");
		String uploadFilePath = applicationPath + java.io.File.separator + "uploads";
		java.io.File fileSaveDir = new java.io.File(uploadFilePath);

		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdirs();
		}
		String titolo = null;
		String idPlaylist = null;
		String playlistImage = null;

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
					if (fieldname.equals("titolo")) {
						titolo = fieldvalue;
					} else if (fieldname.equals("idPlaylist")) {
						idPlaylist = fieldvalue;
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

						File googleFile = CreateGoogleFile.createGoogleFile(path, "1Aa-BeFihSzAH-mjvM_DGO55QqE6rRwUE",
								item.getContentType(), filename, uploadFile);
						link = "https://drive.google.com/uc?id=" + googleFile.getId();
//					System.out.println("Created Google file!");
//					System.out.println("WebContentLink: " + googleFile.getWebContentLink());
//					System.out.println("WebViewLink: " + googleFile.getWebViewLink());
//
//					System.out.println("Done!");

					}
					/****************************************/
					if (fieldname.equals("playlistImage")) {
						playlistImage = link;
					}
				}

			}
		} catch (Exception e) {
		}

		int id;
		if (idPlaylist != null) {
			id = Integer.parseInt(idPlaylist);
			if (playlistImage != null) {
				if (privDao != null) {
					privDao.updateFoto(id, playlistImage);
				} else {
					pubbDao.updateFoto(id, playlistImage);
				}
			}
		} else {

			if (playlistImage == null) {
				playlistImage = "https://drive.google.com/uc?id=1rbe9D90yw77cZvAtlFMyrkIN-HZgHBYZ";
			}
			Utente u = new Utente();
			u.setEmail(email);
			if (privDao != null) {
				PlaylistPrivata p = new PlaylistPrivata();

				p.setUtente(u);
				p.setImmagine(playlistImage);
				p.setNome(titolo);
				id = privDao.save(p);
			} else {
				PlaylistPubblica p = new PlaylistPubblica();
				p.setUtente(u);
				p.setImmagine(playlistImage);
				p.setNome(titolo);
				id = pubbDao.save(p);
			}

			JSONArray j = new JSONArray();
			JSONObject json = new JSONObject();

			json.put("id", id);
			json.put("link", playlistImage);
			json.put("titolo", titolo);
			// response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			j.put(json);
			System.out.println(j.toString());
			out.print(j.toString());
		}
	}

}
