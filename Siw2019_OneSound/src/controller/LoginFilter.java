package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PlaylistPrivata;
import model.PlaylistPubblica;
import persistence.DAOFactory;
import persistence.dao.PlaylistPrivataDao;
import persistence.dao.PlaylistPubblicaDao;
import persistence.dao.UtenteDao;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(
		dispatcherTypes = {
				DispatcherType.REQUEST, 
				DispatcherType.FORWARD, 
				DispatcherType.INCLUDE, 
				DispatcherType.ERROR
		}
					, 
		urlPatterns = { "/diventaPremium","/LoginFilter","/albums-store.jsp","/getProfile","/getMieiAlbum","/getInformazioniPersonali", }, 
		servletNames = {"HomeServlet"})
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String email = (String) req.getSession().getAttribute(("email"));
		String path = req.getServletPath();
		if (email != null && !email.equals("")) {
			
			List<PlaylistPubblica> pb = (List<PlaylistPubblica>)req.getSession().getAttribute("playlistsPb");
			List<PlaylistPrivata> pr = (List<PlaylistPrivata>)req.getSession().getAttribute("playlistsPr");
			
			if(pb==null || pr == null) {
				DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
				PlaylistPubblicaDao pbDao=factory.getPlaylistPubblicaDAO();
				PlaylistPrivataDao prDao=factory.getPlaylistPrivataDAO();
				
				List<PlaylistPubblica> playlistsPb=pbDao.findByUtenteCreatore(email);
				req.getSession().setAttribute("playlistsPb", playlistsPb);
				List<PlaylistPrivata> playlistsPr=prDao.findByUtenteCreatore(email);
				req.getSession().setAttribute("playlistsPr", playlistsPr);
			}
			chain.doFilter(request, response);
		} else {
			System.out.println("****************************************************");
			System.out.println("*********************" + req.getRequestURI() + "*********************");
			System.out.println("****************************************************");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
