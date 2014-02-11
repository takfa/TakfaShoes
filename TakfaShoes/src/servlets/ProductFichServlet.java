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
import Manager.UserManager;

/**
 * @author Takfarinas
 * Classe Servlet gérant la partie panier
 */
public class ProductFichServlet extends HttpServlet {

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
		Panier panier=(Panier)session.getAttribute("panierSelectedHome");
		Panier basket=(Panier)session.getAttribute("panier");
		String action = request.getParameter("action");
		String idLog = request.getParameter("id");
		User user = (User)session.getAttribute("user");
		//Si la référence du panier récupérée n'est pas null
		if (panier==null) {
			//J'instancie un nouveau Panier et je renseigne un attribut de la session
			panier=new Panier();
			session.setAttribute("panierSelectedHome",panier);
		}

		//Si la référence du panier récupérée n'est pas null
		if (basket==null) {
			//J'instancie un nouveau Panier et je renseigne un attribut de la session
			basket=new Panier();
			session.setAttribute("panier",basket);
		}
		if (action != null) {
			if (action.equals("refreshWithNewValues") ){
				System.out.println("action = refreshWithNewValues");
				request.setAttribute("marque", request.getParameter("select"));
				getServletContext().getRequestDispatcher("/articles.jsp").forward(request,response);
			} 
			else if (action.equals("toProductFich")){
				final String selectedArticleId = request.getParameter("articleId");
				final String selectedArticleMarque= request.getParameter("articleMarque");
				Article article=new Article(request.getParameter("article"),request.getParameter("articlePrice"),request.getParameter("articlePic"));
				//ici on renseigne l'id de l'article avec son id respectif et sa marque
				article.setId(selectedArticleId);
				article.setMarque(selectedArticleMarque);
				article.setDispo(request.getParameter("articleDispo"));
				System.out.println("ProductFichServlet dispo = "+request.getParameter("articleDispo"));
				panier.add(article);
				//panier.add(article);
				getServletContext().getRequestDispatcher("/ProductFich.jsp").forward(request,response);
			} else if (action.equals("logout")){
				System.out.println("action = logoutAction");
				request.getSession().removeAttribute("defaultUser");
				getServletContext().getRequestDispatcher("/articles.jsp").forward(request,response);
			}
		}else{
			//On crée la session du defaultUser
			if (!idLog.equals("")){
				if (user == null){
					try {
						user = new User();
						final UserManager um = new UserManager();
						user = um.findGetUser(idLog);
						session.setAttribute("defaultUser",user); 
					}   catch (SQLException e) {
						e.printStackTrace();
					}
					getServletContext().getRequestDispatcher("/articles.jsp").forward(request,response);
				}
			}
			
		}
	} 
}

