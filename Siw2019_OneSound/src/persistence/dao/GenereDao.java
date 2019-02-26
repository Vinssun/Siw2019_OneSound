package persistence.dao;

import java.util.List;

import model.Genere;

public interface GenereDao {
	
	public Genere findByPrimaryKey(String nome);
	public List<Genere> findAll();       
	public void update(Genere b); //Update
	public void delete(Genere b); //Delete	
	void save(Genere b);

}
