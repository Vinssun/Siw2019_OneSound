package model;

import java.util.Date;

public class Album {

	int id;
	String titolo;
	Utente utenteCaricatore;
	Date dataInserimento ;
	private int follower;
	String immagine;
	boolean seguito=false;
	
	
	public Album(String titolo, Utente utenteCaricatore,Date d,String i) {
		this.titolo = titolo;
		this.utenteCaricatore = utenteCaricatore;
		dataInserimento=d;
		immagine=i;
	}
	public Album() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitolo() {
		return titolo;
	}
	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}
	public Utente getUtenteCaricatore() {
		return utenteCaricatore;
	}
	public void setUtenteCaricatore(Utente utenteCaricatore) {
		this.utenteCaricatore = utenteCaricatore;
	}
	@Override
	public String toString() {
		return titolo;
	}
	
	public Date getDataInserimento() {
		return dataInserimento;
	}
	public void setDataInserimento(Date dataInserimento) {
		this.dataInserimento = dataInserimento;
	}
	public int getFollower() {
		return follower;
	}
	public void setFollower(int follower) {
		this.follower = follower;
	}
	public void aggiungiFollow() {
		this.follower = this.follower + 1;
	}
	public void rimuoviFollow() {
		this.follower = this.follower - 1;
	}
	public String getImmagine() {
		return immagine;
	}
	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}
	public boolean isSeguito() {
		return seguito;
	}
	public void setSeguito(boolean seguito) {
		this.seguito = seguito;
	}
}
