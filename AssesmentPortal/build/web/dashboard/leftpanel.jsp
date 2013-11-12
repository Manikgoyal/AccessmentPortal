<%-- 
    Document   : leftpanel
    Created on : 6 Nov, 2013, 12:47:59 PM
    Author     : manik
--%>

<%@page import="com.arcadian.loginbeans.PermissionsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
    #imgid{
        height: 40px;
    }
</style>

    </head>
    <body>
        <section class="adminmenuwrap clearfix">
          <section class="profilpc">
             
              
              <a href="#"><img src="<%=request.getContextPath()%>/dashboard/img/profpic.png" alt="" style="height: 100px; padding: 20px;" /><p style="padding: 0px 0px 0px 30px;"><%=session.getAttribute("username")%></p></a>
         
              
          </section>
       <ul>
           
           
           <%
            ArrayList alstLeftPanel=(ArrayList)session.getAttribute("allowed_permissions");
     
            for(int i=0;i<alstLeftPanel.size();i++){
            
                PermissionsBean bean=(PermissionsBean)alstLeftPanel.get(i);
            
                if(
                        bean.getPermissionname().equalsIgnoreCase("dashboard")||
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
                        bean.getPermissionname().equalsIgnoreCase("Approve Test")
                        ){
                
                
            %>
           
           
            <li><p><img src="<%=request.getContextPath()%>/dashboard/dashboardicons/<%= bean.getPermissionname()%>.png" alt="" id="imgid"></p><a href="<%= bean.getServletname()%>Servlet"><%= bean.getPermissionname()%></a></li>
          
       
       <%
            }
            
            }
            %>
       </ul>
     </section>
    
    </body>
</html>
