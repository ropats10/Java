<!DOCTYPE HTML>
<%@ page import="java.sql.*" %>
<%@ page import="MyPackage.*" %>
<%@ page import="java.util.*" %>


<html>
<head>
	<title>Chocoholics</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="assets/css/main.css" />
</head>	
<body >
<script type="text/javascript">
var cho1=document.createElement('option');
var cho2=document.createElement('option');
var cho3=document.createElement('option');
var cho4=document.createElement('option'); 
var cho5=document.createElement('option');

function cat_check1()
{	
		cho1.text="Dark Chocolates";
		cho1.value="Dark Chocolates";
		document.getElementById("cho_type").appendChild(cho1);
		
		cho2.text="White Chocolates";
		cho2.value="White Chocolates";
		document.getElementById("cho_type").appendChild(cho2);

		cho3.text="Peppermint Chocolates";
		cho3.value="Peppermint Chocolates";
		document.getElementById("cho_type").appendChild(cho3);

		cho4.text="Dry Fruits Chocolates";
		cho4.value="Dry Fruits Chocolates";
		document.getElementById("cho_type").appendChild(cho4);
		
		cho5.text="Chocolate Pizza";
		cho5.value="Chocolate Pizza";
		document.getElementById("cho_type").appendChild(cho5);
}
	
function cat_check2()	
{		
		cho1.text="Birthday Special";
		cho1.value="Birthday Special";
		document.getElementById("cho_type").appendChild(cho1);
		
		cho2.text="Christmas Special";
		cho2.value="Christmas Special";
		document.getElementById("cho_type").appendChild(cho2);

		cho3.text="Diwali Special";
		cho3.value="Diwali Special";
		document.getElementById("cho_type").appendChild(cho3);

		cho4.text="Rakshabandhan Special";
		cho4.value="Rakshabandhan Special";
		document.getElementById("cho_type").appendChild(cho4);

		cho5.text="Valentine Special";
		cho5.value="Valentine Special";
		document.getElementById("cho_type").appendChild(cho5);		
}
</script>

<% 	
String admin_login_session5=(String)session.getAttribute("admin_login");
if(admin_login_session5 == null) 
{ response.sendRedirect("login.jsp"); }

%>

<!-- Header -->

<div class="subpage">			
	<header id="header">				
	<div class="inner">					
		<a style="font-size: 35px;  font-family:'Pacifico';"    href="home.jsp" class="logo">Chocoholics</a>						
	<nav id="nav">												
		</div>							
			<a  style="font-size: 25px;  font-family:'Pacifico';"   href="home.jsp">  Home  </a>							
				<div class="dropdown" ><a style="font-size: 25px;  font-family:'Pacifico';" href="chocolates.jsp"> Chocolates  </a>
					<div class="dropdown-content">
						<a href="chocolate.jsp?value=Dark Chocolates"  >Dark chocolates</a>
						<a href="chocolate.jsp?value=White Chocolates">White chocolates</a> 
						<a href="chocolate.jsp?value=Dry fruits Chocolates">Dry fruits chocolates</a> 
						<a href="chocolate.jsp?value=Peppermint Chocolates">Peppermint Chocolates</a> 
						<a href="chocolate.jsp?value=Chocolate Pizza">Chocolate Pizza</a> 
					</div>
				</div>
				<div class="dropdown" > <a style="font-size: 25px;  font-family:'Pacifico';" href="occasion.jsp"> Occasion  </a>
					<div class="dropdown-content">									
						<a href="chocolate.jsp?value=Diwali Special">Diwali Special</a> 
						<a href="chocolate.jsp?value=Birthday Special">Birthday Special</a> 
						<a href="chocolate.jsp?value=Christmas Special">Christmas Special</a> 
						<a href="chocolate.jsp?value=Rakshabandhan Special">Rakshabandhan Special</a> 
						<a href="chocolate.jsp?value=Valentine Special">Valentine Special</a> 									
					</div>
				</div>							
	<%
		String login_session=(String)session.getAttribute("admin_login");
		if(login_session == null) {	%>									
		<a href="login.jsp"  class="button"  style=" background-color: #663333; border-radius: 4px; font-size:20px; color: #ffffcc !important;  ">   Login   </a>  
	<%	}	else	{	%>
		<a  style="font-size: 25px;  font-family:'Pacifico';"   href="chocolate_add.jsp">  Add  </a>
		<div class="dropdown"    > <a style="font-size: 25px;  font-family:'Pacifico';" > <%=login_session%>  </a>							
			<div class="dropdown-content">
				<a href="logout.jsp"  style=" font-size: 20px ;">Logout </a> 												
			</div>
		</div>																		
	<%	}	%>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;							
		</nav>
		<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
	</div>
	</header>			
</div>			
			
			
<!-- Main -->
<section id="main" class="wrapper style2"  >
	<div class="inner">
	<header class="align-center">
		<h2 style="font-size: 60px;  font-family:'Pacifico';"> Add Chocolate </h2>
	</header>
	<form action="" method="post">	
		<div class="row uniform 6u"  >
			<!-- Break -->
			<div class="6u 12u$(xsmall)" >
				<h3><p style="font-size: 20px; "  >Chocolate Name </p> </h3>  											
			</div>
			<div style="margin-left:-20%;" class="6u$ 12u$(xsmall)">
				<input style="color:#ffffff;"  type="text" name="name"  id="name"  value=""  placeholder="" required/>
			</div>									
			<!-- Break -->
			<div class="6u 12u$(xsmall)" >
				<h3><p style="font-size: 20px; "  > Category </p> </h3>  											
			</div>
			<div style="margin-left:-20%;" class="6u$ 12u$(small)">
			<div  class="4u 12u$(small)" >
				<input type="radio" id="chocolates" name="category" value="chocolate" Onclick="cat_check1();" checked>
				<label for="chocolates"  style="font-size:16px; color:  #ffffff !important;" >Chocolates</label>
			</div>
			<div  class="4u 12u$(small)" >
				<input type="radio" id="occasion" name="category" value="occasion" Onclick="cat_check2();" >
				<label for="occasion" style="font-size:16px; color:  #ffffff !important;" >Occasion</label>
			</div>
		</div>		
		<!-- Break -->
		<div  class="6u 12u$(small)" >									
			<h3><p style="font-size: 20px; "  > Type </p> </h3>  											
		</div>
		<div style="margin-left:-20%;" class="6u$ 12u$(small)">
			<select name="cho_type" id="cho_type"  style="color:#ffffff;" required>
				<option >- Chocolate Type -</option>
			</select>
		</div>
		<!-- Break -->
		<div class="6u 12u$(small)" >
			<h3><p style="font-size: 20px; "  > Price </p> </h3>  											
		</div>
		<div style="margin-left:-20%;" class="6u$ 12u$(small)">
			<input style="color:#ffffff;"  type="text" name="price"  id="price"  value=""  placeholder="" required/>
		</div>						
		<!-- Break -->
		<div class="6u 12u$(small)" >
			<h3><p style="font-size: 20px; "  > Image </p> </h3>  											
		</div>
		<div style="margin-left:-20%;" class="6u$ 12u$(small)">
			<input style="color:#ffffff;"  type="file" name="image"  id="image"  value=""  placeholder="" required/>
		</div>									
		<!-- Break -->									
		<div class="6u 12u$(small)" >
			<h3><p style="font-size: 20px; "  > Quantity </p> </h3>  											
		</div>
		<div style="margin-left:-20%;" class="6u$ 12u$(small)">
			<input style="color:#ffffff;"  type="text" name="avi_quan"  id="avi_quan"  value=""  placeholder="" required/>
		</div>									
		<!-- Break -->
		<div class="12u$" >
		<center> 	<button type="submit" name="submit_btn" class="button"  style="border-radius: 4px; font-size:20px; background-color: #ffffcc; color: #663333 !important;  ">   Submit   </button>  </center>
		</div>
	</div>	
	</form>
	</div>	<br><br><br><br><br><br><br>
</section>
				
<%

String submit_btn_string=request.getParameter("submit_btn");						
if(submit_btn_string != null )
{
	String name=request.getParameter("name");
	String category=request.getParameter("category");
	String type_string=request.getParameter("cho_type");
	String price_string=request.getParameter("price");
	String image_string=request.getParameter("image");
	String quantity_string=request.getParameter("avi_quan");
		
	if(	type_string.equals("- Chocolate Type -")	)
	{ }
	else
	{
		StringBuffer image_str=new StringBuffer(image_string);
		int length=image_str.length();
		int index=image_str.indexOf(".");
		image_str.delete(index,length);
		image_string=  image_str.toString();
		int price=Integer.valueOf(price_string);
		int quan=Integer.valueOf(quantity_string);
		try
		{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			String url = "jdbc:odbc:chocoholics";
			Connection con = DriverManager.getConnection (url,"","");
			String qs = "insert into chocolate_details(category,type,name,price,image,avilable_quantity) values(?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(qs);
			pst.setString(1,category);
			pst.setString(2,type_string);
			pst.setString(3,name);
			pst.setInt(4,price);
			pst.setString(5,image_string);
			pst.setInt(6,quan);
			pst.executeUpdate();
			con.close();				
	%>
		<script type="text/javascript">
		    var msg = "Chocolate Added ";
		    alert(msg);
		</script>
	<%
	}
	catch(Exception ex)
	{ out.println(ex); }
}
}
%>

<!-- Footer -->
<%@include file="footer.jsp" %>
</body>
</html>