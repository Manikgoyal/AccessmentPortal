<%-- 
    Document   : adduser
    Created on : 26 Oct, 2013, 4:09:14 PM
    Author     : manik
--%>
<%@page import="java.sql.Array"%>
<%@page import="com.arcadian.loginbeans.UsersBean"%>
<%@page import="com.arcadian.loginbeans.AttendanceBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.arcadian.loginbeans.UserDetailBean"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>View Class Attendance</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/bootstrap.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/bootstrap-responsive.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/bootstrap.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/stylesheet.css" rel="stylesheet">
        <link href="fonts/fonts.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/bootstrap-responsive.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/customstylesheet.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/button.css" rel="stylesheet" >
        <link href="<%=request.getContextPath()%>/dashboard/tabs-css/demo.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/tabs-css/main.css" rel="stylesheet">
        <script src="<%=request.getContextPath()%>/pages/lecturersubjectid.js"></script>
    
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
                    <h4>Attendance List</h4>
                    <section class="centr">

                        <select name="drpclasslist"  onchange="showUser3(this.value)">
                            <option>Select Class</option>
                            <c:forEach items="${alstuserid}" var="userid">
                                <option value="${userid}">${userid}</option>
                            </c:forEach>    
                        </select>
                        
                        <div id="txtSubject"></div>
                    </section>
                </div>


            </div>

        </div>
                        
                         
    </body>
</html>
