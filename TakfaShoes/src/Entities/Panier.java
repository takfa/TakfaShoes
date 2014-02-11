package Entities;

import java.util.ArrayList;
import java.util.Iterator;


/**
 * @author Takfarinas
 *Classe Panier stockant une liste d'articles
 *et disposant de méthodes basiques pour l'ajout
 *ou la suppression d'articles ou encore la récupéaration
 *de la liste des articles via un objet Iterator
 */

public class Panier {
	  
	  private final ArrayList<Article> list = new ArrayList<Article>();

	  public void add(Article article) {
	    list.add(article); 
	  }
	  public void remove(Article article) {
	    list.remove(article); 
	  }
	  public Iterator<Article> iterator() {
	    return list.iterator(); 
	  }
	  
	  public int panierSize(){
		  return list.size();
	  }
	  
}

