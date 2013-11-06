<%-- 
    Document   : adduser
    Created on : 26 Oct, 2013, 4:09:14 PM
    Author     : manik
--%>
<%@page import="com.arcadian.loginbeans.ClassesBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.arcadian.loginbeans.UserDetailBean"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Dashboard</title>
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
        <script src="<%=request.getContextPath()%>/pages/lecturersubject.js"></script>
            
        <script>
            
           
            
        </script>
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
                    <h4>Users</h4>
                    <section class="centr">
                        
                        <table class="box-table-a">
                            <caption>Assigned Lecturer List</caption>
                            <thead>
                                <tr>
                                    <th scope="col">User Id</th>
                                    <th scope="col">Class Id</th>
                                    <th scope="col">Subject Id</th>
                                    <th scope="col">Assign Lecture</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                <td> <select><c:forEach items="${asltAssignLecturerId}" var="lectureid">
                                       
                                            <option>${lectureid}</option>
                                        
                                 </c:forEach></select></td>
                                <td><select onclick="showUser2(this.value)">
                                        <option>Select Class</option>
                                        <c:forEach items="${alstLecturerClassId}" var="classid">
                                            <option value="${classid}">${classid}</option>
                                        </c:forEach>
                                    </select></td>
                                <td>
                                    <div id="txtSubject">
                                                        <select name="subjectname" id="subjectname" class="text1">
                                                <option class="text1">Select Subject</option>
                                                


                                            </select></div>
                                </td>
                                <td><a href="#" onclick="">Assign Lecture</a></td>
                                   </tr>  
                            </tbody>
                            
                        </table>

                        
                        
                         <table class="box-table-a">
                            <caption>Assigned List</caption>
                            <thead>
                                <tr>
                                    <th scope="col">S.NO</th>
                                    <th scope="col">UserName</th>
                                    <th scope="col">Class</th>
                                    <th scope="col">Actions</th>
                                </tr>
                            </thead>
                            
                            <tbody>
                                
                            </tbody>
                            
                        </table>

                    </section>
                </div>


            </div>

        </div>
    </body>
</html>

