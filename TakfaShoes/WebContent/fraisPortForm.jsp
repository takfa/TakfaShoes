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
		//Initialisation d'un param�tre total repr�sentant le montant total du panier
		int total = 0;
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
		 		<a style="font-family: Helvetica;font-size: 22; color: #000000">Livraison - frais de port</a>
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
			<center>
			<form action="PanierServlet" method="post" name="inscription">
				<table style="border-color:#ffffff;font-family: Helvetica;font-size: 11;color: #c600ff;width: 800px;margin-top: 20px">
					<tr style="width: 800px">
					<td style="width: 10px"><input type="radio" name="group1" value="chrono" checked="checked"></td>
					<td style="width: 750px">Livraison par Chronopost (24 � 48h si disponible sinon +15 jours)</td>
					<td style="width: 50"><b> 8.90 &#x20AC;</b></td>
					</tr>
					
					<tr style="width: 800px">
					<td style="width: 10px"><input type="radio" name="group1" value="fedex"></td>
					<td style="width: 750px">Livraison par Fedex (24 � 48h si disponible sinon +15 jours)</td>
					<td style="width: 50"><b> 8.90 &#x20AC;</b></td>
					</tr>
					
				</table>
				<table style="width: 948px;margin-top: 20px" >
				<tr style="width: 948px">
				<td style="width: 474px;text-align: left"><p style="font-family: Helvetica; font-size: 12">
					<a href="panier.jsp"><img src="http://cdn1.iconfinder.com/data/icons/customicondesignoffice5/16/go-back.png"></a> Retour au panier</p>
				</td>
				<% if (panier.panierSize() > 0){%>
				<td style="width: 474px;text-align: right">		
					<p style="font-family: Helvetica; font-size: 12"><a href="paymentForm.jsp">  <img src="http://127.0.0.1/images/next.png"></a>Suivant </p>
				 		<input type="hidden" name="action" id="checkFormInput">
					</p>
				</td>
				<% }%>
				</tr>
				</table>
				
			</form>
			</center>
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
