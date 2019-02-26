package persistence.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import model.Album;
import model.Utente;


public interface AlbumDao {
	
	public Album findByPrimaryKey(int id);
	public List<Album> findAll();       
	public void update(Album album); //Update
	public void delete(int id); //Delete	
	public void deleteBraniAlbum(int idAlbum); //Delete	
	public int save(Album album);
	public List<Album> findByName(String name);
	List<Album> getChronOrder(int limit);
	List<Album> albumPiuSeguiti(int limit);
	public List<Album> getAlbumSeguiti(String email);
	List<Album> getAlbumSeguiti(Connection connection, String email) throws SQLException;
	public List<Album> findByUtenteCaricatore(String name);
	public void updateFoto(int id, String link);
	public void delete(List<Integer> list);
	
}
