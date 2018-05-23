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
								<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Diwali Special">
								<img src="images/icons/diwali.png" alt="Person 1" />
								</a>
							</div>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Diwali Special">Diwali<br> Special  </a> </h3>
							
						</div>
						
						
						<header class="align-center">
								
							<h2 style="font-size: 60px;  font-family:'Pacifico';">Occasion</h2>
									
						</header>
						
						
						
						
						<div class="box person">
							<div class="image">							
							<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Christmas Special">
								<img src="images/icons/christmasspe.png" alt="Person 3" />
							</a>
							</div>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Christmas Special">Christmas<br> Special</a> </h3>
						</div>
					</div>	
					
					
					
					<div class="flex flex-2">
						<div class="box person">
							<div class="image">
								<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Rakshabandhan Special">
								<img src="images/icons/rakshabandhan.png" alt="Person 3" />
								</a>
							</div>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Rakshabandhan Special">Rakshabandhan <br> Special </a> </h3>
							
						</div>
						<div class="box person">
							<div class="image">
							<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Birthday Special">
								<img src="images/icons/birthdayspe.png" alt="Person 2" />
								</a>
							</div>
							<br><br>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Birthday Special">Birthday<br> Special  </a> </h3>							
						</div>
						<div class="box person">
							<div class="image">
								<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Valentine Special">
								<img src="images/icons/valentinespe.png" alt="Person 3" />
								</a>
							</div>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Valentine Special">Valentine <br> Special </a> </h3>							
						</div>
						
					</div>						
					
					
					
					
					
					
					
					
				</div>
				
				
			<section>		
		
		
		
		
		<br><br><br><br><br><br><br>
		
		
		
		
		
		
<!-- Footer -->
<%@include file="footer.jsp" %>
</body>
</html>