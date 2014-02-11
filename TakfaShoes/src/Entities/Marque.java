package Entities;


/**
 * 
 * @author Takfarinas
 *Class User stockant les informations 
 *relatives à un utlisateur ici notamment 
 *dans le cas des administrateurs backOffice
 */
public class Marque {
	private String id;
	private String nom;

	
	public Marque(){
		
	}
	
	public Marque(final String nom){
		this.nom = nom;
	}

	
	public String getNom() {
		return nom;
	}
	
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
}
