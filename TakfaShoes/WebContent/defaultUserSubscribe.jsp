<%@ page
	import="java.util.*,servlets.*,Manager.*,Entities.*,BdHandler.*"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type='text/javascript'>
function notEmpty(elem, msg){
	if(elem.value.length == 0){
		alert(msg);
		elem.focus();
		return false;
	}
	return true;
}
function checkForm(){
	if (document.getElementById('mdpInput').value.length == 0 && document.getElementById('logInput').value.length == 0){
		alert("Aucune saisie effectuée !");
		document.getElementById('checkFormInput').setAttribute('name','pb');
		document.getElementById('checkFormInput').value = "";
	}
	else
	if (document.getElementById('logInput').value.length == 0){
		alert("Champ obligatoire ! Veuillez saisir un login");
		document.getElementById('checkFormInput').setAttribute('name','pb');
		document.getElementById('checkFormInput').value = "";
	} 
	else
	if (document.getElementById('mdpInput').value.length == 0){
		alert("Champ obligatoire ! Veuillez saisir un mot de passe");
		document.getElementById('checkFormInput').setAttribute('name','pb');	
		document.getElementById('checkFormInput').value = "";
	}
	else{
		document.getElementById('checkFormInput').setAttribute('name','ok');
		document.getElementById('checkFormInput').value = "ok";
	}
}
</script>
<title>Inscription</title>

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
		 		<a style="font-family: Helvetica;font-size: 22; color: #000000">Inscrivez-vous</a>
			</p>
			
			<!-- Form Subscribe -->
			<center>
			<form action="LoginServlet" method="post" name="inscription">
				<table style="border-color:#ffffff;font-family: Helvetica;font-size: 11;color: #c600ff">
					<tr><td><label>Nom </td><td> <input type="text" name="name" id="nameInput"></label><br/></td></tr>
					<tr><td><label>Prenom </td><td> <input type="text" name="fname" id="fnameInput"></label><br/></td></tr>
					<tr><td><label>Login </td><td> <input type="text" name="login" id="logInput"></label>*<br/></td></tr>
					<tr><td><label>Mot de passe </td><td> <input type="password" name="mdp" id="mdpInput"></label>*<br/></td></tr>
					<tr><td><label>Photo </td><td> <input type="file" name="photo"></label><br/></td></tr>		
					<tr><td></td><td><input type="submit" value="inscription" name="submit" onclick="checkForm()"></td></tr>
					<tr><td><label></td><td> <input type="hidden" id="checkFormInput"></label><br/></td></tr>
				</TABLE>
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
