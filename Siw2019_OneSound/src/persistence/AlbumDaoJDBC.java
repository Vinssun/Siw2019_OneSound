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
import model.Utente;
import persistence.dao.AlbumDao;
import persistence.dao.UtenteDao;

public class AlbumDaoJDBC implements AlbumDao {

	private DataSource dataSource;
	
	public AlbumDaoJDBC(DataSource dataSource) {
		this.dataSource=dataSource;
	}

	@Override
	public Album findByPrimaryKey(int id) {
		Connection connection = this.dataSource.getConnection();
		Album album = null;
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		UtenteDao uDao=factory.getUtenteDAO();
		
		try {

			PreparedStatement statement;
			String query = "select * from album where id = ?";
			statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				String titolo=result.getString("titolo");
				Utente ut=uDao.findByPrimaryKey(result.getString("utente_caricatore"),false,false,false);
				long secs = result.getDate("data_inserimento").getTime();
				int followers = result.getInt("follower");
				String immagine=result.getString("immagine");
				album=new Album(titolo,ut,new java.util.Date(secs),immagine);
				album.setId(id);
				album.setFollower(followers);
					
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

		return album;
	}

	@Override
	public List<Album> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Album a) {
		Connection connection = this.dataSource.getConnection();
		
		try {

			PreparedStatement statement;
			String query = "UPDATE public.album SET titolo=?, immagine=? "
					+ "WHERE id=?";
			
			statement = connection.prepareStatement(query);
			statement.setString(1, a.getTitolo());
			statement.setString(2, a.getImmagine());
			statement.setInt(3, a.getId());
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
			String query = "DELETE FROM public.album WHERE id=?";
			
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
	public void delete(List<Integer> list) {
		Connection connection = this.dataSource.getConnection();
		String query=createQueryDelete(list);
		try {
			PreparedStatement statement;
			statement = connection.prepareStatement(query);
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
	
	private String createQueryDelete(List<Integer> list) {
		String query="DELETE FROM public.album WHERE ";
		for(int i=0;i<list.size()-1;i++)
			query+="id="+list.get(i)+" or ";
		query+="id="+list.get(list.size()-1);
		System.out.println(query);
		return query;
	}

	@Override
	public void deleteBraniAlbum(int idAlbum) {
		Connection connection = this.dataSource.getConnection();
		
		try {

			PreparedStatement statement;
			String query = "DELETE FROM public.brano WHERE album=?";
			
			statement = connection.prepareStatement(query);
			statement.setInt(1, idAlbum);
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
	public int save(Album album) {
		Connection connection = this.dataSource.getConnection();
		int id=0;
		try {

			PreparedStatement statement;
			String query = "INSERT INTO public.album(titolo, utente_caricatore,  follower, immagine) VALUES (?, ?, ?, ?) returning id";
			
			statement = connection.prepareStatement(query);
			statement.setString(1, album.getTitolo());
			statement.setString(2, album.getUtenteCaricatore().getEmail());
			statement.setInt(3, 0);
			statement.setString(4, album.getImmagine());
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				id=result.getInt("id");
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

		return id;
	}

	
	@Override
	public List<Album> findByName(String name) {
		Connection connection = this.dataSource.getConnection();
		List<Album> albums = new LinkedList<>();
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		UtenteDao uDao=factory.getUtenteDAO();
		
		try {

			PreparedStatement statement;
			String query = "select * from album where (titolo=? or titolo ~* ?)";
			statement = connection.prepareStatement(query);
			statement.setString(1, name);
			statement.setString(2, name);
			ResultSet result = statement.executeQuery();

			albums=createList(result);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return albums;
	}
	
	
	@Override
	public List<Album> getChronOrder(int limit) {
		Connection connection = this.dataSource.getConnection();
		List<Album> albums = new LinkedList<>();
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		try {

			PreparedStatement statement;
			String query = "SELECT *"
					+ "FROM public.album order by data_inserimento desc limit ?;";
			statement = connection.prepareStatement(query);
			statement.setInt(1, limit);
			ResultSet result = statement.executeQuery();
			albums=createList(result);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return albums;
	}

	
	@Override
	public List<Album> albumPiuSeguiti(int limit) {
		Connection connection = this.dataSource.getConnection();
		List<Album> albums = new LinkedList<>();
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		UtenteDao uDao=factory.getUtenteDAO();
		
		try {

			PreparedStatement statement;
			String query = "SELECT * "
					+ "FROM public.album order by follower desc limit ?;";
			statement = connection.prepareStatement(query);
			statement.setInt(1, limit);
			ResultSet result = statement.executeQuery();
			albums=createList(result);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return albums;
	}
	
	@Override
	public List<Album> getAlbumSeguiti(Connection connection,String email) throws SQLException {
		return querySeguiti(connection, email);
	}

	
	@Override
	public List<Album> getAlbumSeguiti(String email) {
		Connection connection = this.dataSource.getConnection();
		List<Album> albums = new LinkedList<>();
		
		try {
			albums=querySeguiti(connection, email);
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return albums;
	}
	
	public List<Album> 	querySeguiti(Connection connection,String email) throws SQLException{
		List<Album> albums = new LinkedList<>();
		PreparedStatement statement;
		String query = "SELECT a.* "
				+ "FROM public.album_seguiti, album a where utente=? and a.id=album;";
		statement = connection.prepareStatement(query);
		statement.setString(1, email);
		ResultSet result = statement.executeQuery();
		albums=createList(result);
		return albums;
	}
	
	@Override
	public List<Album> findByUtenteCaricatore(String name) {
		Connection connection = this.dataSource.getConnection();
		List<Album> albums = new LinkedList<>();
		try {

			PreparedStatement statement;
			String query = "select * from album where utente_caricatore=?";
			statement = connection.prepareStatement(query);
			statement.setString(1, name);
			ResultSet result = statement.executeQuery();

			albums=createList(result);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return albums;
	}

	
	public List<Album> createList(ResultSet result) throws SQLException {
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		UtenteDao uDao = factory.getUtenteDAO();
		List<Album> albums = new LinkedList<>();
		while (result.next()) {
			Album album=null;
			String titolo=result.getString("titolo");
			int id=result.getInt("id");
			String email=result.getString("utente_caricatore");
			//Utente ut=uDao.findByPrimaryKey(result.getString("utente_caricatore"));
			Utente ut = uDao.findByPrimaryKey(email,false,false,false);
			long secs = result.getDate("data_inserimento").getTime();
			int followers = result.getInt("follower");
			String immagine=result.getString("immagine");
			album=new Album(titolo,ut,new java.util.Date(secs),immagine);
			album.setId(id);
			album.setFollower(followers);
			albums.add(album);
		}
		return albums;
	}

	@Override
	public void updateFoto(int id, String link) {
		Connection connection = this.dataSource.getConnection();
		try {

			String insert = "UPDATE public.album SET immagine=? WHERE id=?";

			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setInt(2, id);
			statement.setString(1,link);
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
	

	
	
}
