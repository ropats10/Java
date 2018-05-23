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
<% 	
int size=0;
ArrayList<Selected_Chocolate> chocolate_list;
chocolate_list=(ArrayList<Selected_Chocolate>)session.getAttribute("list");
if(chocolate_list == null )
{ }
else
{ size=chocolate_list.size();}

boolean admin=false;
String admin_login=(String)session.getAttribute("admin_login");	
if(admin_login!=null)
{  admin=true; }

int pos_number=0;
%>


<!-- Header -->

<%@include file="header.jsp" %>			
			
<!-- Main -->
<section id="main" class="wrapper style2"  >
	<div class="inner">
	<header class="align-center">
		<h2 style="font-size: 60px;  font-family:'Pacifico';"> Selected Chocolates </h2>
	</header>

	<!-- Elements -->
	<form action="remove_product_and_payment.jsp">	
	
	<%	if(size == 0)	{	%>
		<h2 style="font-size: 30px;  font-family:'Pacifico';"> You have not select any Item </h2>
	<%	}	else	{	%>
	
	<!-- Table -->
								
	<div class="table-wrapper" style="font-size:20px;">
		<table>
		<thead>
			<tr>
			<th>No</th>
			<th>Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Total Price</th>
			<th>Remove</th>  
			</tr>
		</thead>
		<tbody>
		<%
		int total_price=0;
		try
		{
			for(int i=0;i<size;i++)
			{
				Selected_Chocolate se_ch=chocolate_list.get(i);
				int id=  se_ch.getProduct_id();
				String ch_name= se_ch.getSelected_chocolate_name(); 
				int quan=  se_ch.getSelected_quan();
				int quan_price= se_ch.getTotal_price();
				int price=se_ch.getChocolate_price();
				pos_number = i;
		%>	
		<tr>
			<td> <%=(i+1)%>  </td>
			<td> <%=ch_name%>   </td>
			<td>  <i class="fa fa-inr"> </i>  <%=price%>   </td>
			<td> <%=quan%>   </td>
			<td>  <i class="fa fa-inr"> </i>  <%=quan_price%>   </td>
			<td>  <button type="submit" style="border-radius: 4px;" id="remove_btn" name="remove_btn" value="<%=pos_number%>" class="actions button small"> Remove </button>  </td>  
		</tr>
		<%	total_price = total_price + quan_price ;
			}
		}
		catch(Exception ex)
		{	out.println(ex);	}
		%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3"></td>
				<td> Total Amount </td>
				<td> <i class="fa fa-inr"> </i>  <%=total_price%>  </td>
			</tr>
		</tfoot>
	</table>
						
	</div>
	<center>	<button type="submit" name="payment_btn" class="button"  style="border-radius: 4px; font-size:20px; background-color: #ffffcc; color: #663333 !important;  ">   Buy  </button>  </center>
						
	<%	}	%>
	</form>						
	</div>
	<br><br><br><br><br><br><br><br>
	</section>
<!-- Footer -->
<%@include file="footer.jsp" %>
</body>
</html>	