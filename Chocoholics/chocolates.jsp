<!DOCTYPE HTML>
<%@ page import="java.sql.*" %>
<%@ page import="MyPackage.*" %>
<%@ page import="java.util.*" %>

<% 	
int size=0;
ArrayList<Selected_Chocolate> chocolate_list;
chocolate_list=(ArrayList<Selected_Chocolate>)session.getAttribute("list");
if(chocolate_list == null )
{ }
else
{ size=chocolate_list.size(); }	
boolean admin=false;
String admin_login=(String)session.getAttribute("admin_login");	
if(admin_login!=null)
{  admin=true; }
%>

<html>
	<head>
		<title>Chocoholics</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	
<body>
<!-- Header -->		
<%@include file="header.jsp" %>

<!-- Main -->					
			<section id="main" class="wrapper style2 special">			
				<div class="inner">					
					<div class="flex flex-3">
						<div class="box person">
							<div class="image">
								<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Dark Chocolates">
								<img src="images/icons/darkcho.png" alt="Person 1" />
								</a>
							</div>
							<br><br>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Dark Chocolates">Dark<br> Chocolates  </a> </h3>
							
						</div>
						
						<header class="align-center">

							<h2 style="font-size: 60px;  font-family:'Pacifico';">Chocolates</h2>

						</header>						
						
						
						<div class="box person">
							<div class="image">
								<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=White Chocolates">
								<img src="images/icons/whitcho.png" alt="Person 2" />
								</a>
							</div>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=White Chocolates">White<br> Chocolates  </a> </h3>							
						</div>
						
					</div>	
					
					<div class="flex flex-3">
						<div class="box person">
							<div class="image">
								<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Peppermint Chocolates">
								<img src="images/icons/peppermint.png" alt="Person 3" />
								</a>
							</div>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Peppermint Chocolates">Peppermint  <br> Chocolates </a> </h3>
							
						</div>
						<div class="box person">
							<div class="image">
								<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Dry fruits Chocolates">
								<img src="images/icons/dryfruits.png" alt="Person 3" />
								</a>
							</div>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Dry fruits Chocolates">Dry fruits <br> Chocolates </a> </h3>							
						</div>
						<div class="box person">
							<div class="image">							
							<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Chocolate Pizza">
								<img src="images/icons/chocolatepizza.png" alt="Person 3" />
							</a>
							</div>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Chocolate Pizza"> Chocolates <br> Pizza </a> </h3>
						</div>
					</div>						
				</div>				
			<section>					
			<br><br><br><br><br><br><br>
		
<!-- Footer -->
<%@include file="footer.jsp" %>
</body>
</html>