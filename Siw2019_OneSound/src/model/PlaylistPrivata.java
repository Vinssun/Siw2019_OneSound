package model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class PlaylistPrivata {

	private int id;
	String nome;
	Utente utente;
	Date dataInserimento;
	private Set<Brano> brani;
	String immagine;
	
	public PlaylistPrivata(String nome, Utente utente, Date dataInserimento,String i) {
		this.nome = nome;
		this.utente = utente;
		this.dataInserimento = dataInserimento;
		immagine=i;
	}
	public PlaylistPrivata() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public Utente getUtente() {
		return utente;
	}
	public void setUtente(Utente utente) {
		this.utente = utente;
	}
	public Date getDataInserimento() {
		return dataInserimento;
	}
	public void setDataInserimento(Date dataInserimento) {
		this.dataInserimento = dataInserimento;
	}
	@Override
	public String toString() {
		return "PlaylistPrivata [nome=" + nome + ", utente=" + utente + "]";
	}
	
	public Set<Brano> getBrani() {
		return brani;
	}
	public void setBrani(Set<Brano> brani) {
		this.brani = brani;
	}
	

	public void addBrano(Brano u) {
		if ( this.brani == null){
			this.brani = new HashSet<Brano>();
		}
		this.brani.add(u);
	}
	public void removeBrano(Brano u) {
		this.brani.remove(u);
	}
	public String getImmagine() {
		return immagine;
	}
	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}
}
