<!DOCTYPE HTML>
<%@ page import="java.sql.*" %>
<%@ page import="MyPackage.*" %>
<%@ page import="java.util.*" %>

<% 	
boolean admin=false;
String admin_login=(String)session.getAttribute("admin_login");
	
if(admin_login!=null)
{  admin=true; }

String chocolate_id = request.getParameter("value");  					
String chocolate_type="";					
String image_path="";
String chocolate_name="";
int chocolate_price=0;
int chocolate_quan=0;					
	try
	{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		String url = "jdbc:odbc:chocoholics";
		Connection con = DriverManager.getConnection (url,"","");
		String qs = "select * from chocolate_details where ID=?";
		PreparedStatement pst = con.prepareStatement(qs);
		pst.setString(1,chocolate_id);
		ResultSet res= pst.executeQuery();
		while(res.next())
		{							
			chocolate_type=res.getString(3);
			chocolate_name=res.getString(4);
			chocolate_price=res.getInt(5);
			image_path=res.getString(6);
			chocolate_quan=res.getInt(7);
		}								
		con.close();
	}
	catch(Exception ex)
	{	System.out.println(ex);	}							
%>		
<html>
	<head>
		<title>Chocoholics</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	
	<body >
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
	<!--   Main       -->		
		<section id="main" class="wrapper style2 special">			
			<div class="inner">
				<header class="align-center">
					<h2 style="font-size: 60px;  font-family:'Pacifico';"> <%=chocolate_type%> </h2>
				</header>		
			<div >
			<form action="" method="post">
				<div class="row">
					<div class="6u 12u$(small)">	<br><br><br>
						<div class="box2 person2">
							<div class="image3">
								<a style="font-size: 25px;  font-family:'Pacifico';" >
									<img src="images/<%=image_path%>.jpg" alt="Image" />
								</a>
							</div>												
							<h3><p style="font-size: 20px;  " href="chocolates.jsp"> Price <i class="fa fa-inr"></i> <%=chocolate_price%>  </p> </h3>  
						</div>
					</div>
								
					<div class="6u$ 12u$(small)" >  <br><br><br>
						<h2  style="font-size: 35px;  font-family:'Pacifico';" > <%=chocolate_name%>   </h2>								
						<hr class="major" />
						<div class="row uniform">	
							<div class="6u 12u$(xsmall)" >
								<h3><p style="font-size: 20px; "  > Price  </p> </h3>  											
							</div>
							<div style="margin-left:-20%;" class="6u$ 12u$(xsmall)">
								<input style="color:#ffffff;"  type="text" name="price"  id="price"  value="<%=chocolate_price%>"  placeholder="" />
							</div>						
						</div>	
						<div class="row uniform">											
							<div class="6u 12u$(xsmall)" >
								<h3><p style="font-size: 20px; "  > Quantity  </p> </h3> 
							</div>	
							<div style="margin-left:-20%;" class="6u$ 12u$(xsmall)">
								<input style="color:#ffffff;"  type="text" name="quan"  id="quan"  value="<%=chocolate_quan%>"  placeholder="" />
							</div>																	
						</div>	
						<button name="update" onClick="window.location.reload()" value="update" class="button"  style="border-radius: 4px; font-size:20px; background-color: #ffffcc; color: #663333 !important; ">   Update   </button> 
						<button name="delete" value="delete" class="button"  style="border-radius: 4px; font-size:20px; background-color: #ffffcc; color: #663333 !important; ">   Delete   </button> 
					</div>										
				</div>										
			</form>					
			</div>	
			</div>
<br><br><br><br><br><br><br>											
	</section>			
<%@include file="footer.jsp" %>
</body>		
</html>	
<%  
String page_url1 = request.getHeader("referer");
String update_string=request.getParameter("update");
String delete_string=request.getParameter("delete");
String type=request.getParameter("type");

int id=Integer.parseInt(chocolate_id);
    if(update_string!=null)
    {
    	String price_string=request.getParameter("price");
    	String chocolate_quan_string=request.getParameter("quan");		    	
    	int price=Integer.parseInt(price_string);
    	int quan=Integer.parseInt(chocolate_quan_string);
    	chocolate_price=price;
    	chocolate_quan=quan;
    	out.println("chocolate_id " + id);	
	out.println("Price " + price);	
    	out.println("Quan " + quan);	    	
    	try
	{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		String url = "jdbc:odbc:chocoholics";
		Connection con = DriverManager.getConnection (url,"","");
		String qs1 = "update chocolate_details set price=?,avilable_quantity=? where ID=?";
		PreparedStatement pst1=con.prepareStatement(qs1);
		pst1.setInt(1,price);					
		pst1.setInt(2,quan);
		pst1.setInt(3,id);
		int p= pst1.executeUpdate();
		out.println(" updated");
		con.close();
		response.sendRedirect(page_url1);
	}
	catch(Exception ex)
	{ out.println(ex); }
    }
    
    if(delete_string!=null)
    {
    	try
	{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		String url = "jdbc:odbc:chocoholics";
		Connection con = DriverManager.getConnection (url,"","");
		String qs1 = "delete from chocolate_details where ID=?";
		PreparedStatement pst1=con.prepareStatement(qs1);
		pst1.setInt(1,id);
		int p= pst1.executeUpdate();
		out.println(" updated");
		con.close();
		response.sendRedirect("chocolate.jsp?value="+chocolate_type);
	}
	catch(Exception ex)
	{ out.println(ex); }
    }  
%>