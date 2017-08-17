<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="beans.BankRedg.*" %>
<jsp:useBean id="bd" class="beans.BankRedg" scope="session"> </jsp:useBean>
<!--<jsp:useBean id="doo" class="dao.transactionentry" scope="session"> </jsp:useBean> -->
<%@ page import="dao.transactionentry" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<% 
//The HTTP Expires header dictates to the proxies' caches when the page's "freshness" will expire. 

response.setHeader("Cache-Control","no-cache");	// forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store");	// directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); 			//Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache");		//For backward compatibility to HTTP 1.0
String acNo = "";
if(session.getAttribute("acc_no") != null){
	acNo = (String)session.getAttribute("acc_no");
	bd.setAcc_no(acNo);
}
else
{
	System.out.println("transaction.jsp : Not logged in");
	response.sendRedirect("transaction.jsp");
}

%>
<title>Transaction</title>
</head>
<style>
h1 {
    font-family: "Playfair Display";
    letter-spacing: 5px;
    position: absolute;
    left: 25px;
    top: 45px;
}
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}
img.avatar {
    width: 20%;
    border-radius: 50%;
}
 .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}
</style>
<body background="transactionbg.jpg">


<nav class="navbar navbar-inverse  navbar-fixed-top"  role="navigation" >
       <div class="container">
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-left">
                    <li><a href="home.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a></li>
                   <li><a data-toggle="modal" data-target="#DepositModal"><span class="glyphicon glyphicon-info-sign"></span> Deposit</a></li>
                   <li><a data-toggle="modal" data-target="#WithdrawModal"><span class="glyphicon glyphicon-info-sign"></span> Withdraw</a></li>
                   <li><a data-toggle="modal" data-target="#TransferModal"><span class="glyphicon glyphicon-info-sign"></span>Transfer</a></li>
                   <li><a data-toggle="modal" data-target="#BalanceEnquiryModal"><span class="glyphicon glyphicon-info-sign"></span> Balance Enquiry</a></li>
                   <li><a data-toggle="modal" data-target="#monthly"><span class="glyphicon glyphicon-info-sign"></span>Monthly Statements</a></li>
                   <li><a data-toggle="modal" data-target="#last10"><span class="glyphicon glyphicon-info-sign"></span> Last 10 Transaction</a></li>
                </ul>
             </div>
       </div>
</nav>
    <!-- Deposit Modal -->
    <div id="DepositModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
        <!--  Modal Content -->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"> &times;</button>
                <h4 class="modal-title">Enter Deposit Amount</h4>
            </div>
            <div class="modal-body">
                   <form class="form-inline" name="MyForm" action="deposit-servlet" method="post" enctype="application/x-www-form-urlencoded">
                   <div class="form-group">
                      <input type="number" class="form-control input-sm" placeholder="depositing amount limit is between $100-$25000" name="depositParam" width="300px" required>
                       </div>
              		   <div class="modal-footer">
		          <input type="submit" class="btn btn-success" name="button1" value="Submit" >
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
                    </form>
            </div>
           </div>
        </div>
    </div>

	 <!-- Withdraw Modal -->
    <div id="WithdrawModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
        <!--  Modal Content -->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"> &times;</button>
                <h4 class="modal-title">Withdraw</h4>
            </div>
            <div class="modal-body">
                   <form class="form-inline" action="withdraw" method="post">
                   <div class="form-group">
                       <label class="sr-only" for="ammount">Enter Ammount</label>
                       <input type="number" class="form-control input-sm" placeholder="Enter Your Ammount" name="withdrawParam" width="300px" required>
                       </div>
              		   <div class="modal-footer">
		          <input type="submit" class="btn btn-success" name="button1" value="Submit" >
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
                    </form>
            </div>
           </div>
        </div>
    </div>
    
    
     <!-- Transfer Modal -->
    <div id="TransferModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
        <!--  Modal Content -->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"> &times;</button>
                <h4 class="modal-title">Transfer balance</h4>
            </div>
            <div class="modal-body">
                   <form class="form-inline" action="transfer" method="post">
                   <div class="form-group">
                       <label class="sr-only" for="ammount">Enter Ammount</label>
                       <input type="number" class="form-control input-sm" placeholder="Enter Your Ammount" name="amount" width="300px" required>
                       <label class="sr-only" for="ammount">Enter Account number</label>
                       <input type="text" class="form-control input-sm" placeholder="Enter receiver account number" name="account" width="300px" required>
                       </div>
              		   <div class="modal-footer">
		          <input type="submit" class="btn btn-success" name="button1" value="Submit" >
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
                    </form>
            </div>
           </div>
        </div>
    </div>
    
    
     <!-- Balance Enquiry Modal -->
    <div id="BalanceEnquiryModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
        <!--  Modal Content -->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"> &times;</button>
                <h4 class="modal-title">Balance Enquiry</h4>
            </div>
            <div class="modal-body">
                   <form class="form-inline">
                   <div class="form-group">
                   <%String ac=(String)session.getAttribute("acc_no"); %>
                       <p><font color="red">Current balance is :</font> <%=new transactionentry().currentBalance(ac)%></p>
                       </div>
              		   <div class="modal-footer">
		         		 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		       		   </div>
                   </form>
            </div>
           </div>
        </div>
    </div>


<!-- Last 10 transactions -->
	<!-- Modal -->
	  <div id="last10" class="modal fade" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Last 10 transactions</h4>
	        </div>
	        <div class="modal-body">
	          <p>
					<%
					transactionentry obj = new transactionentry();
					acNo = (String)session.getAttribute("acc_no");
					ResultSet rs = obj.retrieve(acNo);
					
					boolean flag = true;
					
					if(!rs.next()) {
					    out.println("data for this acc no. not found in database! Try Again! ");
					    flag = false;
					} 
					else
					{
						do
						{
							System.out.println("Home.jsp : Retrieved successfully");					  
					%>
	          
			          <table border="1" align="center">
			            <tr>
			               <th>Account number</th>
			               <th>Withdraw</th>
			               <th>Deposit</th>
			               <th>Ammount</th>
			               <th>Date</th>
			           </tr>
						<tr>
			               <td> <%= rs.getString(1) %> </td>
			               <td> <%= rs.getInt(2) %> </td>
			               <td> <%= rs.getInt(3) %> </td>
			               <td> <%= rs.getInt(4) %> </td>
			               <td> <%= rs.getDate(5) %> </td>
					    </tr>
					<br>
					<% 
									
						}while(rs.next()); 
					}
					rs.close();
					%>
					</table>

			</p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>     
	    </div>
	  </div>


<!-- Monthly Statements -->
	  <!-- Modal -->
	  <div class="modal fade" id="monthly" role="dialog">
	    <div class="modal-dialog">
	    <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Monthly Statements</h4>
	        </div>
	        <div class="modal-body">
	          <p>
					<%
					transactionentry obj1 = new transactionentry();
					acNo = (String)session.getAttribute("acc_no");
					ResultSet rs1 =obj1.retrieveMonthly(acNo);
					
					boolean flag11 = true;
					
					if(!rs1.next()) {
					    out.println("data for this acc no not found in database! Try Again! ");
					    flag11 = false;
					} 
					else
					{
						do
						{
							System.out.println("Home.jsp : Retrieved successfully");					  
					%>
	          
			          <table border="1" align="center">
			            <tr>
			               <th>Date</th>
			               <th>Count</th>
			           </tr>
						<tr>
			               <td> <%= rs1.getDate(1) %> </td>
			               <td> <%= rs1.getString(2) %> </td>
					    </tr>
					<br>
					<% 
									
						}while(rs1.next()); 
					}
					rs1.close();
					%>
					</table>
	        
	        </p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-success" data-dismiss="modal">Done</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>     
	    </div>
	  </div>



<section>
  <h1>Welcome ${BankRedg.firstname} ${BankRedg.lastname}</h1>
</section>
<section class="w3-row-padding w3-center w3-container w3-padding-64 w3-light-grey">
<!-- slide show-->
<div class="imgcontainer">
    <img src="citilogo.jpg" alt="Avatar" class="avatar">
  </div>
<div class="w3-container w3-padding-64 w3-center w3-black w3-xlarge">
  <img class="mySlides" src="trslider.jpg" width="100%" height="400">
  <img class="mySlides" src="trslider2.jpg" width="100%" height="400">
  <img class="mySlides" src="trslider3.jpg" width="100%" height="400">
  <img class="mySlides" src="trslider4.jpg" width="100%" height="400">
  <img class="mySlides" src="trslider5.jpg" width="100%" height="400">
  <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(4)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(5)"></span>
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
</section>
</body>
</html>