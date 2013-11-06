<%-- 
    Document   : adduser
    Created on : 26 Oct, 2013, 4:09:14 PM
    Author     : manik
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.arcadian.loginbeans.UserDetailBean"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
       <script src="<%=request.getContextPath()%>/pages/viewlecturersubject.js"></script>
       <script src="<%=request.getContextPath()%>/pages/queslist.js"></script>
       <script src="<%=request.getContextPath()%>/dashboard/js/starttime.js"></script>
        
    
        
    </head>
    <body onload="startTime()">
        <div class="wrapper1">
            <div class="headerinner clearfix">
                <header class="row-fluid">
                    <article id="innlogo" class="span3"><a href="#"><img src="<%=request.getContextPath()%>/dashboard/img/logo.png" alt="" title="logo"></a></article>
                    <article id="inptxt" class="span4"><input type="text" placeholder="Search" class="input-block-level" id="inputNew"></article>
                    <article id="transforming" class="span5">
                        <ul>
                            <li><img src="<%=request.getContextPath()%>/dashboard/img/home_img.jpg" alt="" title=""></li>   
                            <li><img src="<%=request.getContextPath()%>/dashboard/img/chat_img.jpg" alt="" title=""></li>
                            <li><img src="<%=request.getContextPath()%>/dashboard/img/percent.jpg" alt="" title=""></li>
                        </ul>

                    </article>
                </header>
            </div>

            <div class="leftsec clearfix">

                <div class="clearfix"></div>
                <div id="adminmenuback"></div>

                <section class="adminmenuwrap clearfix">
                    <section class="profilpc">
                        <img src="<%=request.getContextPath()%>/dashboard/img/profpic.png" alt="">
                    </section>
                    <ul>
                        <li><p><img src="<%=request.getContextPath()%>/dashboard/img/dashome.png" alt=""></p><a href="#">Dashboard</a></li>
                        <li><p><img src="<%=request.getContextPath()%>/dashboard/img/ui.png" alt=""></p><a href="#">UI Elements</a></li>
                        <li><p><img src="<%=request.getContextPath()%>/dashboard/img/input.png" alt=""></p><a href="#">Input</a></li>
                        <li><p><img src="img/input.png" alt=""></p><a href="#">Input</a></li>
                        <li><p><img src="img/input.png" alt=""></p><a href="#">Input</a></li>
                    </ul>
                </section>

            </div>

            <div class="centersec clearfix">
                <div class="prof">   
                    <h4>Course Material</h4>
                    <section class="centr">
                        <c:set var="now" value="<%=new java.util.Date()%>" />
                                    <table class="box-table-a">
                                        <thead>
                                        <th>Test Name</th>
                                        <th>Subject Id</th>
                                        <th>Max Marks</th>
                                        <th>Date Of Test</th>
                                        <th>Max Time</th>
                                        <th>Status</th>
                                        </thead>
                                        
                                        <tbody>
                                        <c:forEach items="${alstTestDetails}" var="test">
                                            <tr>
                                                <td>${test.testname}</td>
                                                <td>${test.subjectid}</td>
                                                <td>${test.maximarks}</td>
                                                <td>${test.dateoftest}</td>
                                                <td>${test.maxitime}</td>
                                                
                                                <fmt:formatDate var="date" pattern="yyyy-MM-dd" value="${now}" />
                                                <fmt:formatDate var="time" value="${now}" pattern="HH:mm:ss"/>
                                                <div id="txt"></div>
                                                <c:choose>
                                                    <c:when test="${test.status eq 'false' && date <= test.dateoftest}">
                                                        <td><input type="submit" value="Start Test"  disabled/></td>        
                                                    </c:when>
                                                    <c:when test="${test.status eq 'true' && (date == test.dateoftest)}">
                                                        <td><input type="submit" value="Start Test" /></td>        
                                                    </c:when>
                                                            <c:otherwise>
                                                            <td> Test Finished</td>
                                                            </c:otherwise>
                                                        
                                                </c:choose>
                                                
                                                
                                                
                                                    
                                            </tr></c:forEach>
                                        </tbody>
                                    </table>
                               
                    </section>
                </div>
</div>

        </div>
    </body>
</html>
