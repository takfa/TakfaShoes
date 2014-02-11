<%@ page
	import="java.util.*,servlets.*,Manager.*,Entities.*,BdHandler.*"%>
<html>
<head>
<style type="text/css">
#milieu {
	width: 948px;
	clear: both;
	padding: 0px 0px;
}

#tout {
	width: 948px;
	margin: 0 auto;
	background: none repeat scroll 0 0 #FFFFFF;
	border-width: 0px 1px;
}

#list {
	padding: 0;
	margin: 0;
	color: #fff;
	font-family: arial, helvetica, sans-serif;
	white-space: nowrap;
	list-style-type: none;
	list-style: none outside none;
	padding: 0 0 20px;
}

#list li {
	display: inline;
}

#list li a {
	padding: 0.3em;
	background: #ffffff;
	text-decoration: none;
	float: left;
	border: 2px solid #fff;
}

#list li a:hover {
	background: #fff;
	color: #fff;

.MyLink { COLOR: white; TEXT-DECORATION: none; }
.MyLink:hover { TEXT-DECORATION: underline; }

}
</style>

</head>
<body bgcolor="white">
	<!-- Utilisation d'un Bean pour faire le lien entre la classe Panier et la session -->
	<jsp:useBean id="panier" class="Entities.Panier" scope="session" />
	<jsp:useBean id="marque" class="Entities.Marque" scope="session" />
	<jsp:useBean id="user" class="Entities.User" scope="session" />
	<jsp:useBean id="defaultUser" class="Entities.User" scope="session" />
	
	<%
		//variable total servant à calculer le montant total du panier
		int total = 0;
		//Calcul du prix total en parcurant l'ensemble et du panier et en additionant le tout
		for (Iterator<Article> it = panier.iterator(); it.hasNext();) {
			Article article = (Article) it.next();
			total += article.getPrice();
		}
		//Suprression de la session de l'admin qui s'est déconnecté
		request.getSession().removeAttribute("user");
		// request.getSession().removeAttribute("user");
	%>
	<div id="tout">
	<!-- Header -->
		<div id="header_top">
			<a href="articles.jsp"> <img src="http://127.0.0.1/images/logo_shoes2.png"></a>
		</div>
		<div align="right">
			<a style="font-family: Helvetica; font-size: 11"> livraison
				gratuite en France m&eacute;tropolitaine </a>
		</div>
		<div id="header" align="left"
			style="border-top: 5px solid #cc00ff; clear: both; overflow: hidden; padding-top: 20px; margin-top: 5px">
			<p
				style="font-family: Helvetica; font-size: 11; color: #c600ff; margin-top: -10px">
				Bienvenue, vous avez
				<%=panier.panierSize()%>
				produit(s) dans <a href="panier.jsp" style="color: #c600ff">votre
					panier</a>
			</p>
			<%if (defaultUser.getLogin() != null){%>
			
			<form name="logOutForm" method="POST" action="ProductFichServlet">
			<p style="font-family: Helvetica; font-size: 11; color: #c600ff">
		 		<a  style="color: #c600ff;">Bonjour <%=defaultUser.getLogin() %></a> </p>
		 		<p style="font-family: Helvetica; font-size: 11; color: #c600ff"><input type="image" src="http://127.0.0.1/images/logout.png" Value=submit align="middle" >  Se d&eacute;connecter </p>
		 		<input type="hidden" name="action" value="logout">
				</p>
				</form>
			
			<%}else {%>
			<p style="font-family: Helvetica; font-size: 11; color: #c600ff">
		 		<a style="padding-right: 5px"><img src="http://127.0.0.1/images/puce_login.png"><a class="MyLink" href="defaultUserLogin.jsp" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'" style="color: #c600ff;">Identifiez-vous</a></p>
			</p>
			<%}%>
		</div>
		
		<div id="marques" align="center" style="margin-top: 10px;margin-bottom: 10px"> 
			<img src="http://127.0.0.1/images/shoes_marques2.png">
		</div>

		<form name="selectForm" method="POST" action="ProductFichServlet">
			<select name="select" style="width: 200px; font-size: 11px">

				<option value="0">Marques</option>
				<%
					ProductManager pm = new ProductManager();
					ArrayList<String> marques = pm.getAllMarques();
					for (int i = 0; i < marques.size(); i++) {
				%>
				<option value=<%=marques.get(i).split(";;")[0]%>><%=marques.get(i).split(";;")[1]%></option>

				<%
					}
				%>
			</select> <input type=submit Value=ok align="middle"> <input
				type="hidden" name="action" value="refreshWithNewValues">
		</form>
		<div>
			<center>
				<ul id="list">
					<%
						//Création d'articles avec les informations récupérées directement depuis la base de donnés
						//et renseignement des champ "hidden" pour communiquer les valeurs à la servlet 
						// ProductManager pm = new ProductManager();
						System.out.println("marque = " + request.getAttribute("marque"));
						ArrayList<String> produits;
						if (request.getAttribute("marque") == null
								|| request.getAttribute("marque").equals("0")) {
							produits = pm.getAllProducts();
						} else {
							produits = pm.getProductsByMarqId(request
									.getAttribute("marque").toString());
						}
						//ArrayList<String> produits = pm.getAllProducts();
						for (int i = 0; i < produits.size(); i++) {
							Article article = new Article(produits.get(i).split(";;")[0],
									produits.get(i).split(";;")[1], produits.get(i).split(
											";;")[2]);
							article.setId(produits.get(i).split(";;")[3]);
							article.setMarque(produits.get(i).split(";;")[4]);
							article.setDispo(produits.get(i).split(";;")[5]);
					%>
					<li><a title=<%=article.getName()%>>
							<form name="addForm" action="ProductFichServlet" method="POST">
								<input type="hidden" name="article"
									value="<%=article.getName()%>"> <input type="hidden"
									name="articlePrice" value="<%=article.getPrice()%>">
								<input type="hidden" name="articlePic"
									value="<%=article.getPic()%>"> <input type="hidden"
									name="articleId" value="<%=article.getId()%>"> <input
									type="hidden" name="articleMarque"
									value="<%=article.getMarque()%>">
									<input
									type="hidden" name="articleDispo"
									value="<%=article.getDispo()%>"> 
									 <input border=0
									src="<%=article.getPic()%>" type=image Value=submit
									align="middle"> <input type="hidden" name="action"
									value="toProductFich">
							</form>
					</a></li>
					<%
						}
					%>
				</ul>
			</center>
		</div>
		<!-- Footer -->
		<div  align="left"
			style="border-top: 5px solid #ffffff; clear: both; overflow: hidden; padding-top: 20px; margin-top: 5px">
			
		</div>
		
		<div id="footer" >
			<table style="text-align:center;background-color: #c600ff;width: 948px;margin-top: 20px;font-family: Helvetica; font-size: 11; color: #ffffff ">
			<tr>
			<td style="width: 550px;text-align:right;"><a href="#" style="text-decoration: none;color: #ffffff" >Conditions g&eacute;n&eacute;rales de vente </a></td>
			<td style="width: 350px;text-align:right"> <a >Powered by </a></td>
			<td style="text-align:right"> <a > <img src="http://127.0.0.1/images/logo_takfa.png"></a></td>
			</tr>	
			</table>
		</div>

	</div>
</body>
</html>
