package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import model.Utente;
import persistence.DAOFactory;
import persistence.UtenteCredenziali;
import persistence.dao.UtenteDao;

/**
 * Servlet implementation class Registrazione
 */
@WebServlet("/faiRegistrazione")
public class Registrazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		UtenteDao uDao = factory.getUtenteDAO();
		
	
		
		String email = req.getParameter("email");
		try {
			JSONObject jsonObject = new JSONObject();

			if (uDao.isPresent(email)) {
				jsonObject.put("email", "presente");

				resp.getWriter().println(jsonObject);
			} else {
				jsonObject.put("email", "no");

				resp.getWriter().println(jsonObject);
			}
		} catch (Exception e) {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String email = req.getParameter("email");
		String password = req.getParameter("confirmPassword");
		
		String nome = req.getParameter("first_name");
		String cognome = req.getParameter("last_name");
		String nickname = req.getParameter("nickname");
		String dataStr=req.getParameter("date");
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		UtenteDao uDao = factory.getUtenteDAO();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ITALIAN);
		try {
			Date dataNascita = format.parse(dataStr);
			String immagine="https://drive.google.com/uc?id=1I9A51rET8TCXx73-QjXoIDAHhDqwmLF0";
			
			Utente u = new Utente(email, nome, cognome, dataNascita,immagine);
			u.setNickname(nickname);
			uDao.save(u);
			uDao.setPassword(u, password);
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}catch (Exception e) { System.out.println(e);}
		
	}

}
