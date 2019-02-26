package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import model.Album;
import model.PlaylistPubblica;
import model.Utente;
import persistence.dao.AlbumDao;
import persistence.dao.PlaylistPubblicaDao;
import persistence.dao.UtenteDao;

public class UtenteDaoJDBC implements UtenteDao {

	private DataSource dataSource;

	public UtenteDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	
	@Override
	public void save(Utente utente) {

		Connection connection = this.dataSource.getConnection();
		try {

			String insert = "insert into utente(nome, cognome,data_nascita, email,immagine,nickname) values (?,?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setString(1, utente.getNome());
			statement.setString(2, utente.getCognome());
			long secs = utente.getDataNascita().getTime();
			statement.setDate(3, new java.sql.Date(secs));
			statement.setString(4, utente.getEmail());
			statement.setString(5, utente.getImmagine());
			statement.setString(6, utente.getNickname());
			
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
	public UtenteCredenziali findByPrimaryKeyCredential(String email) {

		Utente ut = findByPrimaryKey(email,false,false,false);

		UtenteCredenziali utenteCred = null;
		if (ut != null) {
			utenteCred = new UtenteCredenziali(dataSource);
			utenteCred.setNome(ut.getNome());
			utenteCred.setCognome(ut.getCognome());
			utenteCred.setEmail(email);
			utenteCred.setDataNascita(ut.getDataNascita());
			utenteCred.setImmagine(ut.getImmagine());
			utenteCred.setNickname(ut.getNickname());
			utenteCred.setPremium(ut.isPremium());
			utenteCred.setFollower(ut.getFollower());
			if(ut.isPremium())
			{
				utenteCred.setScadenzaPremium(ut.getScadenzaPremium());
			}
		} 
		return utenteCred;
	}

	@Override
	public List<Utente> findAll() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void update(Utente utente) {
		Connection connection = this.dataSource.getConnection();
		try {

			String insert = "UPDATE public.utente SET data_nascita=?,nome=?, cognome=?, premium=? WHERE email=?";

			PreparedStatement statement = connection.prepareStatement(insert);
			long secs = utente.getDataNascita().getTime();
			statement.setDate(1, new java.sql.Date(secs));
			statement.setString(2, utente.getNome());
			statement.setString(3, utente.getCognome());
			statement.setBoolean(4, utente.isPremium());
			statement.setString(5, utente.getEmail());
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
	public void updateFoto(Utente utente) {
		Connection connection = this.dataSource.getConnection();
		try {

			String insert = "UPDATE public.utente SET immagine=? WHERE email=?";

			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setString(1, utente.getImmagine());
			statement.setString(2, utente.getEmail());
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
	public void delete(Utente utente) {
		// TODO Auto-generated method stub

	}

	

	@Override
	public void setPassword(Utente utente, String password) {

		Connection connection = this.dataSource.getConnection();
		try {
			PreparedStatement statement;
			String query = "update public.utente set password = ? where email = ?";
			statement = connection.prepareStatement(query);
			System.out.println(password + " " + utente.getEmail());
			statement.setString(1, password);
			statement.setString(2, utente.getEmail());
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

	public boolean isPresent(String email) {
		boolean present = true;
		Connection connection = this.dataSource.getConnection();
		try {
			PreparedStatement statement;
			String query = "select * from public.utente  where email = ?";
			statement = connection.prepareStatement(query);
			statement.setString(1, email);
			ResultSet result = statement.executeQuery();
			if (!result.next()) {
				present = false;
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

		return present;
	}


	@Override
	public Utente findByPrimaryKey(String email,boolean albumSeguiti,boolean playlistSeguite,boolean artistiSeguiti) {
		Connection connection = this.dataSource.getConnection();
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		AlbumDao aDao=factory.getAlbumDAO();
		UtenteDao uDao=factory.getUtenteDAO();
		PlaylistPubblicaDao plDao=factory.getPlaylistPubblicaDAO();
		Utente utente = null;
		try {

			PreparedStatement statement;
			String query = "select * from utente where email = ?";

			statement = connection.prepareStatement(query);
			statement.setString(1, email);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				utente = new Utente();
				utente.setNome(result.getString("nome"));
				utente.setCognome(result.getString("cognome"));
				utente.setEmail(email);
				long secs = result.getDate("data_nascita").getTime();
				utente.setDataNascita(new java.util.Date(secs));
				int followers = result.getInt("follower");
				utente.setFollower(followers);
				utente.setImmagine(result.getString("immagine"));
				utente.setNickname(result.getString("nickname"));
				boolean premium=result.getBoolean("premium");
				utente.setPremium(premium);
				if(premium)
				{
					long secss = result.getDate("scadenza_premium").getTime();
					utente.setScadenzaPremium(new java.util.Date(secss));
				}
				if(albumSeguiti) {
					Set<Album> sAlbum=new HashSet<>( aDao.getAlbumSeguiti(connection, email));
					utente.setAlbumSeguiti(sAlbum);
				}
				if(artistiSeguiti) {
					Set<Utente> sUtenti=new HashSet<>( uDao.getArtistiSeguiti(connection, email));
					utente.setUtentiSeguiti(sUtenti);
				}
				if(playlistSeguite) {
					Set<PlaylistPubblica> sPlaylist=new HashSet<>( plDao.getPlaylistSeguite(connection, email));
					utente.setPlaylistSeguite(sPlaylist);
				}
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

		return utente;
	}


	@Override
	public List<Utente> utentiPiuSeguiti(int limit) {
		Connection connection = this.dataSource.getConnection();
		List<Utente> utenti = new LinkedList<>();
		try {

			PreparedStatement statement;
			String query = "SELECT * "
					+ "FROM public.utente order by follower desc limit ?;";
			statement = connection.prepareStatement(query);
			statement.setInt(1, limit);
			ResultSet result = statement.executeQuery();
			utenti=createList(result);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return utenti;
	}
	
	
	@Override
	public List<Utente> getArtistiSeguiti(Connection connection, String email) throws SQLException {
		return querySeguiti(connection, email);
	}

	@Override
	public List<Utente> getArtistiSeguiti(String email) {
		Connection connection = this.dataSource.getConnection();
		List<Utente> utenti = new LinkedList<>();
		
		try {

			utenti=querySeguiti(connection, email);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return utenti;
	}

	public List<Utente> querySeguiti(Connection connection,String email) throws SQLException{
		PreparedStatement statement;
		String query = "SELECT u.* "
				+ "FROM public.follow ,utente u where utente_seguitore=?and utente_seguito=u.email;";
		statement = connection.prepareStatement(query);
		statement.setString(1, email);
		ResultSet result = statement.executeQuery();
		return createList(result);
		
	}
	
	@Override
	public List<Utente> findByName(String name) {
		Connection connection = this.dataSource.getConnection();
		List<Utente> utenti = new LinkedList<>();
		
		try {

			PreparedStatement statement;
			String query = "select * from utente where (nome=? or nome ~* ? or cognome ~* ? or nickname ~* ?)";
			statement = connection.prepareStatement(query);
			statement.setString(1, name);
			statement.setString(2, name);
			statement.setString(3, name);
			statement.setString(4, name);
			ResultSet result = statement.executeQuery();

			utenti=createList(result);

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}

		return utenti;
	}


	public List<Utente> createList(ResultSet result) throws SQLException {
		List<Utente> utenti = new LinkedList<>();
		while (result.next()) {
				Utente utente = new Utente();
				utente.setNome(result.getString("nome"));
				utente.setCognome(result.getString("cognome"));
				utente.setEmail(result.getString("email"));
				long secs = result.getDate("data_nascita").getTime();
				utente.setDataNascita(new java.util.Date(secs));
				int followers = result.getInt("follower");
				utente.setFollower(followers);
				utente.setImmagine(result.getString("immagine"));
				utente.setNickname(result.getString("nickname"));
				boolean premium=result.getBoolean("premium");
				utente.setPremium(premium);
				if(premium)
				{
					long secss = result.getDate("scadenza_premium").getTime();
					utente.setScadenzaPremium(new java.util.Date(secss));
				}
			utenti.add(utente);
		}
		return utenti;
	}

	public void manageFollow(Connection connection,String query) throws SQLException {
		PreparedStatement statement;
		statement = connection.prepareStatement(query);
		statement.executeUpdate();
	}
	
	

	@Override
	public void seguiUtente(String seguitore, String seguito) {
		Connection connection = this.dataSource.getConnection();		
		try {
			System.out.println("seguitore "+seguitore);
			System.out.println("seguito "+seguito);
			String s=seguito;
			PreparedStatement statement;
			String query = "INSERT INTO public.follow(utente_seguitore, utente_seguito) VALUES (?, ?);";
			statement = connection.prepareStatement(query);
			statement.setString(1, seguitore);
			statement.setString(2, seguito);
			statement.executeUpdate();
			String query2="UPDATE utente SET follower = follower + 1 WHERE email = '"+seguito+"'";
			
			manageFollow(connection, query2);
			
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
	public void seguiAlbum(String email, int id) {
		Connection connection = this.dataSource.getConnection();		
		try {
			PreparedStatement statement;
			String query = "INSERT INTO public.album_seguiti(album, utente) VALUES (?, ?);";
			statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			statement.setString(2, email);
			String query2="UPDATE album SET follower = follower + 1 WHERE id ="+id;
			manageFollow(connection, query2);
			
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
	public void seguiPlaylist(String email, int id) {
		Connection connection = this.dataSource.getConnection();		
		try {
			PreparedStatement statement;
			String query = "INSERT INTO public.playlist_seguite(utente, playlist) VALUES (?, ?);";
			statement = connection.prepareStatement(query);
			statement.setString(1, email);
			statement.setInt(2, id);
			String query2="UPDATE playlist_pubblica SET follower = follower + 1 WHERE id ="+id;
			manageFollow(connection, query2);
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
	public void unfollowUtente(String seguitore, String seguito) {
		Connection connection = this.dataSource.getConnection();		
		try {
			PreparedStatement statement;
			String query = "delete from public.follow where utente_seguitore=? and utente_seguito=?;";
			statement = connection.prepareStatement(query);
			statement.setString(1, seguitore);
			statement.setString(2, seguito);
			String query2="UPDATE utente SET follower = follower - 1 WHERE email = '"+seguito+"'";
			manageFollow(connection, query2);
			
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
	public void unfollowPlaylist(String email, int id) {
		Connection connection = this.dataSource.getConnection();		
		try {
			PreparedStatement statement;
			String query = "delete from public.playlist_seguite where utente =? and playlist=?;";
			statement = connection.prepareStatement(query);
			statement.setString(1, email);
			statement.setInt(2, id);
			String query2="UPDATE playlist_pubblica SET follower = follower - 1 WHERE id = "+id;
			manageFollow(connection, query2);
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
	public void unfollowAlbum(String email, int id) {
		Connection connection = this.dataSource.getConnection();		
		try {
			PreparedStatement statement;
			String query = "delete from public.album_seguiti where album=? and utente=?;";
			statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			statement.setString(2, email);
			String query2="UPDATE album SET follower = follower - 1 WHERE id = "+id;
			manageFollow(connection, query2);
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
	public void addPreferiti(String email,int id) {
		Connection connection = this.dataSource.getConnection();		
		try {
			PreparedStatement statement;
			String query = "INSERT INTO public.preferenze_brani(utente, brano) VALUES (?, ?);";
			statement = connection.prepareStatement(query);
			statement.setString(1, email);
			statement.setInt(2, id);
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
	public void removePreferiti(String email,int id) {
		Connection connection = this.dataSource.getConnection();		
		try {
			PreparedStatement statement;
			String query = "delete from public.preferenze_brani where brano=? and utente=?;";
			statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			statement.setString(2, email);
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
	public void becomePremium(String email) {
		Connection connection = this.dataSource.getConnection();
		try {

			String insert = "UPDATE public.utente SET premium=?, scadenza_premium=? WHERE email=?";

			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setBoolean(1, true);
			Calendar cal=Calendar.getInstance();
			cal.add(Calendar.DATE, 30);
			Date d=cal.getTime();
			long secs = d.getTime();
			statement.setDate(2, new java.sql.Date(secs));
			statement.setString(3, email);
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
