package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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

public class Home extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email=(String) req.getSession().getAttribute("email");
		
		
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		UtenteDao uDao=factory.getUtenteDAO();
		PlaylistPubblicaDao pbDao=factory.getPlaylistPubblicaDAO();
		AlbumDao aDao=factory.getAlbumDAO();
		BranoDao bDao=factory.getBranoDAO();
		
		Utente utente=uDao.findByPrimaryKey(email, true, true, true);
		
		if(utente==null)
			System.out.println("null");
		List<Utente> utentiPiuSeguiti=uDao.utentiPiuSeguiti(6);
//		System.out.println("utentiPiuSeguiti "+utentiPiuSeguiti.size());
		List<Album> albumPiuSeguiti=aDao.albumPiuSeguiti(6);
//		System.out.println("albumPiuSeguiti "+albumPiuSeguiti.size());
		List<Album> albumRecenti=aDao.getChronOrder(7);
//		System.out.println("albumRecenti "+albumRecenti.size());
		List<PlaylistPubblica> playlistPiuSeguiti=pbDao.playlistPiuSeguiti(6);
//		System.out.println("playlistPiuSeguiti "+playlistPiuSeguiti.size());
		
		List<Brano> ultimiBraniInseriti=bDao.getChronOrder(7);
		
			
		for(Utente u:utentiPiuSeguiti)
			for(Utente us:utente.getUtentiSeguiti())
				if(u.getEmail().equals(us.getEmail())) {
					u.setSeguito(true);
				}
		
		for(Album u:albumPiuSeguiti)
			for(Album a:utente.getAlbumSeguiti())
				if(a.getId() == u.getId()) {
					u.setSeguito(true);
				}
		for(Album u:albumRecenti)
			for(Album a:utente.getAlbumSeguiti())
				if(a.getId() == u.getId()) {
					u.setSeguito(true);
					
				}
		for(PlaylistPubblica u:playlistPiuSeguiti)
			for(PlaylistPubblica p:utente.getPlaylistSeguite())
				if(p.getId() == u.getId())
					u.setSeguito(true);
			
		
		req.setAttribute("utentiPiuSeguiti", utentiPiuSeguiti);
		req.setAttribute("ultimiBraniInseriti", ultimiBraniInseriti);
		req.setAttribute("albumPiuSeguiti", albumPiuSeguiti);
		req.setAttribute("playlist", playlistPiuSeguiti);
		req.setAttribute("albumRecenti", albumRecenti);
		
		
		RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
		rd.forward(req, resp);

	}

}
