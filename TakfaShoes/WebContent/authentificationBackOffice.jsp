<%@ page
	import="java.util.*,servlets.*,Manager.*,Entities.*,BdHandler.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body >
<jsp:useBean id="user" class="Entities.User" scope="session" />
<%request.getSession().removeAttribute("user");
System.out.print("user back = "+request.getAttribute("user"));
%>

<center> <img src="http://cdn1.iconfinder.com/data/icons/token/Token,%20128x128,%20PNG/Lock.png"></center>
<br>
<center><form action="LoginServlet" method="post" name="connexion">
	<table style="border-color:#ffffff;font-family: Helvetica;font-size: 10">
	<tr><td><label>Login</td></label><br/></tr>
	<tr colspan="2" style="width: 200px"><td> <input type="text" name="login" maxlength='40' size='40'></td></tr>
	<tr><td><label >Mot de passe</td><td> </label><br/></td></tr>
	<tr colspan="2" style="width: 200px"><td><input type="password" name="mdp" maxlength='40' size='40'></td></tr>
	<tr align="left"><td><input type="submit" value="connexion" name="submit"> </td></tr>
	</table>
	<br>
	<p style="font-family: Arial;font-size: 10"> Vous n'avez pas encore de compte ? vous pouvez vous inscrire<a href="sign.html"> ici </a>
</form></center>
</body>
</html>