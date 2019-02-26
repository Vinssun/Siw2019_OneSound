package model;

import java.util.Date;

public class Brano {
	
	int id;
	String titolo;
	Utente utenteCaricatore;
	String durata="";
	Album album;
	Genere genere;
	Date dataInserimento ;
	String linkBrano;
	String linkVideo="";
	
	boolean preferito=false;
	
	
	
	public Brano(String titolo, Utente utenteCaricatore, String durata, Album album, Genere genere,Date d, String linkBrano) {
		this.titolo = titolo;
		this.utenteCaricatore = utenteCaricatore;
		this.durata = durata;
		this.album = album;
		this.genere = genere;
		dataInserimento=d;
		this.linkBrano=linkBrano;
	}
	
	public Brano(String titolo, Utente utenteCaricatore, String durata, Album album, Genere genere, String linkBrano,String linkVideo) {
		this.titolo = titolo;
		this.utenteCaricatore = utenteCaricatore;
		this.durata = durata;
		this.album = album;
		this.genere = genere;
		this.linkBrano=linkBrano;
		this.linkVideo =linkVideo;
	}
	
	
	
	public Brano() {
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
	public String getDurata() {
		return durata;
	}
	public void setDurata(String durata) {
		this.durata = durata;
	}
	public Album getAlbum() {
		return album;
	}
	public void setAlbum(Album album) {
		this.album = album;
	}
	public Genere getGenere() {
		return genere;
	}
	public void setGenere(Genere genere) {
		this.genere = genere;
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
	public String getLinkBrano() {
		return linkBrano;
	}
	public void setLinkBrano(String linkBrano) {
		this.linkBrano = linkBrano;
	}
	
	public boolean isPreferito() {
		return preferito;
	}
	public void setPreferito(boolean preferito) {
		this.preferito = preferito;
	}
	public String getLinkVideo() {
		return linkVideo;
	}

	public void setLinkVideo(String linkVideo) {
		this.linkVideo = linkVideo;
	}
	
}
