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
	<%
		//Initialisation d'un paramètre total représentant le montant total du panier
		int total = 0;
	System.out.println(" infos adresse = "+request.getSession().getAttribute("adresse"));
	%>
	<div id="tout">
	<!-- Header -->
		<div id="header_top">
			<a href="articles.jsp"> <img
				src="http://127.0.0.1/images/logo_shoes2.png"></a>
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
			
			<p>
		 		<a style="font-family: Helvetica;font-size: 22; color: #000000">Mode de paiment</a>
			</p>
			
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
			
			<!-- Form livreur -->
			
			<form action="PanierServlet" method="post" name="inscription">
				<table style="border-color:#ffffff;font-family: Helvetica;font-size: 11;color: #c600ff;margin-top: 20px">
					<tr >
					<td ><input type="radio" name="group1" value="cb" checked="checked"></td>
					<td ><img src="http://127.0.0.1/images/Visa.png"></td>
					</tr>
					
					<tr >
					<td ><input type="radio" name="group1" value="master"></td>
					<td ><img src="http://127.0.0.1/images/Mastercard.png"></td>
					</tr>
					
					<tr >
					<td ><input type="radio" name="group1" value="pp"></td>
					<td ><img src="http://127.0.0.1/images/PayPal.png"></td>
					</tr>
					
				</table>
				<center>
				<table style="width: 948px;margin-top: 20px" >
				<tr style="width: 948px">
				<td style="text-align: right"><img src="http://cdn1.iconfinder.com/data/icons/fatcow/32x32_0240/cog_edit.png"></td>
				<td style="text-align: left"><p style="font-family: Helvetica; font-size: 12">
					<a href="panier.jsp" style="text-decoration: none;"> Faire une modification</a></p>
				</td>
				<% if (panier.panierSize() > 0){%>
				<td style="text-align: right"><img src="http://cdn1.iconfinder.com/data/icons/sketchdock-ecommerce-icons/ok-green.png"></td>
				<td style="text-align: left"><p style="font-family: Helvetica; font-size: 12">
					<a href="commandeConfirm.jsp" style="text-decoration: none;"> Finaliser et valider la commande</a></p>
				</td>
				<% }%>
				</tr>
				</table>
				</center>
				
			</form>
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
	</div>
	

</body>
</html>
