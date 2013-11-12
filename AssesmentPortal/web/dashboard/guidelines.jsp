<%-- 
    Document   : adduser
    Created on : 26 Oct, 2013, 4:09:14 PM
    Author     : manik
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.arcadian.loginbeans.UserDetailBean"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Course Content</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/bootstrap.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/bootstrap-responsive.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/bootstrap.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/stylesheet.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/textbox.css" rel="stylesheet">
 
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/bootstrap-responsive.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/customstylesheet.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/button.css" rel="stylesheet" >
       <script src="<%=request.getContextPath()%>/pages/lecturersubject.js"></script>
        
 
        
    </head>
    <body>
        <div class="wrapper1">
            <div class="headerinner clearfix">
                <%@include file="header.jsp" %>
            </div>

            <div class="leftsec clearfix">

                <div class="clearfix"></div>
                <div id="adminmenuback"></div>

               <%@include file="leftpanel.jsp" %>

            </div>

            <div class="centersec clearfix">
                <div class="prof">   
                    <h4>Guide Lines</h4>
                    <section class="centr">

                        <table class="box-table-a">
                            <thead>
                                <tr>
                                    <th>1. Test will be of 1 hour.</th>
                                </tr>
                                <tr>
                                    <th>2. Test contain 20 questions</th>
                                </tr>
                                <tr>
                                    <th>3. Don't Refresh browser.</th>
                                </tr>
                                <tr>
                                    <th>4. Test will be of 1 hour.</th>
                                </tr>
                            </thead>
                        
                            <tbody>
                                <tr>
                                    <td>
                                        <form action="../QuestionServlet" method="post">
                                            <input type="hidden" name="testid" value="<%=request.getParameter("testid")%>" /> 
                                        <button style="margin: 0px 0px 0px 400px;" type="submit">Start Test</button></form> </td>
                                </tr>
                            </tbody>
                            
                        </table>

                        

                    </section>
                </div>
</div>

        </div>
    </body>
</html>
