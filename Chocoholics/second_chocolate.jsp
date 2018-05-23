<!DOCTYPE HTML>
<%@ page import="java.sql.*" %>
<%@ page import="MyPackage.*" %>
<%@ page import="java.util.*" %>

<% 	
int size=0;
ArrayList<Selected_Chocolate> chocolate_list5;
chocolate_list5=(ArrayList<Selected_Chocolate>)session.getAttribute("list");
if(chocolate_list5 == null )
{ }
else
{	size=chocolate_list5.size(); }

boolean admin=false;
String admin_login=(String)session.getAttribute("admin_login");	
if(admin_login!=null)
{  admin=true; }

String chocolate_id = request.getParameter("value");  				
String selected_quan=request.getParameter("temp");
String total_price=request.getParameter("price");
if(total_price==null)
{ total_price="0"; }
int temp_choc_id= Integer.parseInt(chocolate_id);
if(chocolate_list5 != null)
{
	for(int i=0;i<size;i++)
	{
		Selected_Chocolate se_ch5=chocolate_list5.get(i);
		if(se_ch5.getProduct_id() == temp_choc_id)
		{
			int quan = se_ch5.getSelected_quan();
			int quan_price= se_ch5.getTotal_price();
			selected_quan = Integer.toString(quan);		
			total_price = Integer.toString(quan_price);	
		}	
	}	
}
					
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
{ System.out.println(ex); }
%>
<html>
<head>
	<title>Chocoholics</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="assets/css/main.css" />
</head>
<script type="text/javascript">
	function change()
	{
		var quan_selection=document.getElementById("quantity");
		var total_quan;
		var quan_price=<%=chocolate_price%>;
		if(quan_selection.value=="1")
		{
			document.getElementById("temp").value="1";
			total_quan=1;					
			var mul=total_quan * quan_price;
			document.getElementById("price").value=mul;	
		}
		if(quan_selection.value=="2")
		{					
			document.getElementById("temp").value="2";					
			total_quan=2;					
			var mul=total_quan * quan_price;
			document.getElementById("price").value=mul;
		}
		if(quan_selection.value=="3")
		{
			document.getElementById("temp").value="3";					
			total_quan=3;
			var mul=total_quan * quan_price;					
			document.getElementById("price").value=mul;
		}
		if(quan_selection.value=="4")
		{
			document.getElementById("temp").value="4";					
			total_quan=4;
			var mul=total_quan * quan_price;					
			document.getElementById("price").value=mul;
		}
		if(quan_selection.value=="5")
		{
			document.getElementById("temp").value="5";					
			total_quan=5;
			var mul=total_quan * quan_price;					
			document.getElementById("price").value=mul;
		}				
	}
</script>				
		
	
<body >
<!-- Header -->

<%@include file="header.jsp" %>

<!--   Main       -->		
						
	<section id="main" class="wrapper style2 special">
		<div class="inner">
			<header class="align-center">
				<h2 style="font-size: 60px;  font-family:'Pacifico';"> <%=chocolate_type%> </h2>
			</header>
			<div >
			<form action="" method="post">
				<div class="row">	
					<div class="6u 12u$(small)">  <br><br><br>
						<div class="box2 person2">
							<div class="image3">
								<a style="font-size: 25px;  font-family:'Pacifico';" >
								<img src="images/<%=image_path%>.jpg" alt="Image" /> </a>
							</div>										
							<h3><p style="font-size: 20px;  " href="chocolates.jsp"> Price <i class="fa fa-inr"></i> <%=chocolate_price%>  </p> </h3>  											
						</div>
								
					</div>
					<div class="6u$ 12u$(small)" >	<br><br><br>
					<h2  style="font-size: 35px;  font-family:'Pacifico';" > <%=chocolate_name%>   </h2>								
					<hr class="major" />
					<h2  style="font-size: 30px;  "> 
		<% 
			if(chocolate_quan > 0)  
			{  out.println("Available");  }
			else
			{  out.println("Sold Out");  }  %>	</h2>

			<div class="select-wrapper">
				<select name="quantity" id="quantity"  onChange="change();" style="color:#ffffff;">
					<option value="0">- Quantity -</option>
		<%										
			if(chocolate_quan<=5)
			{
				if(selected_quan== null)
				{
					for(int i=1;i<=chocolate_quan;i++)
					{	%>
					<option value="<%=i%>">  <%=i%>   </option>
				     <% }
				} else {													
				int quan_item=Integer.parseInt(selected_quan);
				for(int i=1;i<=chocolate_quan;i++)
				{															
					if(i==quan_item)
					{ %>
					 <option selected="selected" value="<%=quan_item%>">  <%=quan_item%>  </option>																
				<%      } else {   %>
					<option value="<%=i%>">  <%=i%>   </option>
				<%	}
				}	
				}													
			} else {
				if(selected_quan== null)
				{
					for(int i=1;i<=5;i++)
					{ %>
					 <option value="<%=i%>">  <%=i%>   </option>
			<%		}
				} else  {													
				int quan_item=Integer.parseInt(selected_quan);
				for(int i=1;i<=5;i++)
				{															
					if(i==quan_item)
					{  %>
					<option selected="selected" value="<%=quan_item%>">  <%=quan_item%>  </option>															
					<% } else { %>
					<option value="<%=i%>">  <%=i%>   </option>
			<%		} 
				}	
			}
			}%>
			</select>		
			</div>		<br>
																						
			<div class="row uniform">
				<div class="6u 12u$(xsmall)" hidden>
					<input type="text" name="temp" id="temp" value="<%=selected_quan%>" placeholder="Quantity" />
				</div>											
				<div class="6u 12u$(xsmall)" >
					<h3><p style="font-size: 20px; "  > Price <i class="fa fa-inr"> </i></p> </h3>  											
				</div>
				<div style="margin-left:-20%;" class="6u$ 12u$(xsmall)">
					<input style="color:#ffffff;"  type="text" name="price"  id="price"  value="<%=total_price%>"  placeholder="" readonly/>
				</div>						
			</div>	<br>
			<button type="submit"  class="button"  style="border-radius: 4px; font-size:20px; background-color: #ffffcc; color: #663333 !important;  ">   Add to cart   </button> 
			</div>
		</div>
	</form>
	</div>	
	</div>
<br><br><br><br><br><br><br>
</section>			
			
<%
try
{
chocolate_id = request.getParameter("value");  					
selected_quan=request.getParameter("temp");
total_price=request.getParameter("price");
int id=Integer.parseInt(chocolate_id);

String selected_chocolate_name=chocolate_name;

if(selected_quan == null){ }
else {
	int se_quan=  Integer.valueOf(selected_quan);
	int totalprice= Integer.valueOf(total_price);
	ArrayList<Selected_Chocolate> chocolate_list;//=new ArrayList<Selected_Chocolate>();
	chocolate_list=(ArrayList<Selected_Chocolate>)session.getAttribute("list");	
		/*
		out.println(id);
		out.println(selected_chocolate_name);
		out.println(chocolate_price);
		out.println(se_quan);
		out.println(totalprice);
		*/	
	Selected_Chocolate se_ch=new Selected_Chocolate(id,selected_chocolate_name,chocolate_price,se_quan,totalprice);
	Selected_Chocolate se_ch1;// =  new Selected_Chocolate();
	//out.println("Size:"  + chocolate_list.size() +  " chocolate_id "  + chocolate_id);
	for(int i=0;i<chocolate_list.size();i++)
	{	
		se_ch1=	chocolate_list.get(i);
		int temp_id=se_ch1.getProduct_id();
		//out.println("array id " + temp_id);
		if( temp_id == id  ) 
		{ 	
			chocolate_list.remove(i);
			//out.println("hello");
		}
	}
	chocolate_list.add(se_ch);
	//size=size+1;
	String page_url = request.getHeader("referer");
	response.sendRedirect(page_url);
	session.setAttribute("list",chocolate_list);	
}
	
}
catch(Exception ex)
{ System.out.println(ex); }
%>			
<!-- Footer -->
<%@include file="footer.jsp" %>
</body>
</html>