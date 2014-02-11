package Entities;


/**
 * 
 * @author Takfarinas
 *Class User stockant les informations 
 *relatives à un utlisateur ici notamment 
 *dans le cas des administrateurs backOffice
 */
public class User {
	private String login;
	private String password;
	private String nom;
	private String prenom;
	
	public User(){
		
	}
	
	public User(final String nom,final String prenom,final String login,final String password){
		this.nom = nom;
		this.prenom = prenom;
		this.login = login;
		this.password = password;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getNom() {
		return nom;
	}
	
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public String getPrenom() {
		return prenom;
	}
	
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	
}
