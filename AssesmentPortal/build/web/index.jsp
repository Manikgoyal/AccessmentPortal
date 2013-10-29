<%-- 
    Document   : index
    Created on : 26 Oct, 2013, 1:02:08 PM
    Author     : manik
--%>

<!doctype html>

<!--[if IE 7 ]>    <html lang="en-gb" class="isie ie7 oldie no-js"> <![endif]-->

<!--[if IE 8 ]>    <html lang="en-gb" class="isie ie8 oldie no-js"> <![endif]-->

<!--[if IE 9 ]>    <html lang="en-gb" class="isie ie9 no-js"> <![endif]-->

<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en-gb" class="no-js"> <!--<![endif]-->

<html lang="en">
<head>
<meta charset="utf-8">
<title>Loginform</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="wrapper">
<div class="top_logo"><img src="images/logo.jpg" width="387" height="93" alt=""></div>
 <div class="login">
   <div class="loginleft">
    <h2>Click to login with:</h2>
    <ul>
     <li><a href="#"><img src="images/login.jpg" width="300" height="45" alt=""></a></li>
     <li><a href="#"><img src="images/twitter.jpg" width="300" height="45" alt=""></a></li>
     <li><a href="#"><img src="images/facebook.jpg" width="300" height="45" alt=""></a></li>
    </ul>
   </div>

   <div class="loginrgt">
    <h2>Email & Password :</h2>
    <form class="enquiry-form" action="LoginServlet">
        <p><input type="text" name="username" autocomplete="off"  required></p>
     <p><input type="Password" name="password" autocomplete="off"   required></p>
     
     <p><input type="submit" value="Sign in"></p>
    </form>
   </div>
   
</div>
</div>
</body>
</html>
