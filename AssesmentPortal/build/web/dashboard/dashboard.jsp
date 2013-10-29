<%-- 
    Document   : dashboard
    Created on : 26 Oct, 2013, 2:03:50 PM
    Author     : manik
--%>
<%@page import="com.arcadian.loginbeans.PermissionsBean"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Collage</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="dashcss/bootstrap.css" rel="stylesheet">
<link href="dashcss/bootstrap-responsive.css" rel="stylesheet">
<link href="dashcss/bootstrap.min.css" rel="stylesheet">
<link href="dashcss/stylesheet.css" rel="stylesheet">
<link href="dashcss/bootstrap-responsive.min.css" rel="stylesheet">
<link href="dashcss/customstylesheet.css" rel="stylesheet">

</head>
 <body>
 <div class="wrapper1">
   <div class="headerinner clearfix">
    <header class="row-fluid">
        <article id="innlogo" class="span3"><a href="#"><img src="img/logo.png" alt="" title="logo"></a></article>
      <article id="inptxt" class="span4"><input type="text" placeholder="Search" class="input-block-level" id="inputNew"></article>
      <article id="transforming" class="span5">
          <ul>
              <li><img src="img/home_img.jpg" alt="" title=""></li>   
              <li><img src="img/chat_img.jpg" alt="" title=""></li>
              <li><img src="img/percent.jpg" alt="" title=""></li>
          </ul>
      
      </article>
     </header>
   </div>
     
      <div class="leftsec clearfix">
         
     <div class="clearfix"></div>
     <div id="adminmenuback"></div>
    
      <section class="adminmenuwrap clearfix">
          <section class="profilpc">
         <img src="img/profpic.png" alt="">
         </section>
       <ul>
           <li><p><img src="img/dashome.png" alt=""></p><a href="#">Dashboard</a></li>
           <li><p><img src="img/ui.png" alt=""></p><a href="#">UI Elements</a></li>
           <li><p><img src="img/input.png" alt=""></p><a href="#">Input</a></li>
           <li><p><img src="img/input.png" alt=""></p><a href="#">Input</a></li>
           <li><p><img src="img/input.png" alt=""></p><a href="#">Input</a></li>
       </ul>
     </section>
    
    </div>
     <div class="listsec">
     <div class="wrapper">
         
         
         <ul>
         <%
            ArrayList alst=(ArrayList)session.getAttribute("allowed_permissions");
     
            for(int i=0;i<alst.size();i++){
            
                PermissionsBean bean=(PermissionsBean)alst.get(i);
            
                if(bean.getPermissionname().equalsIgnoreCase("course content") ||bean.getPermissionname().equalsIgnoreCase("lectures")||bean.getPermissionname().equalsIgnoreCase("attendance")
                        ||bean.getPermissionname().equalsIgnoreCase("assignments")||bean.getPermissionname().equalsIgnoreCase("tests")||bean.getPermissionname().equalsIgnoreCase("mail")
                        ||bean.getPermissionname().equalsIgnoreCase("grades")||bean.getPermissionname().equalsIgnoreCase("add user")){
                
                
            %>
                
            
            <li><a href="../<%= bean.getServletname()%>Servlet"><img src="dashboardicons/<%= bean.getPermissionname()%>.png" alt="" /><p><%= bean.getPermissionname()%></p></a></li> 
                
            <%
            }
            
            }
            %>    
             
             
             
         </ul>  
         
     </div> 
     </div>   
     </div>   
</body>
</html>
