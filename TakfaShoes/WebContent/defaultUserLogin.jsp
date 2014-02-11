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
		 		<a style="font-family: Helvetica;font-size: 22; color: #000000">Identifiez-vous</a>
			</p>
			
			<!-- Form login -->
			<center>
			<form action="DefaultLoginServlet" method="post" name="connexion">
				<table style="border-color:#ffffff;font-family: Helvetica;font-size: 11;color: #c600ff" >
				<tr><td><label>Login</td></label><br/></tr>
				<tr colspan="2" style="width: 200px"><td> <input type="text" name="login" maxlength='40' size='40'></td></tr>
				<tr><td><label >Mot de passe</td><td> </label><br/></td></tr>
				<tr colspan="2" style="width: 200px"><td><input type="password" name="mdp" maxlength='40' size='40'></td></tr>
				<tr align="left"><td><input type="submit" value="connexion" name="submit"> </td></tr>
				</table>
				<br>
				<p style="font-family: Helvetica;font-size: 11"> Vous n'avez pas encore de compte ? vous pouvez vous inscrire<a href="defaultUserSubscribe.jsp"> ici </a>
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
