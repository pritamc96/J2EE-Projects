<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Our Rates</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
</head>


<style>
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
<div data-role="page" id="pageone">
  <div data-role="header">
    <h1><font color="red">INTEREST</font> RATES</h1>
  </div>

  <div data-role="main" class="ui-content">
    <div data-role="collapsible">
      <h1>SAVINGS ACCOUNT</h1>
      <p>I'm the expanded content.</p>
      <table bgcolor="#386885">
	  <tr>
	    <th>SAVINGS BANK ACCOUNT</th>
	    <th>Interest Rates for Normal Citizen</th>
	    <th>Interest Rates for Senior Citizen</th>
	    <th>Minimum  balance</th>
	  </tr>
	  <tr>
	    <td>a.with cheque book facility</td>
	    <td>4.00%</td>
	    <td>4.00%</td>
	    <td>Metro,Urban- rs. 10000,Semi Urban rs.5000, Rural - rs.2,000</td>
	  </tr>
	  <tr>
	    <td>No Frills Account/Basic Savings Bank Account</td>
	    <td>4.00%</td>
	    <td>4.00%</td>
	    <td>zero</td>
	</table>
    </div>
  </div>
  <div data-role="main" class="ui-content">
    <div data-role="collapsible">
      <h1>FIXED DEPOSITS</h1>
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
  </div>
  <div data-role="main" class="ui-content">
    <div data-role="collapsible">
      <h1>RECURRING/iWISH DEPOSITS</h1>
      <table bgcolor="#386885">
	  <tr>
	    <th>Maturity period</th>
	    <th>Rate of Interest(%pa) w.e.f May 17,2017 for General Citizen</th>
	    <th>Rate of Interest(%pa) w.e.f May 17,2017 for Senior Citizen</th>
	  </tr>
	  <tr>
	    <td>6 months</td>
	    <td>6.50%</td>
	    <td>6.70%</td>
	  </tr>
	  <tr>
	    <td>9 months</td>
	    <td>6.50%</td>
	    <td>7.00%</td>
	  </tr>
	  <tr>
	    <td>12 months</td>
	    <td>6.75%</td>
	    <td>7.25%</td>
	  </tr>
	  <tr>
	    <td>15 months</td>
	    <td>7.00%</td>
	    <td>7.50%</td>
	  </tr>
	  <tr>
	    <td>21 months</td>
	    <td>6.90%</td>
	    <td>7.40%</td>
	  </tr>
	  <tr>
	    <td>24 months</td>
	    <td>6.95%</td>
	    <td>7.45%</td>
	  </tr>
	   <tr>
	    <td>27 months</td>
	    <td>6.85%</td>
	    <td>7.35%</td>
	  </tr>
	  <tr>
	    <td>30 months</td>
	    <td>6.5%</td>
	    <td>7%</td>
	  </tr>
	</table>
    </div>
  </div>
  <div data-role="main" class="ui-content">
    <div data-role="collapsible">
      <h1>NRI DEPOSITS</h1>
      <p>NRE Savings Account</p>
      <p>NRO Savings Account</p>
      <p>RFC Savings Account</p>
    </div>
  </div>
<div data-role="main" class="ui-content">
    <div data-role="collapsible">
      <h1>LOAN AND ADVANCES</h1>
      <p>Two Wheeler Interest Rates</p>
      <p>Car Loan Interest Rates</p>
      <p>Commercial Vehicle Interest Rates</p>
      <p>Personal loan Interest Rates</p>  
      <p>Home Loan Interest Rates</p>
    </div>
  </div>
  <div data-role="footer">
    <h1>Go Back To Login Page</h1>
  </div>
 </div>
</body>
</html>