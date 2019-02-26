package model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

public class Utente {

	private String email;
	private String nome;
	private String cognome;
	private Date dataNascita;
	private int follower;
	boolean seguito=false;
	private String immagine;
	private String nickname;
	private boolean premium;
	private String dataStr;
	private String scadenzaPremiumStr;
	
	private Date scadenzaPremium;
	
	
	public String getDataStr() {
		return dataStr;
	}

	public void setData(Date data) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ITALIAN);
		this.dataStr=format.format(data);
	}

	public boolean isSeguito() {
		return seguito;
	}

	public void setSeguito(boolean seguito) {
		this.seguito = seguito;
	}
	private Set<Utente> utentiSeguiti;
	private Set<PlaylistPubblica> playlistSeguite;
	private Set<Brano> braniSeguiti;
	private Set<Album> albumSeguiti;
	
	
	
	public Utente() {}
	

	public Utente(String email, String nome, String cognome, Date dataNascita,String immagine, String nickname) {
		this.email = email;
		this.nome = nome;
		this.cognome = cognome;
		this.dataNascita = dataNascita;
		this.follower = 0;
		this.immagine=immagine;
		this.nickname = nickname;
		this.premium = false;
		setData(this.dataNascita);
	}
	 
	public Utente(String email, String nome, String cognome, Date dataNascita,String immagine) {
		this.email = email;
		this.nome = nome;
		this.cognome = cognome;
		this.dataNascita = dataNascita;
		this.follower = 0;
		this.immagine=immagine;
		this.premium = false;
		setData(this.dataNascita);
	}
		
	public Utente(String email, String nome, String cognome, Date dataNascita) {
		this.email = email;
		this.nome = nome;
		this.cognome = cognome;
		this.dataNascita = dataNascita;
		this.follower = 0;
		this.premium = false;
		setData(this.dataNascita);
		
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public Date getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(Date date) {
		this.dataNascita = date;
		setData(this.dataNascita);
	}


	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return nome+cognome;
	}

	public Set<Utente> getUtentiSeguiti() {
		return utentiSeguiti;
	}

	public void setUtentiSeguiti(Set<Utente> utentiSeguiti) {
		this.utentiSeguiti = utentiSeguiti;
	}
	
	public void addUtenteSeguito(Utente u) {
		if ( this.utentiSeguiti == null){
			this.utentiSeguiti = new HashSet<Utente>();
		}
		this.utentiSeguiti.add(u);
		u.aggiungiFollow();
	}
	public void removeUtenteSeguito(Utente u) {
		this.utentiSeguiti.remove(u);
		u.rimuoviFollow();
	}

	public int getFollower() {
		return follower;
	}

	public void setFollower(int numeroFollower) {
		this.follower = numeroFollower;
	}

	public Set<PlaylistPubblica> getPlaylistSeguite() {
		return playlistSeguite;
	}

	public void setPlaylistSeguite(Set<PlaylistPubblica> playlistSeguite) {
		this.playlistSeguite = playlistSeguite;
	}
	public void addPlaylistSeguite(PlaylistPubblica u) {
		if ( this.playlistSeguite == null){
			this.playlistSeguite = new HashSet<PlaylistPubblica>();
		}
		this.playlistSeguite.add(u);
		u.aggiungiFollow();
	}
	public void removePlaylistSeguite(PlaylistPubblica u) {
		this.playlistSeguite.remove(u);
		u.rimuoviFollow();
	}

	public Set<Brano> getBraniSeguiti() {
		return braniSeguiti;
	}

	public void setBraniSeguiti(Set<Brano> braniSeguiti) {
		this.braniSeguiti = braniSeguiti;
	}
	public void addBraniSeguiti(Brano u) {
		if ( this.braniSeguiti == null){
			this.braniSeguiti = new HashSet<Brano>();
		}
		this.braniSeguiti.add(u);
	}
	public void removeBraniSeguiti(Brano u) {
		this.braniSeguiti.remove(u);
	}

	
	
	public void addAlbumSeguiti(Album u) {
		if ( this.getAlbumSeguiti() == null){
			this.setAlbumSeguiti(new HashSet<Album>());
		}
		this.getAlbumSeguiti().add(u);
		u.aggiungiFollow();
	}
	public void removeAlbumSeguiti(Album u) {
		this.getAlbumSeguiti().remove(u);
		u.rimuoviFollow();
	}

	public Set<Album> getAlbumSeguiti() {
		return albumSeguiti;
	}

	public void setAlbumSeguiti(Set<Album> albumSeguiti) {
		this.albumSeguiti = albumSeguiti;
	}
	public void aggiungiFollow() {
		this.follower = this.follower + 1;
	}
	private void rimuoviFollow() {
		this.follower = this.follower - 1;
	}
	
	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public boolean isPremium() {
		return premium;
	}

	public void setPremium(boolean premium) {
		this.premium = premium;
	}
	public String getScadenzaPremiumStr() {
		return scadenzaPremiumStr;
	}

	public void setScadenzaPremiumStr(String scadenzaPremiumStr) {
		this.scadenzaPremiumStr = scadenzaPremiumStr;
	}

	public Date getScadenzaPremium() {
		return scadenzaPremium;
	}

	public void setScadenzaPremium(Date scadenzaPremium) {
		this.scadenzaPremium = scadenzaPremium;
		setDataScadenza(scadenzaPremium);
	}
	
	public void setDataScadenza(Date data) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ITALIAN);
		this.scadenzaPremiumStr=format.format(data);
	}
}
