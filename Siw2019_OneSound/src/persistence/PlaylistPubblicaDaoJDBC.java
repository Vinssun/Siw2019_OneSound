package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.PlaylistPubblica;
import model.Utente;
import persistence.dao.PlaylistPubblicaDao;
import persistence.dao.UtenteDao;

public class PlaylistPubblicaDaoJDBC implements PlaylistPubblicaDao {
	
	
	private DataSource dataSource;
	
	public PlaylistPubblicaDaoJDBC(DataSource dataSource) {
		this.dataSource=dataSource;
	}
	
	@Override
	public PlaylistPubblica findByPrimaryKey(int id) {
		Connection connection = this.dataSource.getConnection();
		PlaylistPubblica p=null;
		try {

			String insert = "select nome,utente,immagine from playlist_pubblica WHERE id=?";

			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				p=new PlaylistPubblica();
				p.setId(id);
				p.setNome(result.getString("nome"));
				p.setImmagine(result.getString("immagine"));
				Utente u = new Utente();
				u.setEmail(result.getString("utente"));
				p.setUtente(u);
				
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
		return p;
	}

	@Override
	public List<PlaylistPubblica> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(PlaylistPubblica b) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int id) {
		Connection connection = this.dataSource.getConnection();
		try {

			String delete = "DELETE FROM public.playlist_pubblica WHERE id=?;";
			PreparedStatement statement = connection.prepareStatement(delete);
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
	public int save(PlaylistPubblica b) {
		Connection connection = this.dataSource.getConnection();
		int id=0;
		try {

			String insert = "INSERT INTO public.playlist_pubblica(nome, utente,immagine)VALUES (?, ?, ?) returning id";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setString(1, b.getNome());
			statement.setString(2, b.getUtente().getEmail());
			statement.setString(3, b.getImmagine());
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
	public List<PlaylistPubblica> findByName(String name) {
		Connection connection = this.dataSource.getConnection();
		List<PlaylistPubblica> playlists = new LinkedList<>();
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		UtenteDao uDao=factory.getUtenteDAO();
		
		try {

			PreparedStatement statement;
			String query = "select * from playlist_pubblica where (nome=? or nome ~* ?)";
			statement = connection.prepareStatement(query);
			statement.setString(1, name);
			statement.setString(2, name);
			ResultSet result = statement.executeQuery();

			playlists=createList(result);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return playlists;
	}
	
	@Override
	public List<PlaylistPubblica> findByUtenteCreatore(String email) {
		Connection connection = this.dataSource.getConnection();
		List<PlaylistPubblica> playlists = new LinkedList<>();
		try {
			PreparedStatement statement;
			String query = "select * from playlist_pubblica where utente=?";
			statement = connection.prepareStatement(query);
			statement.setString(1, email);
			ResultSet result = statement.executeQuery();
			playlists=createList(result);
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return playlists;
	}

	
	@Override
	public List<PlaylistPubblica> playlistPiuSeguiti(int limit) {
		Connection connection = this.dataSource.getConnection();
		List<PlaylistPubblica> playlists = new LinkedList<>();
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		UtenteDao uDao=factory.getUtenteDAO();
		
		try {

			PreparedStatement statement;
			String query = "SELECT * FROM public.playlist_pubblica order by follower desc limit ?";
			statement = connection.prepareStatement(query);
			statement.setInt(1, limit);
			
			ResultSet result = statement.executeQuery();
			playlists=createList(result);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return playlists;
	}
	
	@Override
	public List<PlaylistPubblica> getPlaylistSeguite(Connection connection, String email) throws SQLException {
		return querySeguiti(connection, email);
	}
	
	@Override
	public List<PlaylistPubblica> getPlaylistSeguite(String email) {
		Connection connection = this.dataSource.getConnection();
		List<PlaylistPubblica> playlists = new LinkedList<>();
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		UtenteDao uDao=factory.getUtenteDAO();
		
		try {

			
			playlists=querySeguiti(connection, email);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return playlists;
	}
	
	public List<PlaylistPubblica> querySeguiti(Connection connection,String email) throws SQLException{
		PreparedStatement statement;
		String query = "SELECT p.* "
				+ "FROM public.playlist_seguite ps,playlist_pubblica p where ps.utente=? and playlist=p.id;";
		statement = connection.prepareStatement(query);
		statement.setString(1, email);
		
		ResultSet result = statement.executeQuery();
		return createList(result);
	}
	
	public List<PlaylistPubblica> createList(ResultSet result) throws SQLException {
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		
		UtenteDao uDao = factory.getUtenteDAO();
		List<PlaylistPubblica> playlists = new LinkedList<>();
		while (result.next()) {
			PlaylistPubblica pl=null;
			String titolo=result.getString("nome");
			String email=result.getString("utente"); 
			Utente ut = uDao.findByPrimaryKey(email,false,false,false);
			long secs = result.getDate("data_inserimento").getTime();
			int followers = result.getInt("follower");
			String immagine=result.getString("immagine");
			int id=result.getInt("id");
			pl=new PlaylistPubblica(titolo,ut,new java.util.Date(secs),immagine);
			pl.setFollower(followers);
			pl.setId(id);
			playlists.add(pl);
		}
		return playlists;
	}

	@Override
	public void addBrano(int idPlaylist, int brano) {
		Connection connection = this.dataSource.getConnection();
		try {

			String insert = "INSERT INTO public.brano_playlist_pb(playlist_pubblica,brano)VALUES (?, ?);";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setInt(1, idPlaylist);
			statement.setInt(2, brano);
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
	public void removeBrano(int idPlaylist, int brano) {
		Connection connection = this.dataSource.getConnection();
		try {

			String delete = "DELETE FROM public.brano_playlist_pb WHERE brano=? and playlist_pubblica=?;";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setInt(1, brano);
			statement.setInt(2, idPlaylist);
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
	public void updateFoto(int id, String link) {
		Connection connection = this.dataSource.getConnection();
		try {

			String insert = "UPDATE public.playlist_pubblica SET immagine=? WHERE id=?";

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
