package persistence;

import persistence.dao.AlbumDao;
import persistence.dao.BranoDao;
import persistence.dao.GenereDao;
import persistence.dao.PlaylistPrivataDao;
import persistence.dao.PlaylistPubblicaDao;
import persistence.dao.UtenteDao;

public abstract class DAOFactory {

	
	public static final int MYSQL = 1;
	
	
	public static final int POSTGRESQL = 2;
	
	
	public static DAOFactory getDAOFactory(int whichFactory) {
		switch ( whichFactory ) {
		
		case MYSQL:
			return null;
		case POSTGRESQL:
			return new PostgresDAOFactory();
		default:
			return null;
		}
	}
	
	
	public abstract UtenteDao getUtenteDAO();
	
	public abstract AlbumDao getAlbumDAO();
	public abstract BranoDao getBranoDAO();
	public abstract GenereDao getGenereDAO();
	public abstract PlaylistPrivataDao getPlaylistPrivataDAO();
	public abstract PlaylistPubblicaDao getPlaylistPubblicaDAO();
	
	
	
//	
//	public abstract ProdottoDirettoDao getProdottoDirettoDAO();
//	public abstract ProdottoAstaDao getProdottoAstaDAO();
////	
////	public abstract ScuolaDao getScuolaDAO();
////	
////	public abstract CorsoDao getCorsoDAO();
////	
////	public abstract CorsoDiLaureaDao getCorsoDiLaureaDAO();
////	
////	public abstract DipartimentoDao getDipartimentoDAO();
////
////	public abstract persistence.UtilDao getUtilDAO();
//
//
//	public abstract CategoriaDao getCategoriaDAO();
//	public abstract CartaDiCreditoDao getCartaDiCreditoDAO();
//	public abstract CarrelloDao getCarrelloDao();
//	public abstract OrdineDao getOrdineDAO();
//	public abstract AstaDao getAstaDAO();
//	
//
//
//	public abstract IndirizzoDao getIndirizzoDAO();
//	public abstract IscrizioneUtenteAstaDao getIscrizioneDAO();
//	public abstract ModalitaSpedizioneDao getmodalitaSpedizioneDaoJDBC();
//	

}
