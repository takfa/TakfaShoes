<%@ page
	import="java.util.*,servlets.*,Manager.*,Entities.*,BdHandler.*"%>
<html>
<head>
<META HTTP-EQUIV="Refresh" CONTENT="3;URL=articles.jsp">
<title>Confirmation de commande</title>
</head>
<body>
<jsp:useBean id="panier" class="Entities.Panier" scope="session" />
<%
	//On vide le panier en fin de commande
		request.getSession().removeAttribute("panier");
	%>
<br><p>Commande effectu&eacute;e avec succ&egrave;s. Redirection &agrave; la page d'accueil...</p>
</body>
</html>