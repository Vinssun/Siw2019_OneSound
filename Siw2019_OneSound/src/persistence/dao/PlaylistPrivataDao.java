package persistence.dao;

import java.util.List;

import model.PlaylistPrivata;


public interface PlaylistPrivataDao {
	
	public PlaylistPrivata findByPrimaryKey(int id);
	public List<PlaylistPrivata> findAll();       
	public void update(PlaylistPrivata b); //Update
	public void delete(int id); //Delete	
	int save(PlaylistPrivata b);
	public List<PlaylistPrivata> findByUtenteCreatore(String email);
	public void addBrano(int idPlaylist,int brano);
	public void removeBrano(int idPlaylist,int brano);
	public void updateFoto(int idPlaylist,String immagine);
}
