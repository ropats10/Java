<%@ page import="java.sql.*" %>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Login</title>
        <link rel="stylesheet" href="css/style.css">
  </head>  
<%
	String page_url = request.getHeader("referer");
	String login_session=(String)session.getAttribute("login");
	if(login_session!=null)
	{ response.sendRedirect(page_url); }
%>
<body class="align" background="434130.jpg">
	  <div class="site__container">
	    <div class="grid__container">
		<br>
	      <form method="post" class="form form--login">	      		  
	      	<center class="label2"> <div class="header1"> <font  color="#663333"> <h1><a href="home.jsp"> Chocoholics </a></h1> </font>  </div>   </center>
		<div class="form__field">
		  <label class="fontawesome-user" for="login__username">Username</label>
		  <input name="login__username" type="text" class="form__input" placeholder="Username" required>
		</div>
		<div class="form__field">
		  <label class="fontawesome-lock" for="login__password">Password</label>
		  <input name="login__password" type="password" class="form__input" placeholder="Password" required>
		</div>
		<div class="form__field">
		  <input type="submit" value="Sign In">
		</div>
	      </form>
	      <h2 class="text--center" style="color: #1ac6ff;">  Not a member?  <a href="signup.jsp" style="color:#ffffff;"> Sign up now</a> <span class="fontawesome-arrow-right"></span></h2>
	    </div>
	  </div>

<% 
String username=request.getParameter("login__username");
String password=request.getParameter("login__password");
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	String url = "jdbc:odbc:chocoholics";
	Connection con = DriverManager.getConnection (url,"","");
	String payment_session7=(String)session.getAttribute("payment");
	if(payment_session7 == null) 
	{
		String qs1 = "select * from admin where username = ? and password=?";		
		PreparedStatement pst1 = con.prepareStatement(qs1);
		pst1.setString(1,username);
		pst1.setString(2,password);
		ResultSet res1 = pst1.executeQuery();
		while(res1.next())
		{
			if(username.equalsIgnoreCase(res1.getString(1)))
			{						
				session.setAttribute("admin_login",username);
				response.sendRedirect("home.jsp");
			}	
		}			
	}		
	String qs = "select * from User_details where username = ? and password=?";
	PreparedStatement pst = con.prepareStatement(qs);
	pst.setString(1,username);
	pst.setString(2,password);
	ResultSet res = pst.executeQuery();
	while(res.next())
	{
		if(username.equalsIgnoreCase(res.getString(1)))
		{				
			session.setAttribute("login",username);		
			String payment_session=(String)session.getAttribute("payment");
			if(payment_session!=null) 
			{
				 response.sendRedirect("payment.jsp");
			}
			else
			{	response.sendRedirect("home.jsp"); }					
		}			
	}
	con.close();
}
catch(Exception ex)
{ out.println(ex); }  %>
</body>  
</html>