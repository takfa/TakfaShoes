package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Entities.Article;
import Entities.Panier;
import Entities.User;

/**
 * @author Takfarinas
 * Classe Servlet gérant la partie panier
 */
public class PanierServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	//Méthode doPost utilisée ici car les communications se font en POST avec les fichiers jsp
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
		
		//Déclaration d'une session pour pouvoir lui attribuer l'attribut "panier"
	    HttpSession session=request.getSession();
	    //Déclaration  d'un objet Panier en utilisant les sessions et les Beans
	    Panier panier=(Panier)session.getAttribute("panier");
	    User user = (User)session.getAttribute("defaultUser");
	    String adresse = request.getParameter("adresse");
		String cp = request.getParameter("cp");
	    
	    //Si la référence du panier récupérée n'est pas null
	    if (panier==null) {
	      //J'instancie un nouveau Panier et je renseigne un attribut de la session
	      panier=new Panier();
	      session.setAttribute("panier",panier);
	    }
	    
	    //Déclaration et instanciation d'un nouvel Article à l'aide des informations communauquées par le fichier jsp (champs hidden)
	    Article article=new Article(request.getParameter("article"),request.getParameter("articlePrice"),request.getParameter("articlePic"));
	    article.setMarque(request.getParameter("articleMarque"));
	    article.setPointure(request.getParameter("pointureSelect"));
	    System.out.println(request.getParameter("pointureSelect"));
	    article.setDispo(request.getParameter("articleDispo"));
	    System.out.println("panierServlet dispo = "+request.getParameter("articleDispo"));
	    //Le paramètre "action" permet de définir l'action sur le panier
	    //On récupère d'abord le paramètre depuis le fichier jsp
	    String action = request.getParameter("action");
	   
	    if (action != null){
	    //Si le paramètre se nomme "AJouter" alors on ajoute l'article au Panier
	    if (action.equals("Ajouter")){
	    	panier.add(article);
	    	//Je "forward" ensuite vers la page panier.jsp	
		    getServletContext().getRequestDispatcher("/panier.jsp").forward(request,response);
	    }
	    //Sinon, on le retire du panier
	    else if (action.equals("Enlever")){
	    	panier.remove(article);
	    	//Je "forward" ensuite vers la page panier.jsp	
		    getServletContext().getRequestDispatcher("/panier.jsp").forward(request,response);
	    }
	    else if (action.equals("NextStep")){
	    	System.out.println("PanierServlet : user ="+user.getLogin());
	    	//si le user est connecté
	    	if (user.getLogin() != null){
	    		System.out.println("PanierServlet : user connecté");
	    		getServletContext().getRequestDispatcher("/adresseForm.jsp").forward(request,response);
	    	}else{
	    		getServletContext().getRequestDispatcher("/defaultUserLogin.jsp").forward(request,response);
	    	}
	    	
	    } else if (action.equals("adresseOk")){
	    	getServletContext().getRequestDispatcher("/fraisPortForm.jsp").forward(request,response);
	    	System.out.println("adresse = "+adresse);
	    	request.setAttribute("adresse", adresse);
	    	request.setAttribute("cp", cp);
	    }
	    else if (action.equals("adresseNo")){
	    	getServletContext().getRequestDispatcher("/adresseForm.jsp").forward(request,response);
	    	
	    }
	    
	  } 
	}
}

