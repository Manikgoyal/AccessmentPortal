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
        <title>Assignment Notifications and Upload Assignment</title>
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
        <script src="<%=request.getContextPath()%>/pages/CourseContent.js"></script>



    </head>
    <body>
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
                    <h4>Lectures</h4>
                    <section class="centr">

                         <table class="box-table-a">
                                <caption>View Assignments</caption>
                                <thead>
                                    
                                        <th scope="col">Assignment Id</th>
                                        <th scope="col">User Id</th>
                                        <th scope="col">file name</th>
                                        <th scope="col">Marks</th>
                                        <th scope="col">Submit your assignment</th>
                                    
                                </thead>
                                    <tbody>
                                <c:forEach items="${alstAssignmentNotice}" var="assignmentnotice" varStatus="in">
                                <form name="form${in.index}" action="ViewAssignmentServlet"  method="post">    
                                 <tr>
                                            
                                        <td>${assignmentnotice.assignmentid}</td>
                                            <td>${assignmentnotice.userid}</td>
                                            <td><a href="ViewAssignmentServlet?filename=${assignmentnotice.file}">${assignmentnotice.file}</a></td>
                                    
                                            <td><input type="text" class="text1" name="marks"/></td>
                                            
                                                    <input type="hidden" name="userid" value="${assignmentnotice.userid}">
                                                    <input type="hidden" name="assignmentid" value="${assignmentnotice.assignmentid}">
                                            
                                                    <td><a href="#" onclick="JAVASCRIPT:form${in.index}.submit()"  class="sbtnSubmit">Submit</a></td>
                                    
                                        </tr>
                                 </form>
                                </c:forEach>
                                </tbody>
                                
                            </table>

                    </section>
                </div>


            </div>

        </div>
    </body>
</html>
