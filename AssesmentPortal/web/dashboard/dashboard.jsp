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


<style>
    #imgid{
        height: 40px;
    }
</style>

</head>
 <body>
 <div class="wrapper1">
   <div class="headerinner clearfix">
       <%@include file="header.jsp" %>
   </div>
     
      <div class="leftsec clearfix">
         
     <div class="clearfix"></div>
     <div id="adminmenuback"></div>
    
      <section class="adminmenuwrap clearfix">
          <section class="profilpc">
             
              
              <a href="#"><img src="img/profpic.png" alt="" style="height: 100px; padding: 20px;" /><p style="padding: 0px 0px 0px 30px;"><%=session.getAttribute("username")%></p></a>
         
              
          </section>
       <ul>
           <%
            ArrayList alst=(ArrayList)session.getAttribute("allowed_permissions");
     
            for(int i=0;i<alst.size();i++){
            
                PermissionsBean bean=(PermissionsBean)alst.get(i);
            
                if(
                        bean.getPermissionname().equalsIgnoreCase("Assign Student")||
                        bean.getPermissionname().equalsIgnoreCase("course content") ||
                        bean.getPermissionname().equalsIgnoreCase("lectures")||
                        bean.getPermissionname().equalsIgnoreCase("attendance")||
                        bean.getPermissionname().equalsIgnoreCase("assignments")||
                        bean.getPermissionname().equalsIgnoreCase("tests")||
                        bean.getPermissionname().equalsIgnoreCase("mail")||
                        bean.getPermissionname().equalsIgnoreCase("grades")||
                        bean.getPermissionname().equalsIgnoreCase("add user") ||
                        bean.getPermissionname().equalsIgnoreCase("Assign Lecturer")||
                        bean.getPermissionname().equalsIgnoreCase("View Test") ||
                        bean.getPermissionname().equalsIgnoreCase("Approve Test")||
                        bean.getPermissionname().equalsIgnoreCase("view assignments")
                        ){
                
                
            %>
           
           
            <li><p><img src="dashboardicons/<%= bean.getPermissionname()%>.png" alt="" id="imgid"></p><a href="../<%= bean.getServletname()%>Servlet"><%= bean.getPermissionname()%></a></li>
          
       
       <%
            }
            
            }
            %>
       </ul>
     </section>
    
    </div>
     <div class="listsec">
     <div class="wrapper">
         
         
         <ul>
         <%
       
            for(int i=0;i<alst.size();i++){
            
                PermissionsBean bean=(PermissionsBean)alst.get(i);
            
                if(
                        bean.getPermissionname().equalsIgnoreCase("view assignments")||
                        bean.getPermissionname().equalsIgnoreCase("course content") ||
                        bean.getPermissionname().equalsIgnoreCase("lectures")||
                        bean.getPermissionname().equalsIgnoreCase("attendance")||
                        bean.getPermissionname().equalsIgnoreCase("assignments")||
                        bean.getPermissionname().equalsIgnoreCase("tests")||
                        bean.getPermissionname().equalsIgnoreCase("mail")||
                        bean.getPermissionname().equalsIgnoreCase("grades")||
                        bean.getPermissionname().equalsIgnoreCase("add user") ||
                        bean.getPermissionname().equalsIgnoreCase("Assign Student")||
                        bean.getPermissionname().equalsIgnoreCase("Assign Lecturer")||
                        bean.getPermissionname().equalsIgnoreCase("View Test") ||
                        bean.getPermissionname().equalsIgnoreCase("Approve Test")
                        ){
                
                
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
