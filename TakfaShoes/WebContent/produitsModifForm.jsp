<%@ page import="java.util.*,servlets.*,Manager.*,Entities.*,BdHandler.*" %>
<html><body bgcolor="white">
<jsp:useBean id="panierBack" class="Entities.Panier" scope="session"/>
  <jsp:useBean id="user" class="Entities.User" scope="session"/> 
  <%
       Article article=null;
	    for (Iterator<Article> it=panierBack.iterator();it.hasNext();) {
	      article= (Article) it.next();
	    }
	   %>  
   <div align="right"> 
		<table style="background-color:#ffffff; cellspacing="1">
		<tr>
		<td valign="middle" height="40" style="font-family: Arial;font-size: 12" ><a style="text-decoration: none" href="authentificationBackOffice.jsp"><span style="color: #ff9c00;" onmouseover="this.style.color = '#ff9c00';" onmouseout="this.style.color = '#000000';">Déconnexion</span></a></td>
		<td valign="middle" height="70"> <img src="http://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/playback_play.png"></td>
		<td valign="middle" height="40" style="font-family: Arial;font-size: 14" >Connecté en tant que <b><span style="color: #ff6600;"><%=user.getLogin() %></b> </span></a></td>
		
		 </tr>
		</table>
 	</div>
 
 <table>
 <tr>
 <td><img src="http://cdn1.iconfinder.com/data/icons/iconshock_developer/Gear.png"></td>
  <td valign="bottom"><p style="font-family: Helvetica;font-size: 22"> Espace de configuration <br><br></p></td>
 </tr>
 </table>
  
  <div>
  <div align="center"> 
		<table style="background-color:#ffffff; cellspacing="1">
			<tr>
				<td valign="middle" height="40" style="font-family: Arial;font-size: 12" ><a style="text-decoration: none" href="produitsAdd.jsp"> <img src="http://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/32x32/sq_plus.png"></a></td>
				<td valign="middle" height="70"> <img src="http://www.feracheval-megeve.com/img/separator_contact.jpg"></td>
				<td valign="middle" height="40" style="font-family: Arial;font-size: 12" ><a style="text-decoration: none" href="produits.jsp"> <img src="http://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/32x32/delete.png"></a></td>
				<td valign="middle" height="70"> <img src="http://www.feracheval-megeve.com/img/separator_contact.jpg"></td>
				<td valign="middle" height="40" style="font-family: Arial;font-size: 12" ><a style="text-decoration: none" href="produitsModif.jsp"> <img src="http://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/32x32/doc_edit.png"></a></td>
				<td valign="middle" height="70"> <img src="http://www.feracheval-megeve.com/img/separator_contact.jpg"></td>
				<td valign="middle" height="40" style="font-family: Arial;font-size: 12" ><a style="text-decoration: none" href="produitsAddMarque.jsp"> <img src="http://cdn1.iconfinder.com/data/icons/fatcow/32x32_0520/layout_add.png"></a></td>			</tr>
		</table>
 	</div>
  
  </div>
  
  <br><br>
  <center>
  
   <table style="background-color:#eeeeee;width: 1380px;font-size: 14;font-size: 12" cellspacing="1">
  <tr style="background-color:#a6dd41;text-align:center;width: 1000px" height="45">
  <td><b><p style="font-family: Helvetica">Formulaire de modification</p></b></td>
   </tr>
  </table>
  <br>
  <table style="background-color:#ffffff; cellspacing="3">
	<tr>
	<td rowspan="2" style="background-color:#ffffff;"><img src="<%=article.getPic().split("medium")[0]+"large"+article.getPic().split("medium")[1] %>">
	</td> 
	   <td valign="top"><span style="color: #0084ff;font-family: Helvetica;font-size: 18"><b><%=article.getName() %></b></span><br><p style="font-family: Arial;font-size: 26"><span style="color: #ff3000;"><b><%=article.getPrice()%> &#x20AC;</b></span></p> </td></tr>
  </table>
  
 <br><br>
       <form name="addForm" action="BackOfficeServlet" method="POST">
       <table boder="0" style="font-family: Helvetica;font-size: 12">
       <tr><td><label><b>Nouvelle référence</b></td><td> <input value=<%=article.getName() %> type="text" name="name" id="nameInput"></label><br/></td></tr>
		
		<tr><td><label><b>Nouveau prix</b></td><td> <input value=<%=article.getPrice() %> type="text" name="price" id="fnameInput"></label><br/></td></tr>
		<tr><td><label><b>Nouvelle image (chemin)</b></td><td> <input value=<%=article.getPic() %> type="text" name="pic" id="logInput"></label><br/></td></tr>
		<tr><td><label><b>Disponibilité</b></td><td> <input value=<%=article.getDispo() %> type="text" name="dispo" id="logDispo"></label><br/></td></tr>
        <tr align="right">
        <td></td> 
        <td> <input border=0 src="http://cdn1.iconfinder.com/data/icons/UII_Icons/24x24/configuration_edit.png" type=image name="submit" Value=submit align="right" > 
        </td></tr>
       </table>
        <input type="hidden" name="action" value="editProduct">
       </form>
  
  </center>
 </body></html>
