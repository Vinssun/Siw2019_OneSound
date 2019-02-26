package persistence;

import persistence.dao.AlbumDao;
import persistence.dao.BranoDao;
import persistence.dao.GenereDao;
import persistence.dao.PlaylistPrivataDao;
import persistence.dao.PlaylistPubblicaDao;
import persistence.dao.UtenteDao;

class PostgresDAOFactory extends DAOFactory {

	
	
	private static  DataSource dataSource;
	

	// --------------------------------------------

	static {
		try {
			Class.forName("org.postgresql.Driver").newInstance();
	
			String uri="jdbc:postgresql://dumbo.db.elephantsql.com:5432/sjsykehf";
			String username="sjsykehf";
			String password="ZV0HZ60lHUqMEoguyjkEf24OwjOZSNt1";
			dataSource=new DataSource(uri,username,password);
		}   
		
		
		catch (Exception e) {
			System.err.println("PostgresDAOFactory.class: failed to lo"
					+ "ad MySQL JDBC driver\n"+e);
			e.printStackTrace();
		}
	}


	@Override
	public UtenteDao getUtenteDAO() {
		return new UtenteDaoJDBC(dataSource);
	}
//
//
//	
//
//	
//	@Override
//	public ProdottoDirettoDao getProdottoDirettoDAO() {
//		return new ProdottoDirettoDaoJDBC(dataSource);
//	}
//
//	@Override
//	public ProdottoAstaDao getProdottoAstaDAO() {
//		return new ProdottoAstaDaoJDBC(dataSource);
//	}
//
//	@Override
//	public CategoriaDao getCategoriaDAO() {
//		return new CategoriaDaoJDBC(dataSource);
//	}
//	
//	@Override
//	public IndirizzoDao getIndirizzoDAO() {
//		return new IndirizzoDaoJDBC(dataSource);
//	}
//	
//	// --------------------------------------------
//
//
//	@Override
//	public CartaDiCreditoDao getCartaDiCreditoDAO() {
//		// TODO Auto-generated method stub
//		return new CartaDiCreditoDaoJDBC(dataSource);
//	}
//	
//
//
//	@Override
//	public CarrelloDao getCarrelloDao() {
//		// TODO Auto-generated method stub
//		return new CarrelloDaoJDBS(dataSource);
//	}
//
//
//	@Override
//	public OrdineDao getOrdineDAO() {
//
//		return new OrdineDaoJDBC(dataSource);
//	}
//	 public IscrizioneUtenteAstaDao getIscrizioneDAO()
//	 {
//		 return new IscrizioneUtenteAstaDaoJDBC(dataSource);
//	 }
//
//
//	@Override
//	public AstaDao getAstaDAO() {
//		return new AstaDaoJDBC(dataSource);
//	}
//
//
//	@Override
//	public ModalitaSpedizioneDao getmodalitaSpedizioneDaoJDBC() {
//		return new ModalitaSpedizioneDaoJDBC(dataSource);
//	}


	@Override
	public AlbumDao getAlbumDAO() {
		// TODO Auto-generated method stub
		return new AlbumDaoJDBC(dataSource);
	}


	@Override
	public BranoDao getBranoDAO() {
		// TODO Auto-generated method stub
		return new BranoDaoJDBC(dataSource);
	}


	@Override
	public GenereDao getGenereDAO() {
		// TODO Auto-generated method stub
		return new GenereDaoJDBC(dataSource);
	}


	@Override
	public PlaylistPrivataDao getPlaylistPrivataDAO() {
		// TODO Auto-generated method stub
		return new PlaylistPrivataDaoJDBC(dataSource);
	}


	@Override
	public PlaylistPubblicaDao getPlaylistPubblicaDAO() {
		// TODO Auto-generated method stub
		return new PlaylistPubblicaDaoJDBC(dataSource);
	}
}
