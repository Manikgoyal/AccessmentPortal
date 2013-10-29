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
        
        
        
        <script>
           var classid;
            
            function getClass(classid){
                this.classid=classid;
                
            }
            
        function f1(studentid){
            
            document.location.href="AssignStudentServlet?classid="+classid+"&studentid="+studentid;
        }
            
        </script>
            
        
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
                    <h4>Users</h4>
                    <section class="centr">
                        
                        <table class="box-table-a">
                            <caption>Student List</caption>
                            <thead>
                                <tr>
                                    <th scope="col">S.NO</th>
                                    <th scope="col">UserName</th>
                                    <th scope="col">Class</th>
                                    <th scope="col">Actions</th>
                                </tr>
                            </thead>
                            
                            <tbody>
                                <c:forEach items="${alstassignStudent}" var="assignstudent" varStatus="sno">
                                    <tr>
                                        <td>${sno.index+1}</td>
                                        <td>${assignstudent}</td>
                                        <td><select name="selClass" id="selClass" onchange="getClass(this.value)">
                                                <option>Select Class</option>
                                                <c:forEach items="${alstClassList}" var="classlist">
                                                    <option value="${classlist.classid}">${classlist.classid}</option>
                                    </c:forEach>
                                            </select></td>
                                            <td><a href="#" onclick="f1('${assignstudent}')" >Assign Student</a></td>
                                    </tr>
                                </c:forEach>
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
                                <c:forEach items="${alstAssignedStudent}" var="assignedstudent" varStatus="sno">
                                    <tr>
                                        <td>${sno.index+1}</td>
                                        <td>${assignedstudent.userid}</td>
                                        <td>${assignedstudent.classid}</td>
                                            <td>Assign Student Done</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            
                        </table>

                    </section>
                </div>


            </div>

        </div>
    </body>
</html>

