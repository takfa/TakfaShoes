package servlets;


import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entities.User;
import Manager.UserManager;

/**
 * Servlet implementation class LoginServlet
 * @author Takfarinas
 */
public class DefaultLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserManager userManager; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DefaultLoginServlet() {
        super();
        //Instantiation d'un userManager pour pouvoir effectuer les opérations en base concernant les utilisateurs
        userManager = new UserManager();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	//Récupération des paramètres des fichiers html
    	String nom = request.getParameter("name");
		String pnom = request.getParameter("fname");
		//String photo_url = request.getParameter("photo");
    	String login = request.getParameter("login");
		String password = request.getParameter("mdp");
		String btnSubmit = request.getParameter("submit");
		String signFormMsg = request.getParameter("ok");
		
		if(btnSubmit!=null){
			if(login!=null && password!=null){
				//On regarde pour le cas de l'inscription
				if(btnSubmit.equals("inscription")){
					//Si les données du formulaires sont bien saisies alors on crée un nouvel utilisateur
					if (signFormMsg!=null) {
						//Et on l'ajoute en base en appelant la méthode add() du userManager
						try {
							userManager.add(new User(nom,pnom,login, password));
						} catch (SQLException e) {
							e.printStackTrace();
						}
						//On affiche la page de redirection vers la page d'accueil
						getServletContext().getRequestDispatcher("/signConfirm.html").forward(request,response);
					}else{
						//Si les données du formulaires ne sont pas correctes, alors on reste au niveau de la page d'inscription
						getServletContext().getRequestDispatcher("/sign.html").forward(request,response);
					}
				}
				//On regarde maintenant pour le cas de la connexion
				else if(btnSubmit.equals("connexion")){
					//On regarde en base de données si l'utilisateur existe en appelant la méthode findByLogin() du userManager
					try {
						if (userManager.findByLogin(login, password)){
							//si c'est le cas alors on avance vers la page de chat
							getServletContext().getRequestDispatcher("/ProductFichServlet?id="+login).forward(request,response);
						}else {
							//Sinon, on affiche la page d'erreur
						    getServletContext().getRequestDispatcher("/pageErreur.html").forward(request,response);
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}else{
				 getServletContext().getRequestDispatcher("/authentification.html").forward(request,response);
			}
		}
	}
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
	
}
