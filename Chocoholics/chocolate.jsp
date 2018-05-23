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
	{  size=chocolate_list.size();  }

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
		<% String chocolate_type = request.getParameter("value");  %>				
		<header class="align-center">
			<h2 style="font-size: 60px;  font-family:'Pacifico';">  <%=chocolate_type%>      </h2>
		</header>					
		<div class="flex flex-3">
		<%	 if(admin == false){ 		
		try
		{						
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			String url = "jdbc:odbc:chocoholics";
			Connection con = DriverManager.getConnection (url,"","");
			String qs = "select * from chocolate_details where type=?";
						
			PreparedStatement pst = con.prepareStatement(qs);
			pst.setString(1,chocolate_type);
			ResultSet res= pst.getResultSet();
			res=pst.executeQuery();						
			//boolean more=res.next();
			while(res.next())
			{		
				int temp=res.getInt(1);       
		%>					
			<div class="box5 person5">
				<div class="image5">
					<a style="font-size: 25px;  font-family:'Pacifico';" href="first_chocolate.jsp?value=<%=temp%>">
					<img src="images/<%=res.getString(6)%>.jpg" alt="Image" />
					</a>
				</div>
				<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="first_chocolate.jsp?value=<%=temp%>">  <%=res.getString(4)%>     </h2>  </a> </h3>
				<br>
				<h3><p style="font-size: 20px;  " href="chocolates.jsp"> Price <i class="fa fa-inr"></i> <%=res.getInt(5)%>  </p> </h3>  
			</div>						
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
			<%	//more=res.next();	
			}
			con.close();
		}
		catch(Exception ex)
		{	out.println(ex);	}
		%>						
		
		<!-- admin false condition complete -->
		<%  	}	else	{
			try
			{						
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				String url = "jdbc:odbc:chocoholics";
				Connection con = DriverManager.getConnection (url,"","");
				String qs = "select * from chocolate_details where type=?";
						
				PreparedStatement pst = con.prepareStatement(qs);
				pst.setString(1,chocolate_type);
				ResultSet res= pst.getResultSet();
				res=pst.executeQuery();						
				//boolean more=res.next();
				while(res.next())
				{									
				  int temp=res.getInt(1);       
			%>
				<div class="box5 person5">
					<div class="image5">
						<a style="font-size: 25px;  font-family:'Pacifico';" href="chocolate_update_delete.jsp?value=<%=temp%>">
						<img src="images/<%=res.getString(6)%>.jpg" alt="Image" />
						</a>
					</div>
					<h3><a style="font-size: 25px;  font-family:'Pacifico';" href="first_chocolate.jsp?value=<%=temp%>">  <%=res.getString(4)%>     </h2>  </a> </h3> <br>
					<h3><p style="font-size: 20px;  " href="chocolates.jsp"> Price <i class="fa fa-inr"></i> <%=res.getInt(5)%>  </p> </h3>  
					</div>						
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
			<%	
				//more=res.next();
				}
				con.close();
			}
			catch(Exception ex)
			{	out.println(ex);	}
			%>						
						
			<% }  %> <!-- admin condition complete -->
		</div>	
		</div>
		<section>		
<br><br><br><br><br><br><br>		
<!-- Footer -->
<%@include file="footer.jsp" %>
</body>
</html>