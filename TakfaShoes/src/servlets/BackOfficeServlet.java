package servlets;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Entities.Article;
import Entities.Panier;
import Entities.User;
import Manager.ProductManager;
import Manager.UserManager;

/**
 * Servlet implementation class BasketActionServlet
 * @author Takfarinas
 * Servlet BackOfficeServlet gérant toute la partie backOffice 
 * La particularité de cette classe c'est qu'elle fait référence 
 * à 2 sessions : L'une pour enregistrer spécifiquement un utilisateur
 * ou administrateur qui s'est loggué. La deuxième stocke les informations
 * des articles selectionnés notamment dans le cas de la modification de produit
 * et permet ainsi de retrouver le produit en question au passage à l'écran affilié 
 * à cette tache et de le modifier. 
 */
public class BackOfficeServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	//Déclaration d'un ProductManager pour effectuer les appels en base relatifs aux produits
	private ProductManager pm = new ProductManager();
	//Déclaration d'un UserManager pour effectuer les appels en base relatifs aux utilisateurs loggués
	private UserManager um = new UserManager();
	//Déclaration d'une chaine servant à stocker l'id du produit selectionné
	public String selectedArticleId;
	public String selectedArticleDispo;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
		
		//Déclaration d'une session pour pouvoir lui attribuer les attributs "panierBack" et "user"
	    HttpSession session=request.getSession();
	    //Récupération de l'identifiant de la personne connectée en utilisant l'url 
	    String idLog = request.getParameter("id");
	    //Déclaration  d'objets Panier et User en utilisant les sessions et les Beans
	    Panier panier=(Panier)session.getAttribute("panierBack");
	    User user = (User)session.getAttribute("user");
	    
	    //Si la référence du panier récupérée n'est pas null
	    if (panier==null) {
	      //J'instancie un nouveau Panier et je renseigne un attribut de la session
	      panier=new Panier();
	      session.setAttribute("panierBack",panier);
	    }
	    
        //Le paramètre "action" permet de définir le choix d'action qu'on veut effectuer au niveau de l'interface
	    //On récupère d'abord le paramètre depuis le fichier jsp
	    String action = request.getParameter("action");
	    //On check si ce n'est pas null
    	if (action !=null ){
    		// Si c'est bon, alors quatres cas se presentes. 
    		
    		/**
    		 * dans le cas de "Supprimer", on supprime le produit de la liste 
    		 * et également en base de données. la page est ensuite raffraichit 
    		 * pour constater le résultat de l'operation
    		 */
		    if (action.equals("Supprimer")){
		    	try {
					pm.delProduct(request.getParameter("articleId"));
				} catch (NumberFormatException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		    	getServletContext().getRequestDispatcher("/produits.jsp").forward(request,response);
		    }
		    /**
    		 * dans le cas de "Ajouter", une nouvelle page présentant un formulaire 
    		 * s'affiche et nous invite à ajouter un nouveau produit en base de données. 
    		 *  la page est ensuite raffraichit et redirigée vers la liste des produits
    		 * pour constater le résultat de l'operation
    		 */
		    else if (action.equals("Ajouter")){
		    	try {
					pm.addProduct(request.getParameter("name"), request.getParameter("price"), request.getParameter("pic"),request.getParameter("dispo"));
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
		    	getServletContext().getRequestDispatcher("/produits.jsp").forward(request,response);
		    }
		    
		 /**
    		 *  dans le cas de "toModif" ensuite de "editProduct", une nouvelle page présentant un formulaire 
    		 *  s'affiche et nous invite à modifier les informations d'un produit en base de données. 
    		 *  la page est ensuite raffraichit et redirigée vers la liste des produits
    		 *  pour constater le résultat de l'operation
    		 */
		    else if (action.equals("toModif")){
		    	selectedArticleId = request.getParameter("articleId");
		    	selectedArticleDispo = request.getParameter("articleDispo");
			    Article article=new Article(request.getParameter("article"),request.getParameter("articlePrice"),request.getParameter("articlePic"));
		    	//ici on renseigne l'id de l'article avec son id respectif 
			    article.setId(selectedArticleId);
			    article.setDispo(selectedArticleDispo);
		    	panier.add(article);
		    	getServletContext().getRequestDispatcher("/produitsModifForm.jsp").forward(request, response);
		    }
		   
		    else if (action.equals("AjouterMarque")){
		    	try {
					pm.addProductMarque(request.getParameter("name"));
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
		    	getServletContext().getRequestDispatcher("/produits.jsp").forward(request,response);
		    }
		    
		    if (action.equals("editProduct")){
		    	System.out.println("selectedArticleId = "+selectedArticleId);
		    	System.out.println("selectedArticleDispo = "+selectedArticleDispo);
		    	try {
		    		//Edition du produit à l'aide notamment de son id récupéré à l'écran précédent
					pm.editProduct(selectedArticleId, request.getParameter("name"), request.getParameter("price"), request.getParameter("pic"),request.getParameter("dispo"));
				} catch (SQLException e) {
					e.printStackTrace();
				}
		    	getServletContext().getRequestDispatcher("/produitsModif.jsp").forward(request,response);
		    }
    	}
    	//Si l'action est null, autrement dit, si on vient juste d'arriver
    	//depuis la page d'authentification, alors un nouvel utilisateur est créée 
    	//en ayant recours à son id pour trouver ses informations en base. L'utilisateur
    	//est ensuite ajoutée à la session et on forward directement vers le fichier 
    	//produits.jsp qui affiche la liste des articles 
    	else{
    		if (user == null){
    	    	try {
    	    		user = new User();
    				user = um.findGetUser(idLog);
    				session.setAttribute("user",user); //avant
    				//session.setAttribute(User.getNom(),user);
    			}   catch (SQLException e) {
    				e.printStackTrace();
    			}
    	    }
    		 getServletContext().getRequestDispatcher("/produits.jsp").forward(request,response);
    	}
	    
	  } 
}

