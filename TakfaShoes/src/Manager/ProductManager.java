package Manager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import BdHandler.DBAcces;
import Entities.Article;

/**
 * 
 * @author Takfarinas
 *Manager de la classe Article disposant de méthodes 
 *pour les appels en base notamment
 */
public class ProductManager {
	private static DBAcces db;	
	
	public ProductManager(){
		db = new DBAcces();
		try {
			db.initConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//Méthode qui récupère un produit selon son nom
	public Article findGetProduct(String name) throws SQLException{
		String requete = "SELECT * FROM produit  WHERE name ='"+name+"'";
		ResultSet resultat = db.envoiRequeteGet(requete);
		String retour=null;
		while(resultat.next()) {
			retour += resultat.getInt(1)+";;"+resultat.getString(2)+";;"+resultat.getInt(3)+";;"+resultat.getString(4);
			System.out.println(retour);
		}
		resultat.close();
		Article article = new Article(retour.split(";;")[1],retour.split(";;")[2],retour.split(";;")[3]);
		article.setId(retour.split(";;")[0]);
		return article;
	}
	
	//méthode qui récupère l'ensemble des articles en base
	public ArrayList<String> getAllProducts() throws SQLException {
		String requete = "SELECT * FROM produit ORDER BY prix ASC";
		ResultSet resultat = db.envoiRequeteGet(requete);
		ArrayList<String>  retour=new ArrayList<String>();
		while(resultat.next()) {
			retour.add(resultat.getString(2)+";;"+resultat.getString(3)+";;"+resultat.getString(4)+";;"+resultat.getString(1)+";;"+resultat.getString(5)+";;"+resultat.getString(6));	
		}
		System.out.println(retour.toString());
		return retour;
	}
	
	//Fonction qui supprime un produit en base selon son id
	public void delProduct(String id) throws SQLException{
		String requete = "Delete FROM produit  WHERE id =?";
		PreparedStatement preparedStatement = db.envoiRequeteSet(requete);
		preparedStatement.setString(1, id);
		preparedStatement.executeUpdate();
		System.out.println("deleted");
	}
	
	//Fonction qui ajoute un produit en base
	public void addProduct(String name, String price, String pic, String dispo ) throws SQLException{
		String requete = "INSERT INTO produit  VALUES (default,?, ?, ?,?,?)";
		PreparedStatement preparedStatement = db.envoiRequeteSet(requete);
		preparedStatement.setString(1, name);
		preparedStatement.setString(2, price);
		preparedStatement.setString(3, pic);
		preparedStatement.setString(4, "0");
		preparedStatement.setString(5, dispo);
		preparedStatement.executeUpdate();
		System.out.println("added");
	}
	
	//Fonction qui ajoute un produit en base
		public void addProductMarque(String name ) throws SQLException{
			String requete = "INSERT INTO marque  VALUES (default,?)";
			PreparedStatement preparedStatement = db.envoiRequeteSet(requete);
			preparedStatement.setString(1, name);
			preparedStatement.executeUpdate();
			System.out.println("added marque");
		}
	
	//Fonction qui modifie un produit en base selon son id
	public void editProduct(String id,String name, String price, String pic, String dispo) throws SQLException{
		String requete = "UPDATE produit SET name='"+name+"', prix='"+price+"', pic='"+pic+"', dispo='"+dispo+"' WHERE id='"+id+"'";
		PreparedStatement preparedStatement = db.envoiRequeteSet(requete);
		preparedStatement.executeUpdate();
		System.out.println("edited");
	}
	
	public ArrayList<String> getProductsByMarqId(String id) throws SQLException{
		String requete = "SELECT * FROM produit WHERE marque='"+id+"' ORDER BY prix ASC";
		ResultSet resultat = db.envoiRequeteGet(requete);
		ArrayList<String>  retour=new ArrayList<String>();
		while(resultat.next()) {
			//le dernier élément étant la marque du produit
			retour.add(resultat.getString(2)+";;"+resultat.getString(3)+";;"+resultat.getString(4)+";;"+resultat.getString(1)+";;"+resultat.getString(5)+";;"+resultat.getString(6));	
		}
		System.out.println(retour.toString());
		return retour;
		
	}
	
	public ArrayList<String> getAllMarques() throws SQLException{
		
		String requete = "SELECT * FROM marque";
		ResultSet resultat = db.envoiRequeteGet(requete);
		ArrayList<String>  retour=new ArrayList<String>();
		while(resultat.next()) {
			//le dernier élément étant la marque du produit
			retour.add(resultat.getString(1)+";;"+resultat.getString(2));	
		}
		System.out.println(retour.toString());
		return retour;
		
	}
	
	public ArrayList<String> getMarqueById(String id) throws SQLException{
		
		String requete = "SELECT * FROM marque WHERE id='"+id+"'";
		ResultSet resultat = db.envoiRequeteGet(requete);
		ArrayList<String>  retour=new ArrayList<String>();
		while(resultat.next()) {
			//le dernier élément étant la marque du produit
			retour.add(resultat.getString(2));	
		}
		return retour;
	}

}
