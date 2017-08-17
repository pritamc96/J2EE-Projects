<%@page import="beans.BankRedg"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
 BankRedg bd = (BankRedg)session.getAttribute("BankRedg");
if(bd==null)
{
	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<style>
.mySlides {display:none;}
body {font-family: "Times New Roman", Georgia, Serif;}
h1,h2,h3,h4,h5,h6 {
    font-family: "Playfair Display";
    letter-spacing: 5px;
}
body, html {
    height: 100%;
    color: #777;
    line-height: 1.8;
}
/* Create a Parallax Effect */
.bgimg-1,.bgimg-2 {
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

/* First image (Logo. Full height) */
.bgimg-1 {
    background-image: url('banking1.jpg');
    min-height: 100%;
}
/* Second image (Portfolio) */
.bgimg-2 {
    background-image: url("bank-wallpaper-2880x1620.jpg");
    min-height: 400px;
}
table {
    font-family: Georgia, Serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #0e2f44;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>

<body>
<!-- Navigation -->
<div class="w3-bar w3-black navbar-fixed-top" id="myNavbar">
    <a class="w3-bar-item w3-button w3-hover-black w3-hide-medium w3-hide-large w3-right" href="javascript:void(0);" onclick="toggleFunction()" title="Toggle Navigation Menu">
      <i class="fa fa-bars"></i>
    </a>
    <a href="home.jsp" class="w3-bar-item w3-button">CITI BANK</a>
    <a href="about.html" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-user"></i> ABOUT</a>
    <a href="transaction.jsp" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-th"></i>TRANSACTION</a>
    <a href="contact.jsp" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-envelope"></i> CONTACT</a>
    <a href="LogoutTestServlet" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red">LogOut</a>
  </div>

<!-- Header -->
  <div class="bgimg-1 w3-display-container w3-opacity-min" id="home">
  <div class="w3-display-middle" style="white-space:nowrap;">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><font color="red"><b>CITI</b></font></span> <span class="w3-hide-small w3-text-light-grey">BANK</span></h1>
  </div>
</div>
<h2>Welcome ${BankRedg.firstname} ${BankRedg.lastname}</h2>

<!-- Bank Description -->
<section class="w3-container w3-center w3-content" style="max-width:600px">
  <h2 class="w3-wide"><font color="red"><b>CITY</b></font> BANK</h2>
  <p class="w3-opacity"><font color="blue">~~now at your doorstep</font></p>
  <div class="w3-content w3-container w3-padding-64">
  <h3 class="w3-center">OUR VISION</h3>
  <p class="w3-center"><em>To be the most successful financial institution in KOLKATA with a visible presence in the  North Indian Region</em></p>
  <h3 class="w3-center">Mission Statement:</h3>
  <p class="w3-center"><em>To provide the best financial services in KOLKATA and the region, distinguished by outstanding service, product innovation and sustained earnings growth.</em></p>
  <h3 class="w3-center">Core Values:</h3>
  <h6 class="w3-center">Customer Satisfaction:</h6>
  <p class="w3-center"><em>Always Striving to meet our customer’s expectations and putting the customers first</em></p>
  <h6 class="w3-center">Employee Recruitment and Development:</h6>
  <p class="w3-center"><em>1.Employees are the key to the success of National Bank of Malawi</em></p>
  <p class="w3-center"><em>2.The Bank will recruit based on merit and competencies required for the Job.</em></p>
  <p class="w3-center"><em>3.The Bank will ensure that employees are properly trained so that it retains a disciplined and motivated staff.</em></p>
  <p class="w3-center"><em>4.The Bank will provide a working environment which is conducive to continous employee self development and advancement</em></p>
  <h6 class="w3-center">Employee Commitment:</h6>
  <p class="w3-center"><em>The Bank will be committed to excellence in it’s performance and that the employees will have a clear understanding of its objectives and goals.</em></p>
  <h6 class="w3-center">Integrity and Trust</h6>
  <p class="w3-center"><em>All Bank employees will fully comply with and share the bank’s commitment to high moral, ethical and legal standards.</em></p>
  <h6 class="w3-center">Team Work</h6>
  <p class="w3-center"><em>The Bank will build and maintain a culture of mutual respect, recognition and cooperation and promote feedback, effective communication and group work.</em></p>
  <h6 class="w3-center">Corporate Social Responsibility</h6>
  <p class="w3-center"><em>As a good corporate citizen, National Bank of Malawi will actively participate in deserving charitable and social activities.</em></p>
</div>
</section>

<section class="w3-row-padding w3-center w3-container w3-padding-64 w3-light-grey">
<div class=" w3-display-container w3-opacity-min">
  <div class="w3-display-middle" style="white-space:nowrap;">
    <span class="w3-center w3-padding-large w3-black w3-xlarge w3-wide w3-animate-opacity">OUR <span class="w3-hide-small">INTEREST</span> RATES</span>
 </div>
</div>
 </section >
 <section class="w3-row-padding w3-center w3-container w3-padding-64 w3-light-grey">
	<table bgcolor="#386885">
	  <tr>
	    <th>Tenure</th>
	    <th>Interest Rates for RegularDeposit</th>
	    <th>Interest Rates for Senior Citizen</th>
	  </tr>
	  <tr>
	    <td>7 days to 45 days</td>
	    <td>5.50%</td>
	    <td>6.00%</td>
	  </tr>
	  <tr>
	    <td>46 days to 179 days</td>
	    <td>6.50%</td>
	    <td>7.00%</td>
	  </tr>
	  <tr>
	    <td>180 days to 210 days</td>
	    <td>6.75%</td>
	    <td>7.25%</td>
	  </tr>
	  <tr>
	    <td>211 days to 364 days</td>
	    <td>7.00%</td>
	    <td>7.50%</td>
	  </tr>
	  <tr>
	    <td>1 year to 455 days</td>
	    <td>6.90%</td>
	    <td>7.40%</td>
	  </tr>
	  <tr>
	    <td>456 days to 1 year 364 days</td>
	    <td>6.95%</td>
	    <td>7.45%</td>
	  </tr>
	   <tr>
	    <td>2 years to 2 year 364 days</td>
	    <td>6.85%</td>
	    <td>7.35%</td>
	  </tr>
	  <tr>
	    <td>3 years to 3 year 364 days</td>
	    <td>6.5%</td>
	    <td>7%</td>
	  </tr>
	</table>
	</div>

</section>

<!-- slide show-->
<div class="w3-container w3-padding-64 w3-center w3-black w3-xlarge">
  <h1><b>CITI :</b></h1>
  <h6>Your diet is a bank account. Good food choices are good investments.</h6>
  <img class="mySlides" src="Bank (1).jpg" width="100%" height="400">
  <img class="mySlides" src="banking1.jpg" width="100%"height="400">
  <img class="mySlides" src="Online-Bank.jpg" width="100%"height="400">
</div>

<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>

<div class="w3-row w3-center w3-dark-grey w3-padding-16">
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">5+</span><br>
    Countries
  </div>
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">155+</span><br>
    Branches
  </div>
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">10000+</span><br>
    Happy Clients
  </div>
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">milions of</span><br>
    Customers
  </div>
</div>

<!-- Second Parallax Image with Portfolio Text -->
<div class="bgimg-2 w3-display-container w3-opacity-min">
  <div class="w3-display-middle">
    <span class="w3-xxlarge w3-text-white w3-wide"><font color="red"><b>CITI</b></font>BANK</span>
  </div>
</div>

<!-- Board Members -->
<section class="w3-row-padding w3-center w3-light-grey">
	<h1><b>OUR</b> ATTORNEYS</h1>
  <article class="w3-third">
    <p><b>Ronaldinho Gaucho</b>></p>
    <img src="ronaldinho.jpg" alt="Ronaldinho Gaucho" style="width:100%">
    <p>PARTNER</p>
    <p>email:ronaldinho@gmail.com</p>
    <p>tel: 123-456-7890</p>
  </article>
  <article class="w3-third">
    <p><b>Cristiano Ronaldo</b></p>
    <img src="ronaldo.jpg" alt="cristiano ronaldo" style="width:100%">
    <p>CEO</p>
    <p>email:cr7@gmail.com</p>
    <p>tel:345-654-7648</p>
  </article>
  <article class="w3-third">
    <p><b>Leo Messi</b></p>
    <img src="messi.jpg" alt="LEo Messi" style="width:100%">
    <p>EXECUTIVE DIRECTOR</p>
    <p>email:leo@gmail.com</p>
    <p>tel:453-098-5634</p>
  </article>
</section>

<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-black w3-xlarge">
  <a href="#"><i class="fa fa-facebook-official"></i></a>
  <a href="#"><i class="fa fa-pinterest-p"></i></a>
  <a href="#"><i class="fa fa-twitter"></i></a>
  <a href="#"><i class="fa fa-flickr"></i></a>
  <a href="#"><i class="fa fa-linkedin"></i></a>
  <p class="w3-medium">
  Citi Bank.Serving The City Of Joy @kolkata.221b Baker Street.<a href="https://www.w3schools.com/w3css/default.asp" target="_blank">All Rights Reserved</a>
  </p>
</footer>

<script>
// Automatic Slideshow - change image every 3 seconds
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}
    x[myIndex-1].style.display = "block";
    setTimeout(carousel, 3000);
}
</script>
</body>
</html>