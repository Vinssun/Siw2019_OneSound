package persistence.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import model.Utente;
import persistence.UtenteCredenziali;

public interface UtenteDao {
	Utente findByPrimaryKey(String email, boolean albumSeguiti, boolean playlistSeguite, boolean utentiSeguiti);
	public List<Utente> findAll();       
	public void update(Utente utente); //Update
	public void delete(Utente utente); //Delete	
	void save(Utente utente);
	UtenteCredenziali findByPrimaryKeyCredential(String email);
	void setPassword(Utente utente, String password);
	public boolean isPresent(String email);
	public List<Utente> utentiPiuSeguiti(int limit);
	public List<Utente> getArtistiSeguiti(String email);
	public List<Utente> getArtistiSeguiti(Connection connection, String email) throws SQLException;
	public void seguiUtente(String seguitore, String seguito);
	public void seguiAlbum(String email,int id);
	public void seguiPlaylist(String email, int id);
	public void unfollowUtente(String seguitore, String seguito);
	public void unfollowAlbum(String email,int id);
	public void unfollowPlaylist(String email, int id);
	public List<Utente> findByName(String n);
	public void updateFoto(Utente utente);
	public void addPreferiti(String email,int id);
	public void removePreferiti(String email,int id);
	public void becomePremium(String email);
	
}
