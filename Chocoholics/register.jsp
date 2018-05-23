<%@page import="java.sql.*" %>
<%
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String con_password=request.getParameter("Confirm_password");
	String email=request.getParameter("Email");
	String city=request.getParameter("City");
	String address=request.getParameter("Address");
	String mobile=request.getParameter("Mobile");
	String state=request.getParameter("State");
	String zip=request.getParameter("Zip");
		
	try
	{		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		String url = "jdbc:odbc:chocoholics";
		Connection con = DriverManager.getConnection (url,"","");
		String qs = "insert into User_details values(?,?,?,?,?,?,?,?)";		
		PreparedStatement pst = con.prepareStatement(qs);		
		pst.setString(1,username);
		pst.setString(2,password);
		pst.setString(3,email);
		pst.setString(4,city);
		pst.setString(5,address);
		pst.setString(6,mobile);
		pst.setString(7,state);
		pst.setString(8,zip);
		pst.executeUpdate();
		con.close();				
		session.setAttribute("login",username);				
		String payment_session=(String)session.getAttribute("payment");
		if(payment_session!=null) 
		{	 response.sendRedirect("payment.jsp");	}
		else
		{	response.sendRedirect("home.jsp");	}					
	}
	catch(Exception ex)
	{	out.println(ex);	}
%>