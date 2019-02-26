package persistence;

import java.util.List;

import model.Genere;
import persistence.dao.GenereDao;

public class GenereDaoJDBC implements GenereDao {
	
	private DataSource dataSource;
	
	public GenereDaoJDBC(DataSource dataSource) {
		this.dataSource=dataSource;
	}
	
	
	@Override
	public Genere findByPrimaryKey(String nome) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Genere> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Genere b) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Genere b) {
		// TODO Auto-generated method stub

	}

	@Override
	public void save(Genere b) {
		// TODO Auto-generated method stub

	}

}
