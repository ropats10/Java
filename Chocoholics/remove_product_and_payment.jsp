<%@ page import="java.sql.*" %>
<%@ page import="MyPackage.*" %>
<%@ page import="java.util.*" %>	
<%	
	ArrayList<Selected_Chocolate> chocolate_list;
	chocolate_list=(ArrayList<Selected_Chocolate>)session.getAttribute("list");
	String position=request.getParameter("remove_btn");
	out.println(" position " + position);
						
	if(position != null)
	{
		int pos = Integer.parseInt(position);
		out.println(" pos " +pos);
		chocolate_list.remove(pos);
		session.setAttribute("list",chocolate_list);	
		response.sendRedirect("cart.jsp");
	}
	
	String payment_btn_string=request.getParameter("payment_btn");							
	if(payment_btn_string != null )
	{
		String payment_session="Payment";
		session.setAttribute("payment",payment_session);								
		String login_session2=(String)session.getAttribute("login");
		if(login_session2!=null) 
		{	response.sendRedirect("payment.jsp");		}
		else
		{	response.sendRedirect("login.jsp");	}					
	}
%>						