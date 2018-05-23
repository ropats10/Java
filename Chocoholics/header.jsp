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
	<%  if(admin == false) {
		String login_session=(String)session.getAttribute("login");
		if(login_session == null) 
		{	%>
		<div class="dropdown"    > <a style="font-size: 25px;  font-family:'Pacifico';" href="cart.jsp"> Cart  </a>							
			<div class="dropdown-content">	Items <%=size%>  </div>
		</div>							
		<a href="login.jsp"  class="button"  style=" background-color: #663333; border-radius: 4px; font-size:20px; color: #ffffcc !important;  ">   Login   </a>  									
	<%	}	else	{	%>
		<div class="dropdown"    > <a style="font-size: 25px;  font-family:'Pacifico';" href="cart.jsp"> Cart  </a>							
			<div class="dropdown-content">	 Items <%=size%>  </div>
		</div>							
		<div class="dropdown"    > <a style="font-size: 25px;  font-family:'Pacifico';" > <%=login_session%>  </a>							
			<div class="dropdown-content">
				<a href="logout.jsp"  style=" font-size: 20px ;">Logout </a> 												
			</div>
		</div>																		
	<%	}	}
	   else	{
		String login_session=(String)session.getAttribute("admin_login");
		if(login_session == null) 
		{	%>
		<a href="login.jsp"  class="button"  style=" background-color: #663333; border-radius: 4px; font-size:20px; color: #ffffcc !important;  ">   Login   </a>  
		<%	}	else	{	%>
			<a  style="font-size: 25px;  font-family:'Pacifico';"   href="chocolate_add.jsp">  Add  </a>
			<div class="dropdown"    > <a style="font-size: 25px;  font-family:'Pacifico';" > <%=login_session%>  </a>							
				<div class="dropdown-content">
					<a href="logout.jsp"  style=" font-size: 20px ;">Logout </a> 												
				</div>
			</div>																		
		<%	}
		}	%>							
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;							
	</nav>
	<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
	</div>
	</header>
</div>
