package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Album;
import model.Brano;
import model.PlaylistPubblica;
import model.Utente;
import persistence.DAOFactory;
import persistence.dao.AlbumDao;
import persistence.dao.BranoDao;
import persistence.dao.PlaylistPubblicaDao;
import persistence.dao.UtenteDao;

/**
 * Servlet implementation class Ricerca
 */
@WebServlet(urlPatterns = { "/effettuaRicerca","/getCanzoniAlbum","/getCanzoniPlaylistPb","/getArtista","/getAlbumSeguiti","/getPlaylistSeguite","/getArtistiSeguiti"
		,"/getCanzoniGenere"})
public class Ricerca extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		DAOFactory factory=DAOFactory.getDAOFactory(2);
		PlaylistPubblicaDao pbDao=factory.getPlaylistPubblicaDAO();
		AlbumDao aDao=factory.getAlbumDAO();
		BranoDao bDao=factory.getBranoDAO();
		UtenteDao uDao=factory.getUtenteDAO();
		String email=(String) req.getSession().getAttribute("email"); 
		RequestDispatcher rd = null;
		if(path.equals("/effettuaRicerca")) {
			String nome = req.getParameter("nome");
			String n = "";
			String regex = "^\\s+";
			nome = nome.replaceAll(regex, "");
			regex = "\\s+$";
			nome = nome.replaceAll(regex, "");
			String[] a = nome.split("\\s+");
			for (int i = 0; i < a.length; i++) {
				if (i != a.length - 1)
					n += a[i] + "|";
				else {
					n += "" + a[i];
				}
			}

			if (a.length == 1)
				n = a[0];
			
			List<Brano> brani=bDao.findByName(n);
			List<Album> albums=aDao.findByName(n);
			List<PlaylistPubblica> playlists=pbDao.findByName(n);
			List<Utente> artisti=uDao.findByName(n);
			
			Utente utente=uDao.findByPrimaryKey(email, true, true, true);
			
			for(Utente u:artisti)
				for(Utente us:utente.getUtentiSeguiti())
					if(u.getEmail().equals(us.getEmail())) {
						u.setSeguito(true);
					}
			
			for(Album u:albums)
				for(Album ar:utente.getAlbumSeguiti())
					if(ar.getId() == u.getId()) {
						u.setSeguito(true);
					}
			
			for(PlaylistPubblica u:playlists)
				for(PlaylistPubblica p:utente.getPlaylistSeguite())
					if(p.getId() == u.getId())
						u.setSeguito(true);

			
			checkPreferito(brani, bDao.getPreferenzeBrani(email));
			req.setAttribute("brani", brani);
			req.setAttribute("albums", albums);
			req.setAttribute("playlists", playlists);
			req.setAttribute("artisti", artisti);
			rd = req.getRequestDispatcher("risultatiRicerca.jsp");
			rd.forward(req, resp);

		}else if(path.equals("/getCanzoniAlbum")) {
			int id =Integer.parseInt(req.getParameter("idAlbum"));
			String idCanzoneStr=req.getParameter("idCanzone");
			List<Brano> brani=bDao.findByAlbum(id);
			Brano brano=null;
			if(idCanzoneStr!=null) {
				int idCanzone=Integer.parseInt(idCanzoneStr);	
				for(Brano b:brani)
					if(b.getId()==idCanzone){
						brano=b;
						break;
					}

			}else {
				if(!brani.isEmpty())
					brano=brani.get(0);
			}
			
			checkPreferito(brani, bDao.getPreferenzeBrani(email));
			
			System.out.println(brani.size());
			System.out.println(brano);
			req.setAttribute("brani", brani);
			req.setAttribute("brano", brano);
			rd = req.getRequestDispatcher("newMediaPlayer.jsp");
			rd.forward(req, resp);
			
		}else if(path.equals("/getCanzoniPlaylistPb")) {
			int id =Integer.parseInt(req.getParameter("idPlaylistPb"));
			Brano brano=null;
			List<Brano> brani=bDao.findByPlaylistPubblica(id);
			PlaylistPubblica p = pbDao.findByPrimaryKey(id);
			checkPreferito(brani, bDao.getPreferenzeBrani(email));
			req.setAttribute("brani", brani);
			if(!brani.isEmpty())
				brano=brani.get(0);
			
			req.setAttribute("idPlaylist", id);
			req.setAttribute("playlist", p);
			req.setAttribute("brano", brano);
			
			rd = req.getRequestDispatcher("newMediaPlayerPlaylist.jsp");
			rd.forward(req, resp);
			
		}else if(path.equals("/getArtista")) {
			String emailArtista=req.getParameter("emailArtista");
			Utente artista = uDao.findByPrimaryKey(emailArtista, false, false, false);
			List<Album> albums=aDao.findByUtenteCaricatore(emailArtista);
			List<PlaylistPubblica> playlists=pbDao.findByUtenteCreatore(emailArtista);
			req.setAttribute("albums", albums);
			req.setAttribute("artista", artista);
			req.setAttribute("playlists", playlists);
			rd = req.getRequestDispatcher("profiloArtista.jsp");
			rd.forward(req, resp);
		}
		
		/*
		 * 
		 * DA VALUTARE SE SERVE CHIAMARLI INDIVIDUALMENTE O PRENDERE DIRETTAMENTE QUELLI DALLA SESSION
		 */
		
		else if(path.equals("/getAlbumSeguiti")) {
			List<Album> albums=aDao.getAlbumSeguiti(email);
			req.setAttribute("albums", albums);
			rd = req.getRequestDispatcher("albumSeguiti.jsp");
			rd.forward(req, resp);
			
		}
		else if(path.equals("/getPlaylistSeguite")) {
			List<PlaylistPubblica> playlists=pbDao.getPlaylistSeguite(email);
			req.setAttribute("playlists", playlists);
			rd = req.getRequestDispatcher("playlistSeguite.jsp");
			rd.forward(req, resp);
			
		}
		else if(path.equals("/getArtistiSeguiti")) {
			List<Utente> artisti=uDao.getArtistiSeguiti(email);
			req.setAttribute("artisti", artisti);
			rd = req.getRequestDispatcher("artistiSeguiti.jsp");
			rd.forward(req, resp);
		}else if(path.equals("/getCanzoniGenere")) {
			String genere=req.getParameter("nome");
			List<Brano> brani=bDao.findByGenere(genere);
			System.out.println(email);
			checkPreferito(brani, bDao.getPreferenzeBrani(email));
			req.setAttribute("brani", brani);
			rd = req.getRequestDispatcher("risultatiGenere.jsp");
			rd.forward(req, resp);
		}
		
	}

	
	
	public void checkPreferito(List<Brano> brani,List<Brano> braniPreferiti) {
		for(Brano u:brani)
			for(Brano b:braniPreferiti)
				if(b.getId() == u.getId()) {
					u.setPreferito(true);
					
				}
	}
	
}
