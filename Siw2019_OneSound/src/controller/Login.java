package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PlaylistPrivata;
import model.PlaylistPubblica;
import persistence.DAOFactory;
import persistence.UtenteCredenziali;
import persistence.dao.PlaylistPrivataDao;
import persistence.dao.PlaylistPubblicaDao;
import persistence.dao.UtenteDao;


@WebServlet(urlPatterns = { "/getLogin", "/checkLogin"})
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		String email = (String) req.getSession().getAttribute("email");
		String logout = req.getParameter("logout");
		if ((logout != null) && logout.equals("true")) {
			req.getSession().invalidate();
			resp.sendRedirect("home");
		    return;
		} else {
			if (email == null) {
				RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		String email = req.getParameter("email");
		String password = req.getParameter("pass");
		
		
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);

		UtenteDao uDao = factory.getUtenteDAO();
		PlaylistPubblicaDao pbDao=factory.getPlaylistPubblicaDAO();
		PlaylistPrivataDao prDao=factory.getPlaylistPrivataDAO();
		UtenteCredenziali u = uDao.findByPrimaryKeyCredential(email);

		if (u == null) {
			String message = " Nessun account è associato con questo indirizzo e-mail.";
			req.setAttribute("Message", message);
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		} else {
			if (u.getPassword().equals(password)) {
				session.setAttribute("name", u.getNome());
				session.setAttribute("surname", u.getCognome());
				session.setAttribute("email", u.getEmail());
				List<PlaylistPubblica> playlistsPb=pbDao.findByUtenteCreatore(email);
				req.getSession().setAttribute("playlistsPb", playlistsPb);
				List<PlaylistPrivata> playlistsPr=prDao.findByUtenteCreatore(email);
				req.getSession().setAttribute("playlistsPr", playlistsPr);
				resp.sendRedirect("home");
			} else {
				String message = " La password non è corretta.";
				req.setAttribute("Message", message);
				RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			}

		}

	}
	

}
