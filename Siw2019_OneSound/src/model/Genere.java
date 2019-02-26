package model;

public class Genere {

	String nome;

	public Genere(String nome) {
		this.nome = nome;
	}

	public Genere() {
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Override
	public String toString() {
		return nome;
	}
	
	
}
