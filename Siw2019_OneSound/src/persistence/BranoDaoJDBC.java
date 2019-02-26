package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.Album;
import model.Brano;
import model.Genere;
import model.PlaylistPrivata;
import model.PlaylistPubblica;
import model.Utente;
import persistence.dao.AlbumDao;
import persistence.dao.BranoDao;
import persistence.dao.UtenteDao;

public class BranoDaoJDBC implements BranoDao {

	private DataSource dataSource;

	public BranoDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public Brano findByPrimaryKey(int id) {
		Connection connection = this.dataSource.getConnection();
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		AlbumDao aDao = factory.getAlbumDAO();
		UtenteDao uDao=factory.getUtenteDAO();
		Brano brano = null;
		try {

			PreparedStatement statement;
			String query = "select * from brano where id=?";
			statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				String titolo = result.getString("titolo");
				String durata = result.getString("duarat");
				String email = result.getString("utente_caricatore");
				Utente u = uDao.findByPrimaryKey(email,false,false,false);
				
				int idAlbum = result.getInt("album");
				Album a = aDao.findByPrimaryKey(idAlbum);
				Genere genere = new Genere(result.getString("genere"));
				long secs = result.getDate("data_inserimento").getTime();
				String link=result.getString("link");
				String linkVideo=result.getString("link_video");
				
				brano = new Brano(titolo, u, durata, a, genere,new java.util.Date(secs),link);
				if(linkVideo!=null)
					brano.setLinkVideo(linkVideo);
				brano.setId(id);
			}

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return brano;

	}

	@Override
	public List<Brano> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Brano b) {
		Connection connection = this.dataSource.getConnection();
		
		try {

			PreparedStatement statement;
			String query = "UPDATE public.brano SET  titolo=?, album=?, genere=?, link_video=? WHERE id=?";
			
			statement = connection.prepareStatement(query);
			statement.setString(1, b.getTitolo());
			statement.setInt(2, b.getAlbum().getId());
			statement.setString(3, b.getGenere().getNome());
			statement.setInt(5, b.getId());
			statement.setString(4, b.getLinkVideo());
			
			statement.executeUpdate();
			
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}


	}

	

	@Override
	public void delete(int id) {
		Connection connection = this.dataSource.getConnection();
		
		try {

			PreparedStatement statement;
			String query = "DELETE FROM public.brano WHERE id=?";
			
			statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			statement.executeUpdate();
			
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}


	}
	
	

	@Override
	public void save(Brano brano) {
		Connection connection = this.dataSource.getConnection();
		
		try {
			queryInserimento(connection, brano);				
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}


	}
	
	@Override
	public void save(List<Brano> brani) {
		Connection connection = this.dataSource.getConnection();
		
		try {
			for(Brano brano:brani) 
				queryInserimento(connection, brano);	
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}


	}
	
	public void queryInserimento(Connection connection,Brano brano) throws SQLException {
		PreparedStatement statement;
		String query = "INSERT INTO public.brano( titolo, durata, utente_caricatore, album, genere, link, link_video)"
				+ "VALUES (?, ?, ?, ?, ?, ?,?);";
		
				
		statement = connection.prepareStatement(query);
		statement.setString(1, brano.getTitolo());
		statement.setString(2, brano.getDurata());
		statement.setString(3, brano.getUtenteCaricatore().getEmail());
		statement.setInt(4, brano.getAlbum().getId());
		statement.setString(5, brano.getGenere().getNome());
		statement.setString(6, brano.getLinkBrano());
		statement.setString(7, brano.getLinkVideo());
		statement.executeUpdate();
	}
	
	
	@Override
	public List<Brano> getChronOrder(int i) {
		Connection connection = this.dataSource.getConnection();
		List<Brano> brani = new LinkedList<>();
		try {

			PreparedStatement statement;
			String query = "SELECT *"
					+ "FROM public.brano order by data_inserimento desc limit ?;";;
			statement = connection.prepareStatement(query);
			statement.setInt(1, i);
			ResultSet result = statement.executeQuery();
			brani = createList(result);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return brani;
	}


	@Override
	public List<Brano> findByName(String name) {
		Connection connection = this.dataSource.getConnection();
		List<Brano> brani = new LinkedList<>();
		try {

			PreparedStatement statement;
			String query = "select * from brano where (titolo=? or titolo ~* ?)";
			statement = connection.prepareStatement(query);
			statement.setString(1, name);
			statement.setString(2, name);
			ResultSet result = statement.executeQuery();
			brani = createList(result);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return brani;
	}

	@Override
	public List<Brano> findByAlbum(int id) {
		Connection connection = this.dataSource.getConnection();
		List<Brano> brani = new LinkedList<>();
		try {

			PreparedStatement statement;
			String query = "select * from brano where album =?";
			statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();
			brani = createList(result);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return brani;
	}

	@Override
	public List<Brano> findByPlaylistPubblica(int idPlayList) {
		Connection connection = this.dataSource.getConnection();
		List<Brano> brani = new LinkedList<>();
		try {

			PreparedStatement statement;
			String query = "SELECT brano.* "
					+ "FROM public.brano,brano_playlist_pb where playlist_pubblica=? and brano=id;";
			statement = connection.prepareStatement(query);
			statement.setInt(1, idPlayList);
			ResultSet result = statement.executeQuery();
			brani = createList(result);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return brani;
	}

	@Override
	public List<Brano> findByPlaylistPrivata(int idPlayList) {
		Connection connection = this.dataSource.getConnection();
		List<Brano> brani = new LinkedList<>();
		try {

			PreparedStatement statement;
			String query = "SELECT brano.* "
					+ "FROM public.brano,brano_playlist_pr where playlist_privata=? and brano=id;";
			statement = connection.prepareStatement(query);
			statement.setInt(1, idPlayList);
			ResultSet result = statement.executeQuery();
			brani = createList(result);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return brani;
	}

	@Override
	public List<Brano> findByUtente(String email) {
		Connection connection = this.dataSource.getConnection();
		List<Brano> brani = new LinkedList<>();
		try {

			PreparedStatement statement;
			String query = "SELECT id, titolo, durata, utente_caricatore, album, genere, data_inserimento "
					+ "FROM public.brano,brano_playlist_pr where playlist_privata=? and brano=id;";
			statement = connection.prepareStatement(query);
			statement.setString(1, email);
			ResultSet result = statement.executeQuery();
			brani = createList(result);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return brani;
	}
	
	@Override
	public List<Brano> getPreferenzeBrani(String email) {
		Connection connection = this.dataSource.getConnection();
		List<Brano> brani = new LinkedList<>();
		try {

			PreparedStatement statement;
			String query = "SELECT b.* FROM public.brano b,preferenze_brani pb where b.id=brano and pb.utente=?";
			statement = connection.prepareStatement(query);
			statement.setString(1, email);
			ResultSet result = statement.executeQuery();
			brani = createList(result);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return brani;
	}
	
	@Override
	public List<Brano> findByGenere(String genere) {
		Connection connection = this.dataSource.getConnection();
		List<Brano> brani = new LinkedList<>();
		try {

			PreparedStatement statement;
			String query = "SELECT * "
					+ "FROM public.brano where genere=?;";
			statement = connection.prepareStatement(query);
			statement.setString(1, genere);
			ResultSet result = statement.executeQuery();
			brani = createList(result);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return brani;
	}
	
	public List<Brano> createList(ResultSet result) throws SQLException {
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		AlbumDao aDao = factory.getAlbumDAO();
		UtenteDao uDao = factory.getUtenteDAO();
		List<Brano> brani = new LinkedList<>();
		Brano brano;
		while (result.next()) {
			int id = result.getInt("id");
			String titolo = result.getString("titolo");
			System.out.println("titolo "+titolo);
			String durata = result.getString("durata");
			String email = result.getString("utente_caricatore");
			Utente u = uDao.findByPrimaryKey(email,false,false,false);
			
			int idAlbum = result.getInt("album");
			Album a = aDao.findByPrimaryKey(idAlbum);
			Genere genere = new Genere(result.getString("genere"));
			long secs = result.getDate("data_inserimento").getTime();
			
			String link=result.getString("link");
			
			brano = new Brano(titolo, u, durata, a, genere,new java.util.Date(secs),link);
			brano.setId(id);
			String linkVideo=result.getString("link_video");
			if(linkVideo!=null)
				brano.setLinkVideo(linkVideo);
			brani.add(brano);
		}
		return brani;
	}

	

}
