<%@ page language="java" import="dao.DataAccessObject.*" %>
<jsp:useBean id="dao" class="dao.DataAccessObject" scope="session"> </jsp:useBean>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
form {
    border: 5px solid #fffff;
    opacity: 0.85;
    margin: 0 auto; 
	width:250px;
	font-family: "Lato", sans-serif;
}

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 20%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}
body {
    background-image: url("background1.jpg");
    width:100%;
}
</style>
<head><title>Login</title>
</head>
<body>
<!-- Navigation -->
<div class="w3-bar w3-black" id="myNavbar">
    <a class="w3-bar-item w3-button w3-hover-black w3-hide-medium w3-hide-large w3-right" href="javascript:void(0);" onclick="toggleFunction()" title="Toggle Navigation Menu">
      <i class="fa fa-bars"></i>
    </a>
    <a href="login.jsp" class="w3-bar-item w3-button">CITI BANK</a>
    <a href="abouttest.jsp" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-user"></i> ABOUT</a>
    <a href="ourrates.jsp" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-th"></i>OUR RATES</a>
    <a href="contact.html" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-envelope"></i> CONTACT</a>
  </div>
<form style="width: 500px"  action="LoginTestServlet" method="post" enctype="application/x-www-form-urlencoded">
  <div class="imgcontainer">
    <img src="citilogo.jpg" alt="Avatar" class="avatar">
  </div>

  <div class="container">
    <label><b>Account Number</b></label>
    <input type="text" placeholder="Enter Account Number" name="acc_no" required>

    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pwd" required>
        
    <button type="submit">Login</button>
    <input type="checkbox" checked="checked"> Remember me
  </div>

  <div class="container">
    <button type="button" class="cancelbtn">Cancel</button>
    <span class="psw">Forgot <a href="#"><font color="red"><b>password?</b></font></a></span>
  </div>
  <a href ="registertest.jsp"><font color="red"><b>new user? sign in</b></font></a>
</form>
<%
String value=(String)request.getAttribute("str");
if(value!=null){
if(value.equalsIgnoreCase("welcome")){%>
<h1><font color="white"><b>YOUR ACCOUNT NO IS</b></font></h1>
<p><font color="white"><b><%= request.getAttribute("acc_no") %></b></font></p>
<%}}%>
</body>
</html>