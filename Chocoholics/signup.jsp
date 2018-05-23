<%@page import="java.sql.*" %>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
        <link rel="stylesheet" href="css/style1.css">
</head>

<%
String page_url = request.getHeader("referer");
String login_session=(String)session.getAttribute("login");
if(login_session!=null)
{ response.sendRedirect(page_url); }
%>

<script language="javascript">
	function validate(objForm)
	{
		if(objForm.username.value.length==0)
		{
			alert("Please enter Name!");
			objForm.username.focus();
			return false;
		}

		if(!(isNaN(document.objForm.username.value)))
		{
			alert("Name has character only!");
			return false;
		}

		if(objForm.password.value.length==0)
		{
			alert("Please enter Password!");
			objForm.password.focus();
			return false;
		}

		if(objForm.Confirm_password.value.length==0){
			alert("Please enter Confirm password!");
			objForm.Confirm_password.focus();
			return false;
		}

		if(objForm.password.value != objForm.Confirm_password.value)
		{
			alert("Confirm Password doesnot match!");
			document.getElementById("password").focus();
			return false;
		}

		if(objForm.Email.value.length==0)
		{
			alert("Please enter Email!");
			objForm.Email.focus();
			return false;
		}

		if (document.objForm.Email.value != "")
		{
			var Temp = document.objForm.Email
			var AtSym = Temp.value.indExampleOf('@')
			var Period = Temp.value.lastIndExampleOf('.')
			var Space = Temp.value.indExampleOf(' ')
			var Length = Temp.value.length - 1
			if ((AtSym < 1) ||
			(Period <= AtSym+1) ||
			(Period == Length ) ||
			(Space != -1))
			{
				alert("Please enter a valid Email ID!");
				document.objForm.Email.focus();
				return false;
			}
		}

		if(objForm.Mobile.value.length==0)
		{
			alert("Please enter Phone!");
			objForm.Mobile.focus();
			return false;
		}


		if(objForm.City.value.length==0){
			alert("Please enter City!");
			objForm.City.focus();
			return false;
		}

		if(!(isNaN(objForm.City.value)))
		{
			alert("City has character only!");
			objForm.City.focus();
			return false;
		}

		if(objForm.State.value.length==0)
		{
			alert("Please enter State!");
			objForm.State.focus();
			return false;
		}

		if(!(isNaN(document.objForm.State.value)))
		{
			alert("State has character only!");
			objForm.State.focus();
			return false;
		}

		if(objForm.Zip.value.length==0)
		{
			alert("Please enter Zip!");
			objForm.Zip.focus();
			return false;
		}

	return true;
	}
</script>
 

<body class="align" background="434130.jpg">

  <div class="site__container">

    <div class="grid__container">
    
      
      <form name ="objForm" method="post" action="./register.jsp" onsubmit="return validate(this):"  class="form form--login"> 
      
      	<center class="label2"> <div class="header1">  <h1 style="color: #000000;" >   Create Account in <font  color="#663333">  <a href="home.jsp">  Chocoholics </a>  </font>  </h1> </div>   </center>

	<center>

	<table style=" margin-top: -14%; " cellpadding="4">
	
	<div class="form__field">
	
		<tr>  
			<td>
				<div class="form__field"> 	
					<label class="fontawesome-user" for="username">Username</label>
					<input name="username" type="text" class="form__input" required>
				</div>
			</td>

			<td>
				<div class="form__field"> 	

					<label class="fontawesome-user" for="E-mail"> Email  </label>
					<input name="Email" type="text" class="form__input" required>
				</div>
			</td>
		</tr>
	</div>


	<div class="form__field">    
		<tr>  
			<td>
				<div class="form__field"> 	
        
					<label class="fontawesome-lock" for="password">Password</label>
					<input name="password" type="password" class="form__input" required>
        
				</div>
			</td>

			<td>
				<div class="form__field"> 	
			        	<label class="fontawesome-lock" for="Confirm_password">Confirm Password</label>
					<input name="Confirm_password" type="password" class="form__input" required>
				</div>
			</td>	
		</tr>
        	
        </div>


	<div class="form__field">        
		<tr>  
			<td>
				<div class="form__field"> 	        
						<label class="fontawesome-user" for="City">City</label>
					   	  <input name="City" type="text" class="form__input" required>        
				</div>
			</td>

			<td>
				<div class="form__field"> 	        
		      				<label class="fontawesome-user" for="Mobile">Mobile  </label>
						<input name="Mobile" type="text" class="form__input" required>
				</div>
			</td>	
		</tr>
        	
        </div>


	<div class="form__field">        
		<tr>  
			<td>
				<div class="form__field"> 	        
					          <label class="fontawesome-user" for="State">	State	</label>
					   	  <input name="State" type="text" class="form__input" required>
				</div>
			</td>

			<td>
				<div class="form__field"> 	        
		      				<label class="fontawesome-user" for="Zip"> Zip  </label>
						<input name="Zip" type="text" class="form__input" required>
				</div>
			</td>	
		</tr>
        </div>


        <div class="form__field">
        
        	<tr>
        		<td  colspan="2" >
        			<div class="form__field">
        			   <label class="fontawesome-user" for="Address">Address</label>
				   <input name="Address" type="text" class="form__input" required>
				   
				 </div>  
        		</td>			
        	</tr>			
				    
        </div>
			
	<div class="form__field">
        
        	<tr>
        		<td  colspan="2" >
        			<div class="form__field">
        				<input type="submit"   value="Submit" id="submit" >			   
				 </div>  
        		</td>			
        	</tr>			
				    
        </div>
	

	

	</table>
	
	
	</center>
	
        
        
      </form>
      
      <h2 class="text--center" style="color: #1ac6ff;">   Already a member?  <a href="login.jsp" style="color:#ffffff;" >  Log in now  </a> <span class="fontawesome-arrow-right"></span></h2>
      
    </div>

  </div>
</body>
  
</html>