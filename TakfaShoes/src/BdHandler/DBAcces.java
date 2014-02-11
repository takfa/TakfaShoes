package BdHandler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 * 
 * @author Takfarinas
 *
 */
public class DBAcces {
	
	
	private Connection connection = null;
	private Statement statement = null;
	@SuppressWarnings("unused")
	private PreparedStatement preparedStatement = null;
	
	public void initConnection() throws Exception
	{
		//Chargement du driver MySQL
		 Class.forName("com.mysql.jdbc.Driver").newInstance();
		//Configuration de la connexion avec la base
		connection = DriverManager.getConnection("jdbc:mysql://localhost/webservletbd","root","");//Configuration par d�fault de wamp
		//un Statement pour des requ�tes de r�cup�ration d'infos en base
		statement = connection.createStatement();
		//un PreparedStatement pour des requ�tes de modification d'infos en base
		preparedStatement = connection.prepareStatement("");
	}
	
	//Fonction qui envoi une requete en base et retourne un objet ResultSet
	public ResultSet envoiRequeteGet(String requete) throws SQLException{
		ResultSet resultat = statement.executeQuery(requete);
		return resultat;
	}
	
	//Fonction qui envoi une requete en base et retourne un objet ResultSet
	public PreparedStatement envoiRequeteSet(String requete) throws SQLException{
		PreparedStatement action = connection.prepareStatement(requete);
		return action;
	}
	
}
