<%@ page import="java.util.*,servlets.*,Manager.*,Entities.*,BdHandler.*" %>
<html><body bgcolor="white">
<jsp:useBean id="panier" class="Entities.Panier" scope="session"/>
  <jsp:useBean id="user" class="Entities.User" scope="session"/>   
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
				<td valign="middle" height="40" style="font-family: Arial;font-size: 12" ><a style="text-decoration: none" href="produitsAddMarque.jsp"> <img src="http://cdn1.iconfinder.com/data/icons/fatcow/32x32_0520/layout_add.png"></a></td>
			</tr>
		</table>
 	</div>
  
  </div>
  
  <br><br>
  <center>
  
   <table style="background-color:#eeeeee;width: 1380px;font-size: 14;font-size: 12" cellspacing="1">
  <tr style="background-color:#a6dd41;text-align:center;width: 1000px" height="45">
  <td><b><p style="font-family: Helvetica">Formulaire d'ajout de marque en base de données</p></b></td>
   </tr>
  </table>
 <br><br>
       <form name="addForm" action="BackOfficeServlet" method="POST">
       <table boder="0" style="font-family: Helvetica;font-size: 12">
       <tr><td><label><b>Nom de la marque :</b></td><td> <input type="text" name="name" id="nameInput"></label><br/></td></tr>
        <tr align="right"><td></td>
        <td > <input border=0 src="http://cdn1.iconfinder.com/data/icons/aquaticus/24%20X%2024/netvibes.png" type=image name="submit" Value=submit align="middle" > 
        </td></tr>
       </table>
        <input type="hidden" name="action" value="AjouterMarque">
       </form>
  
  </center>
 </body></html>
