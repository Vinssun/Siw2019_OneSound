package persistence.dao;

import java.util.List;

import model.Brano;

public interface BranoDao {
	
	public Brano findByPrimaryKey(int id);
	public List<Brano> findAll();       
	public void update(Brano b); //Update
	public void delete(int b); //Delete
	public void save(Brano b);
	public List<Brano> findByName(String name);
	public List<Brano> findByAlbum(int idAlbum);
	public List<Brano> findByPlaylistPubblica(int idPlayList);
	public List<Brano> findByPlaylistPrivata(int idPlayList);
	public List<Brano> getChronOrder(int i);
	public List<Brano> findByUtente(String email);
	public void save(List<Brano> brani);
	public List<Brano> getPreferenzeBrani(String email);
	public List<Brano> findByGenere(String genere);
}
