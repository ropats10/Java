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
String login_session5=(String)session.getAttribute("login");
if(login_session5 == null) 
{  response.sendRedirect("login.jsp");  }

boolean admin=false;
String admin_login=(String)session.getAttribute("admin_login");	
if(admin_login!=null)
{  admin=true; }

String page_url = request.getHeader("referer");
String payment_session5=(String)session.getAttribute("payment");
if(payment_session5 == null) 
{ response.sendRedirect(page_url); }	

int size=0;
ArrayList<Selected_Chocolate> chocolate_list;
chocolate_list=(ArrayList<Selected_Chocolate>)session.getAttribute("list");
if(chocolate_list == null )
{ }
else
{ size=chocolate_list.size(); }

int total_price=0;
ArrayList<Integer> id_list=new ArrayList<Integer>();	
ArrayList<Integer> quan_list=new ArrayList<Integer>();											
try
{										
	for(int i=0;i<size;i++)
	{
		Selected_Chocolate se_ch=chocolate_list.get(i);
		int id=  se_ch.getProduct_id();
		id_list.add(id);
		int q=se_ch.getSelected_quan();		
		quan_list.add(q);		
		int quan_price= se_ch.getTotal_price();			
		total_price = total_price + quan_price ;
	}	
}
catch(Exception ex)
{ out.println(ex); }
String username=login_session5;//request.getParameter("login__username");	
String mobile_number1 = "";	
String city="";
String address="";
String State="";
String Zip="";
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	String url = "jdbc:odbc:chocoholics";
	Connection con = DriverManager.getConnection (url,"","");
	String qs = "select * from User_details where username = ?";
	PreparedStatement pst = con.prepareStatement(qs);
	pst.setString(1,username);	
	ResultSet res = pst.executeQuery();
	while(res.next())
	{
		if(username.equalsIgnoreCase(res.getString(1)))
		{
			mobile_number1=res.getString(6);
			city=res.getString(4);
			address=res.getString(5);
			State=res.getString(7);
			Zip=res.getString(8);
		}
	}
con.close();
}
catch(Exception ex)
{  out.println(ex); }
%>
	
<!-- Header -->

<%@include file="header.jsp" %>			

<!-- Main -->
	<section id="main" class="wrapper style2"  >
	<div class="inner">
		<header class="align-center">
			<h2 style="font-size: 60px;  font-family:'Pacifico';"> Payment </h2>
		</header>
	<form action="" method="post">	
		<div class="row uniform 6u"  >
		<!-- Break -->	
		<div class="6u 12u$(xsmall)" >
			<h3><p style="font-size: 20px; "  > Name </p> </h3>  											
		</div>
		<div style="margin-left:-20%;" class="6u$ 12u$(xsmall)">
			<input style="color:#ffffff;"  type="text" name="name"  id="name"  value="<%=username%>"  placeholder="" readonly/>
		</div>									
		<!-- Break -->									
		<div class="6u 12u$(xsmall)" >
			<h3><p style="font-size: 20px; "  > Amount </p> </h3>  											
		</div>
		<div style="margin-left:-20%;" class="6u$ 12u$(xsmall)">
			<input style="color:#ffffff;"  type="text" name="amount"  id="amount"  value="<%=total_price%>"  placeholder="" readonly/>
		</div>
		<!-- Break -->
		<div class="4u 12u$(small)" >
			<input type="radio" id="credit_card" name="payment_type" checked>
			<label for="credit_card"  style="font-size:16px; color:  #ffffff !important;" >Credit Card</label>
		</div>
		<div class="4u 12u$(small)" >										
			<input type="radio" id="cash_on_delivery" name="payment_type">
			<label for="cash_on_delivery" style="font-size:16px; color:  #ffffff !important;" >Cash On Delivery</label>
		</div>
		<!-- Break -->
		<div class="6u 12u$(xsmall)" >
			<h3><p style="font-size: 20px; "  > Mobile Number </p> </h3>  											
		</div>
		<div style="margin-left:-20%;" class="6u$ 12u$(xsmall)">
			<input style="color:#ffffff;"  type="text" name="mobile_number"  id="mobile_number"  value="<%=mobile_number1%>"  placeholder="" />
		</div>
		<!-- Break -->									
		<div class="6u 12u$(xsmall)" >
			<h3><p style="font-size: 20px; "  > City </p> </h3>  											
		</div>
		<div style="margin-left:-20%;" class="6u$ 12u$(xsmall)">
			<input style="color:#ffffff;"  type="text" name="city"  id="city"  value="<%=city%>"  placeholder="" readonly/>
		</div>									
		<!-- Break -->	
		<div class="6u 12u$(xsmall)" >
			<h3><p style="font-size: 20px; "  > State </p> </h3>  											
		</div>
		<div style="margin-left:-20%;" class="6u$ 12u$(xsmall)">
			<input style="color:#ffffff;"  type="text" name="state"  id="state"  value="<%=State%>"  placeholder="" readonly/>
		</div>									
		<!-- Break -->									
		<div class="6u 12u$(xsmall)" >
			<h3><p style="font-size: 20px; "  > Zip </p> </h3>  											
		</div>
		<div style="margin-left:-20%;" class="6u$ 12u$(xsmall)">
			<input style="color:#ffffff;"  type="text" name="zip"  id="zip"  value="<%=Zip%>"  placeholder="" readonly/>
		</div>									
		<!-- Break -->
		<div class="12u$" >									
			<textarea style="font-size:16px; color:  #ffffff !important; " name="addres"  id="addre" placeholder="Address" rows="6"><%=address%></textarea>
		</div>						
		<div class="12u$" >
			<center> 	<button type="submit" name="payment_btn" class="button"  style="border-radius: 4px; font-size:20px; background-color: #ffffcc; color: #663333 !important;  ">   Payment   </button>  </center>						
		</div>
	</div>									
	</form>								
	</div>			
	<br><br><br><br><br><br><br>
	</section>

<%
String payment_btn_string=request.getParameter("payment_btn");						
	if(payment_btn_string != null )
	{
		try
		{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			String url = "jdbc:odbc:chocoholics";
			Connection con = DriverManager.getConnection (url,"","");
			for(int i=0 ; i<id_list.size() ; i++)
			{
				String qs = "select * from chocolate_details where ID = ?";
				PreparedStatement pst = con.prepareStatement(qs);
				pst.setInt( 1 , id_list.get(i) );
				ResultSet res = pst.executeQuery();
				res.next();
				int available_quan=res.getInt(7);

				String qs1 = "update chocolate_details set avilable_quantity=? where ID=?";
				PreparedStatement pst1=con.prepareStatement(qs1);
				int select_quan = quan_list.get(i);					
				int remain_quan= available_quan - select_quan;
				pst1.setInt(1,remain_quan);					
				pst1.setInt(2, id_list.get(i) );
				int p= pst1.executeUpdate();
				//out.println("Rows updated:"+p);
				session.removeAttribute("list"); 
				session.removeAttribute("payment"); 
				session.removeAttribute("temp_session"); 
			}
			con.close();
	%>
		<script type="text/javascript">
		    var msg = "Payment Complete";
		    alert(msg);
		</script>
	<%
		}
		catch(Exception ex)
		{  out.println(ex); }
	}
%>			
 <!-- Footer -->
<%@include file="footer.jsp" %>
</body>
</html>