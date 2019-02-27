package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.PlaylistPrivata;
import model.PlaylistPubblica;
import model.Utente;
import persistence.dao.PlaylistPrivataDao;
import persistence.dao.UtenteDao;

public class PlaylistPrivataDaoJDBC implements PlaylistPrivataDao {

	private DataSource dataSource;
	
	public PlaylistPrivataDaoJDBC(DataSource dataSource) {
		this.dataSource=dataSource;
	}
	
	@Override
	public PlaylistPrivata findByPrimaryKey(int id) {
		Connection connection = this.dataSource.getConnection();
		PlaylistPrivata p=null;
		try {

			String insert = "select nome,utente,immagine from playlist_privata WHERE id=?";

			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				p=new PlaylistPrivata();
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
	public List<PlaylistPrivata> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(PlaylistPrivata b) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int id) {
		Connection connection = this.dataSource.getConnection();
		try {

			String delete = "DELETE FROM public.playlist_privata WHERE id=?;";
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
	public int save(PlaylistPrivata b) {
		Connection connection = this.dataSource.getConnection();
		int id = 0;
		try {

			String insert = "INSERT INTO public.playlist_privata(nome, utente,immagine)VALUES (?, ?, ?)returning id";
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
	public List<PlaylistPrivata> findByUtenteCreatore(String email) {
		Connection connection = this.dataSource.getConnection();
		List<PlaylistPrivata> playlists = new LinkedList<>();
		try {
			PreparedStatement statement;
			String query = "select * from playlist_privata where utente=?";
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
	public List<PlaylistPrivata> createList(ResultSet result) throws SQLException {
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		
		UtenteDao uDao = factory.getUtenteDAO();
		List<PlaylistPrivata> playlists = new LinkedList<>();
		while (result.next()) {
			PlaylistPrivata pl=null;
			String titolo=result.getString("nome");
			String email=result.getString("utente"); 
			Utente ut = uDao.findByPrimaryKey(email,false,false,false);
			long secs = result.getDate("data_inserimento").getTime();
			String immagine=result.getString("immagine");
			int id=result.getInt("id");
			pl=new PlaylistPrivata(titolo,ut,new java.util.Date(secs),immagine);
			
			pl.setId(id);
			playlists.add(pl);
		}
		return playlists;
	}

	@Override
	public void addBrano(int idPlaylist, int brano) {
		Connection connection = this.dataSource.getConnection();
		try {

			String insert = "INSERT INTO public.brano_playlist_pr(playlist_privata,brano)VALUES (?, ?);";
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

			String delete = "DELETE FROM public.brano_playlist_pr WHERE brano=? and playlist_privata=?;";
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

			String insert = "UPDATE public.playlist_privata SET immagine=? WHERE id=?";

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
