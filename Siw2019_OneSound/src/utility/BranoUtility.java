package utility;

public class BranoUtility {
	String titolo;
	String genere;
	String linkYoutube;
	String linkDrive;
	
	public BranoUtility() {
		titolo=genere=linkYoutube=linkDrive="";
	}

	public BranoUtility(String titolo, String genere, String link, String file) {
		super();
		this.titolo = titolo;
		this.genere = genere;
		this.linkYoutube = link;
		this.linkDrive = file;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getGenere() {
		return genere;
	}

	public void setGenere(String genere) {
		this.genere = genere;
	}

	public String getLinkYoutube() {
		return linkYoutube;
	}

	public void setLinkYoutube(String link) {
		this.linkYoutube = link;
	}

	public String getLinkDrive() {
		return linkDrive;
	}

	public void setLinkDrive(String linkDrive) {
		this.linkDrive = linkDrive;
	}
	

	
}
