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

#navlist li {
	display: inline;
	list-style-type: none;
	padding-right: 20px;
	font-family: Helvetica;
	font-size: 11;
	font-style: italic
}
</style>

</head>
<body bgcolor="white">
	<!-- Utilisation d'un Bean pour faire le lien entre la classe Panier et la session -->
	<jsp:useBean id="panier" class="Entities.Panier" scope="session" />
	<jsp:useBean id="defaultUser" class="Entities.User" scope="session" />
	<%
		//Initialisation d'un paramètre total représentant le montant total du panier
		int total = 0;
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
		<h2 style="font-family: Helvetica; font-size: 20">R&eacute;capitulatif
			de la commande</h2>

		<div id="navcontainer" align="center">
			<ul id="navlist">
				<li><a>R&eacute;sum&eacute;</a></li>
				<li><a>Identifiez-vous</a></li>
				<li><a>Adresse</a></li>
				<li><a>Frais de port</a></li>
				<li><a>Paiement</a></li>
			</ul>
			<img src="http://127.0.0.1/images/steps.png"
				style="margin-top: -10px; margin-left: 18px">
		</div>

		<div align="center" style="margin-top: 20px">
			<table style="background-color: #000000; width: 948px; height: 15px;"0">
				<tr
					style="background-color: #000000; text-align: left; width: 948px;height: 15px;"7">
					<td style="text-align: center; width: 180px"><b><p
								style="font-family: Helvetica; font-size: 11; color: #ffffff">
								&nbsp;Produit</p></b></td>
					<td style="text-align: center; width: 500px"><b><p
								style="font-family: Helvetica; font-size: 11; color: #ffffff">
								&nbsp;Description</p></b></td>
					<td style="text-align: center; width: 60px"><b><p
								style="font-family: Helvetica; font-size: 11; color: #ffffff">
								&nbsp;Dispo</p></b></td>
					<td style="text-align: center; width: 60px"><b><p
								style="font-family: Helvetica; font-size: 11; color: #ffffff">
								&nbsp;Prix unitaire</p></b></td>
					<td style="text-align: center; width: 60px"><b><p
								style="font-family: Helvetica; font-size: 11; color: #ffffff">
								&nbsp;Qte</p></b></td>
					<td style="text-align: center; width: 60px"><b><p
								style="font-family: Helvetica; font-size: 11; color: #ffffff">
								&nbsp;Total</p></b></td>
				</tr>
			</table>
			<table style="background-color: #eeeeee;"1">
				<%
					for (Iterator<Article> it = panier.iterator(); it.hasNext();) {
						Article article = (Article) it.next();
				%>
				<tr style="background-color: white; width: 948px" valign="middle">
					<td style="text-align: center" width="178px"><img
						src="<%=article.getPic()%>"></td>
					<td width="500px"><p style="font-family: Helvetica">
							<p style="font-family: Helvetica">   <%=article.getName()%></p>
							<p style="font-family: Helvetica;font-size: 11"> Pointure :  <%=article.getPointure()%></p>
						</p></td>
					<td width="80px"><p
							style="color: #ff9c00; text-align: center; font-family: Helvetica; font-size: 12">
							<img
						src="http://127.0.0.1/images/<%=article.getDispo()%>.png">
						</p></td>
					<td width="80px"><p
							style="color: #ff9c00; text-align: center; font-family: Helvetica; font-size: 12">
							<b><%=article.getPrice()%> &#x20AC; </b>
						</p></td>
					<td style="text-align: center" width="50px">
						<form name="addForm" action="PanierServlet" method="POST">
							<input type="hidden" name="article"
								value="<%=article.getName()%>"> <input border=0
								src="http://cdn1.iconfinder.com/data/icons/uidesignicons/delete.png"
								type=image Value=submit align="middle"> <input
								type="hidden" name="action" value="Enlever">
						</form>
					</td>
					<td width="60px"><p
							style="color: #ff9c00; text-align: center; font-family: Helvetica; font-size: 12">
							<b><%=article.getPrice()%> &#x20AC; </b>
						</p></td>
				</tr>
				<%
					//Incrémentation du montant total
						total += article.getPrice();
					}
				%>
			</table>

			<table style="background-color: #eeeeee; width: 1380px"
				cellspacing="0">

				<tr>
					<td></td>
				</tr>
				<tr align="right" style="font-family: Helvetica;">
					<td><span style="font-size: 12">Total = </span><b> <span
							style="color: #007ee9; font-size: 16"><%=total%> &#x20AC;</span></b></td>
				</tr>
			</table>
		</div>
		<br> <br>
		<table style="width: 948px" >
		<tr style="width: 948px">
		<td style="width: 474px;text-align: left"><p style="font-family: Helvetica; font-size: 12">
			<a href="articles.jsp"><img src="http://cdn1.iconfinder.com/data/icons/customicondesignoffice5/16/go-back.png"></a> Continuer mes achats</p>
		</td>
		<% if (panier.panierSize() > 0){%>
		<td style="width: 474px;text-align: right">		
		
		<form name="nextForm" method="POST" action="PanierServlet">
			<p style="font-family: Helvetica; font-size: 12"><input type="image" src="http://127.0.0.1/images/next.png" Value=submit align="middle" >  Suivant </p>
		 		<input type="hidden" name="action" value="NextStep">
			</p>
		</form>	
			
		</td>
		<% }%>
		</tr>
		</table>
		
		<!-- Footer -->
		<div  align="left"
			style="border-top: 5px solid #ffffff; clear: both; overflow: hidden; padding-top: 10px; margin-top: 5px">
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
