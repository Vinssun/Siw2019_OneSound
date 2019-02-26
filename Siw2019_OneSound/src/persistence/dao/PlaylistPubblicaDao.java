package persistence.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import model.PlaylistPubblica;

public interface PlaylistPubblicaDao {
	
	public PlaylistPubblica findByPrimaryKey(int id);
	public List<PlaylistPubblica> findAll();       
	public void update(PlaylistPubblica b); //Update
	public void delete(int id); //Delete	
	public int save(PlaylistPubblica b);
	public List<PlaylistPubblica> findByName(String name);
	public List<PlaylistPubblica> playlistPiuSeguiti(int limit);
	public List<PlaylistPubblica> getPlaylistSeguite(String email);
	public List<PlaylistPubblica> getPlaylistSeguite(Connection connection, String email) throws SQLException;
	public List<PlaylistPubblica> findByUtenteCreatore(String email);
	public void addBrano(int idPlaylist,int brano);
	public void removeBrano(int idPlaylist,int brano);
	public void updateFoto(int idPlaylist,String immagine);
	
}
