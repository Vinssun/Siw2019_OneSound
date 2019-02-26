package controller.email;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.DAOFactory;
import persistence.UtenteCredenziali;
import persistence.dao.UtenteDao;

/**
 * A servlet that takes message details from user and send it as a new e-mail
 * through an SMTP server.
 *
 * @author www.codejava.net
 *
 */
@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// reads form fields
		String recipient = request.getParameter("recipient");
		String subject = request.getParameter("subject");
		String content = "";
		String resultMessage = "";

		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);

		UtenteDao uDao = factory.getUtenteDAO();

		UtenteCredenziali u = uDao.findByPrimaryKeyCredential(recipient);
		System.out.println("servlet email");
		if (u == null) {
			System.out.println("nessun utente");
			resultMessage = "Nessun utente trovato. Si prega di riprovare.";
			request.setAttribute("Message", resultMessage);
			RequestDispatcher rd = request.getRequestDispatcher("passwordRecoveryResult.jsp");
			rd.forward(request, response);
		} else {
			content += "La tua password è: " + u.getPassword() + ".\nStaff.";
			System.out.println("ci sono");
			try {
				EmailUtility.sendEmail(host, port, user, pass, recipient, subject, content);
				resultMessage = "L'email è stata spedita con successo.";
			} catch (Exception ex) {
				ex.printStackTrace();
				resultMessage = "C'è stato un imprevisto. Si prega di riprovare.";
			} finally {
				request.setAttribute("Message", resultMessage);
				RequestDispatcher rd = request.getRequestDispatcher("passwordRecoveryResult.jsp");
				rd.forward(request, response);
			}
		}
	}
}