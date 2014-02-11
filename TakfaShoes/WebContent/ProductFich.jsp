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
	background: #dddddd;
	text-decoration: none;
	float: left;
	border: 2px solid #fff;
}

#list li a:hover {
	background: #08c;
	color: #fff;
}
</style>

</head>

<body bgcolor="white">
	<!-- Utilisation d'un Bean pour faire le lien entre la classe Panier et la session -->
	<jsp:useBean id="panier" class="Entities.Panier" scope="session" />
	<jsp:useBean id="panierSelectedHome" class="Entities.Panier"
		scope="session" />
		<jsp:useBean id="defaultUser" class="Entities.User" scope="session" />
	<%
		//variable total servant Ã  calculer le montant total du panier
		int total = 0;

		//Calcul du prix total en parcurant l'ensemble et du panier et en additionant le tout
		for (Iterator<Article> it = panier.iterator(); it.hasNext();) {
			Article articlePanier = (Article) it.next();
			total += articlePanier.getPrice();
		}

		//Article passé en paramètre 
		Article article = null;
		for (Iterator<Article> it = panierSelectedHome.iterator(); it
				.hasNext();) {
			article = (Article) it.next();
			System.out.println(article.getId() + ";;" + article.getMarque()+";;"+article.getDispo());
		}
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
	<!-- fin Header -->
		
		
		<div>

			<img
				src="<%=article.getPic().split("medium")[0] + "large"
					+ article.getPic().split("medium")[1]%>">
		</div>

		<div>

			<table style="background-color: #ffffff;"3">
				<tr>
					<td valign="top"><span
						style="color: #000000; font-family: Helvetica; font-size: 22"><b><%=article.getName()%></b></span><br>
					</td>
				</tr>
			</table>
		</div>
		<form name="addForm" action="PanierServlet" method="POST">
			<div>
				<p style="color: #000000; font-family: Helvetica; font-size: 11">
					<label">Pointure :</label> <select name="pointureSelect">
						<option selected="selected" value="40">40</option>
						<option value="42">42</option>
						<option value="43">43</option>
						<option value="44">44</option>
					</select>
				</p>
				<input type="hidden" name="article" value="<%=article.getName()%>">
				<input type="hidden" name="articlePrice"
					value="<%=article.getPrice()%>"> <input type="hidden"
					name="articlePic" value="<%=article.getPic()%>"> <input
					type="hidden" name="articleMarque"
					value="<%=article.getMarque()%>">
					<input
					type="hidden" name="articleDispo"
					value="<%=article.getDispo()%>">

				<table style="width: 948px;margin-top: -10px">
					<tr>
						<td style="width: 870px"><input border=0
							src="http://cdn1.iconfinder.com/data/icons/aspneticons_v1.0_Nov2006/shopping_cart_16x16.gif"
							type=image Value=submit align="middle"></td>
						<td style="width: 78px"><p
								style="font-family: Helvetica; font-style: bold; font-size: 30; color: #c600ff">
								<%=article.getPrice()%>
								&#x20AC;
							</p></td>
					</tr>
				</table>


			</div>


			<input type="hidden" name="action" value="Ajouter">
		</form>
		<br>
		<br>

		<!-- produits de la même marque -->
		<div  align="left"
			style="border-top: 5px solid #cc00ff; clear: both; overflow: hidden; padding-top: 20px; margin-top: 5px">
			<p
				style="font-family: Helvetica; font-size: 20; color: #c600ff; margin-top: -10px">
				<a style="color: #c600ff">Egalement disponible</a>
			</p>
		</div>

		<div id="sameCetegoryProducts" style="padding-bottom: 40px">
			<center>
				<ul id="list">
					<%
						//Création d'articles avec les informations récupérées directement depuis la base de donnés
						//et renseignement des champ "hidden" pour communiquer les valeurs à la servlet 
						// ProductManager pm = new ProductManager();
						ArrayList<String> produits;
						ProductManager pm = new ProductManager();
						produits = pm.getProductsByMarqId(article.getMarque());
						//ArrayList<String> produits = pm.getAllProducts();
						for (int i = 0; i < produits.size(); i++) {
							Article articleDispo = new Article(
									produits.get(i).split(";;")[0], produits.get(i).split(
											";;")[1], produits.get(i).split(";;")[2]);
							articleDispo.setId(produits.get(i).split(";;")[3]);
							articleDispo.setMarque(produits.get(i).split(";;")[4]);
							articleDispo.setDispo(produits.get(i).split(";;")[5]);
							System.out.println("ProductFich dispo = "+articleDispo.getDispo());
					%>
					<li><a title=<%=articleDispo.getName()%>>
							<form name="addForm" action="ProductFichServlet" method="POST">
								<input type="hidden" name="article"
									value="<%=articleDispo.getName()%>"> <input
									type="hidden" name="articlePrice"
									value="<%=articleDispo.getPrice()%>"> <input
									type="hidden" name="articlePic"
									value="<%=articleDispo.getPic()%>"> <input
									type="hidden" name="articleId"
									value="<%=articleDispo.getId()%>"> <input type="hidden"
									name="articleMarque" value="<%=articleDispo.getMarque()%>">
									<input type="hidden"
									name="articleDispo" value="<%=articleDispo.getDispo()%>">
								<input border=0 src="<%=articleDispo.getPic()%>" type=image
									Value=submit align="middle"> <input type="hidden"
									name="action" value="toProductFich">
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
	<br><br>
	</div>
</body>
</html>
