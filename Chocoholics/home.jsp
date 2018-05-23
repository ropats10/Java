<!DOCTYPE HTML>
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
		<!-- Banner -->
			<section id="banner">
				<br><br><br>
				<h1 style="font-size: 80px;  font-family:'Pacifico';" >Welcome to Chocoholics</h1>
				<br><br><br><br><br>
			</section>
		
		<!-- Two -->
			<section id="two" class="wrapper style2 special">
				<div class="inner">
					<header>
						<h2><a style=" font-family:'Pacifico';"  href="occasion.jsp"> Chocolates  </a> </h2>
					</header>
					<div class="flex flex-3">
					
						<div class="box person">
							<div class="image">
								<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Dark Chocolates">
								<img src="images/icons/darkcho.png" alt="Person 1" />
								</a>
							</div>
							
							<br><br>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Dark Chocolates"  >Dark chocolates</a> </h3>
							
						</div>
						
						<div class="box person">
							<div class="image">
								<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=White Chocolates">
								<img src="images/icons/whitcho.png" alt="Person 2" />
								</a>
							</div>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=White Chocolates">White chocolates</a>  </a> </h3>							
						</div>
						
						<div class="box person">
							<div class="image">							
							<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Dry fruits Chocolates">
								<img src="images/icons/dryfruits.png" alt="Person 3" />
							</a>
							</div>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Dry fruits Chocolates">Dry fruits chocolates </a> </h3>
						</div>
						
						<div class="box person">
							<div class="image">							
							<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Peppermint Chocolates">
								<img src="images/icons/peppermint.png" alt="Person 3" />
							</a>
							</div>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Peppermint Chocolates">Peppermint Chocolates</a>  </h3>
						</div>
						
						<a href="chocolates.jsp"  class="button"  style="margin-top: 14em; border-radius: 4px; font-size:20px; background-color: #ffffcc; color: #663333 !important;  ">   More   </a>  </center>
						
					</div>
				</div>
			</section>
			
			
		<!-- Three -->
			<section id="two" class="wrapper style2 special">
				<div class="inner">
					<header>
						<h2><a style=" font-family:'Pacifico';"  href="occasion.jsp">Occasion  </a> </h2>
					</header>
					<div class="flex flex-3">
					
						<div class="box person">
							<div class="image">
								<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Diwali Special">
								<img src="images/icons/diwali.png" alt="Person 1" />
								</a>
							</div>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Diwali Special">Diwali Special  </a> </h3>
							
						</div>
						
						<div class="box person">
							<div class="image">
								<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Birthday Special">
								<img src="images/icons/birthdayspe.png" alt="Person 2" />
								</a>
							</div>
							<br><br><br>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Birthday Special">Birthday Special</a>  </h3>							
						</div>
						
						<div class="box person">
							<div class="image">							
							<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Christmas Special">
								<img src="images/icons/christmasspe.png" alt="Person 3" />
							</a>
							</div>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Christmas Special">Christmas Special</a>  </a> </h3>
						</div>
						
						<div class="box person">
							<div class="image">							
							<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Valentine Special">
								<img src="images/icons/valentinespe.png" alt="Person 3" />
							</a>
							</div> <br><br>
							<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate.jsp?value=Valentine Special">Valentine Special</a>  </h3>
						</div>
						
						<a href="occasion.jsp"  class="button"  style="margin-top: 14em; border-radius: 4px; font-size:20px; background-color: #ffffcc; color: #663333 !important;  ">   More   </a>  </center>
						
						
					</div>
				</div>
				<br><br><br><br>
				
			</section>			
<!-- Footer -->
<%@include file="footer.jsp" %>	
</body>
</html>