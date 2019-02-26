package controller;

import java.io.IOException;
import java.util.Calendar;

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

import model.Utente;
import persistence.DAOFactory;
import persistence.dao.UtenteDao;

/**
 * Servlet Filter implementation class PremiumFilter
 */
@WebFilter({"/inserisciBrano.jsp","/getMieiAlbum", "/rimuoviBrano","/svuotaAlbum","/aggiornaAlbum","/rimuoviAlbum","/PremiumFilter", "/accountPremium","/getMiePlaylistPubbliche" })
public class PremiumFilter implements Filter {

    /**
     * Default constructor. 
     */
    public PremiumFilter() {
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
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String email = (String) req.getSession().getAttribute(("email"));
		DAOFactory factory=DAOFactory.getDAOFactory(2);
		UtenteDao uDao=factory.getUtenteDAO();
		Utente u = uDao.findByPrimaryKey(email, false, false, false);
		Calendar cal = Calendar.getInstance();
		long t = -1;
		if(u.isPremium())
			t = u.getScadenzaPremium().getTime()-cal.getTime().getTime();
		if(t<0) {
			u.setPremium(false);
			uDao.update(u);
			RequestDispatcher rd = request.getRequestDispatcher("premium.jsp");
			rd.forward(request, response);
		}else {
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
