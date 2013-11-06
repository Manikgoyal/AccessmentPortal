<%-- 
    Document   : adduser
    Created on : 26 Oct, 2013, 4:09:14 PM
    Author     : manik
--%>

<%@page import="com.arcadian.loginbeans.UserattendBean"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>View Individual Attendance</title>
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
    </head>
    <body>
        <div class="wrapper1">
            <div class="headerinner clearfix">
               <%@include file="header.jsp" %>
            </div>

            <div class="leftsec clearfix">

                <div class="clearfix"></div>
               <%@include file="leftpanel.jsp" %>
            </div>

            <div class="centersec clearfix">
                <div class="prof">   
                    <h4>Attendance</h4>
                    <section class="centr">

                        <table class="box-table-a">
                            <caption>Subject List</caption>
                            <thead>
                                <tr>
                                    <th scope="col">Subject id</th>
                                    <th scope="col">Lectures Attended</th>
                                    <th scope="col">Lectures Delivered</th>
                                    <th scope="col">Lectid</th>
                                    
                                    <th scope="col">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                               
                                
                                <%ArrayList subjects;
                                subjects= (ArrayList)request.getAttribute("subjects") ;
                                UserattendBean bean;
                                for(int i=0;i < subjects.size();i++){
                                
                               bean=(UserattendBean)subjects.get(i);
                               String sub=bean.getSubjectid();
                               String attendance=bean.getAttendance();
                                
                                %><tr>
                                    <td><%=sub%></td>
                                    <td><%=attendance%></td>
                                    <td>9</td>
                                    <td><input type="text" name="txtlectid" value="" /></td>
                                    
                                    <td><a href="ViewIndividualAttendanceServlet">Mark Attendance</a></td>
                                </tr><%}%>
                                
                            
                            </tbody>
                        </table>


                    </section>
                </div>


            </div>

        </div>
    </body>
</html>


