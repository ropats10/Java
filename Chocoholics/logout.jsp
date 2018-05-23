<%@ page import="java.sql.*" %>
	
<% 
		
	session.invalidate();
		
	response.sendRedirect("login.jsp");
	
%>

