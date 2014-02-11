package Manager;

import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import BdHandler.DBAcces;
import Entities.User;


/**
 * 
 * @author Takfarinas
 *Manager de la classe User disposant de méthodes 
 *pour les appels en base notamment
 */
public class UserManager {
	private static DBAcces db;
	static private final String ADD = "INSERT INTO user VALUES (NULL,?,?,?,?)";

	public UserManager(){
		db = new DBAcces();
		try {
			db.initConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public User add(User user) throws SQLException {
			PreparedStatement preparedStatement = db.envoiRequeteSet(ADD);
			preparedStatement.setString(1, user.getNom());
			preparedStatement.setString(2, user.getPrenom());
			preparedStatement.setString(3, user.getLogin());
			preparedStatement.setString(4, user.getPassword());
			preparedStatement.executeUpdate();
			System.out.println("ajout user"+user.getNom()+";;"+user.getPrenom());
			return user;
	}
	
	public Boolean findByLogin(String login,String password) throws SQLException{
		String requete = "SELECT * FROM user WHERE login ='"+login+"' AND password='"+password+"'";
		ResultSet resultat = db.envoiRequeteGet(requete);
		String retour=null;
		while(resultat.next()) {
			retour += resultat.getInt(1)+";;"+resultat.getString(2);
			System.out.println(retour);
		}
		resultat.close();
		if (retour != null){
			return true;
		}
		//System.out.println(retour);
		return false;
	}
	
	public Boolean findByLoginAdmin(String login,String password) throws SQLException{
		String requete = "SELECT * FROM user WHERE login ='"+login+"' AND password='"+password+"'";
		ResultSet resultat = db.envoiRequeteGet(requete);
		String retour=null;
		while(resultat.next()) {
			retour += resultat.getInt(1)+";;"+resultat.getString(2)+";;"+resultat.getString(6);
			System.out.println("findByLoginAdmin = "+retour);
		}
		resultat.close();
		if (retour != null){
			if (retour.split(";;")[2].equals("1")){ //si l'utlisateur est admin
			return true;
			}
		}
		System.out.println(retour);
		return false;
	}
	
	public User findGetUser(String id) throws SQLException{
		String requete = "SELECT * FROM user WHERE login ='"+id+"'";
		ResultSet resultat = db.envoiRequeteGet(requete);
		String retour=null;
		while(resultat.next()) {
			retour += resultat.getInt(1)+";;"+resultat.getString(2)+";;"+resultat.getString(3)+";;"+resultat.getString(4)+";;"+resultat.getString(5);
			System.out.println(retour);
		}
		resultat.close();
		User user = new User(retour.split(";;")[1],retour.split(";;")[2],retour.split(";;")[3],retour.split(";;")[4]);
		return user;
	}
}

