<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<head>
<script>
function validateForm() {
    var x = document.forms["myForm"]["opbal"].value;
    if (x < 100 && x > 25000) {
        alert("Name must be filled out");
        return false;
    }
}
</script>
</head>
<style>
form {
    border: 5px solid #fffff;
    opacity: 0.85;
    margin: 0 auto; 
	width:250px;
}

input[type=text], input[type=password], input[type=tel], input[type=email], input[type=date]{
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
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
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

body {
    background-image: url("background1.jpg");
    width:100%;
}
</style>
<body>
<!-- Navigation -->
<div class="w3-bar w3-black" id="myNavbar">
    <a class="w3-bar-item w3-button w3-hover-black w3-hide-medium w3-hide-large w3-right" href="javascript:void(0);" onclick="toggleFunction()" title="Toggle Navigation Menu">
      <i class="fa fa-bars"></i>
    </a>
    <a href="login.jsp" class="w3-bar-item w3-button">Login Page</a>
  </div>
<form style="width: 500px" action="RegisterServlets" name="myForm" onsubmit="return validateForm()" method="post">
  <div class="imgcontainer">
    <img src="citilogo.jpg" alt="Avatar" class="avatar">
  </div>

    <div class="container">
    <label><b>Your First Name</b></label>
    <input type="text" placeholder="Your First Name" name="fname" required>
	
	<label><b>Your Last Name</b></label>
    <input type="text" placeholder="Your Last Name" name="lname" required>
    
    <label><b>Your Email  Address</b></label>
    <input type="email" placeholder="Email Format will be letters/numbers@maindomain.com" name="uid" required>
    
    <label><b>Enter Your Password</b></label>
    <input type="password" placeholder="Enter Password" name="pwd" required>
    
    <label><b>Your Residential Address</b></label>
    <input type="text" placeholder="Enter Your Address" name="add" required>
    
    <label><b>Your Phone Number</b></label>
    <input type="tel" placeholder="Enter Phone Number" name="ph" required>
    
    <label><b>Your Pincode</b></label>
    <input type="text" placeholder="Enter Your Pincode" name="pin" required>
    
    <label><b>Opening balance</b></label>
    <input type="text" placeholder="opening balance must be in between 500 and 25000" name="opbal" required>
    
    <label><b>Todays Date</b></label>
    <input placeholder="Enter Todays Date" type="date" name="dt" required>
      
    <button type="submit">Register</button>
  </div>

  <div class="container">
    <button type="reset" class="cancelbtn">Cancel</button>
  </div>
</form>
</body>
</html>