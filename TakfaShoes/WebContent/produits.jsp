<%@ page import="java.util.*,servlets.*,Manager.*,Entities.*,BdHandler.*" %>
<html><body bgcolor="white">
<!-- Utilisation d'un Bean pour faire le lien entre la classe Panier et la session -->
<jsp:useBean id="panier" class="Entities.Panier" scope="session"/>
<!-- Utilisation d'un Bean pour faire le lien entre la classe User et la session -->
<jsp:useBean id="user" class="Entities.User" scope="session"> 
</jsp:useBean> 
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
  <td><b><p style="font-family: Helvetica">Image du produit</p></b></td>
  <td><b><p style="font-family: Helvetica">Nom du produit</p></b></td>
  <td><b><p style="font-family: Helvetica">Prix</p></b></td>
  <td>
    <b><p style="font-family: Helvetica"> Supprimer </p></b>
   </td>
   </tr>
  <%
  //Création des articles avec les informations 
  //récupérées en base et renseignement de leurs
  //id respectifs
    ProductManager pm = new ProductManager();
  	ArrayList<String> produits = pm.getAllProducts();
    for (int i=0;i<produits.size();i++) {
      Article article=new Article(produits.get(i).split(";;")[0],produits.get(i).split(";;")[1],produits.get(i).split(";;")[2]);
     article.setId(produits.get(i).split(";;")[3]);
     article.setDispo(produits.get(i).split(";;")[5]);
     System.out.print("article.getDispo() = "+article.getDispo());
   %>
   <div style="background-color:orange;text-align:center;width: 1000px">
     <tr style="background-color:white;width: 1000px">
      <td style="text-align: center" width="80px"><img src="<%= article.getPic() %>"></td>
      <td width="1000px"><p style="font-family: Helvetica"><PRE><p style="font-family: Helvetica">   <%= article.getName() %></p></PRE> </p></td>
      <td width="200px"><p style="color: #ff9c00;text-align: center;font-family:Helvetica "><b><%= article.getPrice() %> &#x20AC; </b></p></td>
      <td style="text-align: center">
       <form name="addForm" action="BackOfficeServlet" method="POST">
        <input type="hidden" name="article" value="<%= article.getName() %>">
        <input type="hidden" name="articlePrice" value="<%= article.getPrice() %>">
        <input type="hidden" name="articlePic" value="<%= article.getPic() %>">
        <input type="hidden" name="articleId" value="<%= article.getId() %>">
        <input type="hidden" name="articleDispo" value="<%= article.getDispo() %>">
        <input border=0 src="http://cdn1.iconfinder.com/data/icons/freeapplication/png/24x24/Close.png" type=image name="submit" Value=submit align="middle" > 
        <input type="hidden" name="action" value="Supprimer">
       </form>
      </td></tr>
    </div>
     
   <% } %>
  </table> <br><br>
  
  </center>
 </body></html>
