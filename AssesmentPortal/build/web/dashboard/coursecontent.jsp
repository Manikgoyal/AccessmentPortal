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
        <script src="<%=request.getContextPath()%>/pages/CourseContent.js"></script>
        
 
        
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
                    <h4>Course Material</h4>
                    <section class="centr">

                        <form action="CourseContentServlet" method="post" name="addcoursematerial" enctype="multipart/form-data">
                            <table class="box-table-a">
                                <caption>Add Course Material</caption>
                                <thead>
                                    <tr>
                                        <th style="width: 90px;">Material id</th>
                                        <th style="width: 90px;">Material Name</th>
                                        <th style="width: 90px;">Class</th>
                                        <th style="width: 90px;">Subject</th>
                                        <th style="width: 90px;">filename</th>
                                        <th style="width: 90px;">upload</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <input type="text" name="materialid" id="materialid" class="text1"  required/></td>
                                        <td><input type="text" name="materialname" id="materialname" class="text1" required/></td>
                                        <td><select name="semname" id="semname" class="text1" onchange="showUser(this.value)" >
                                                <option>Select Semester</option>
                                                <c:forEach items="${alstClassName}" var="classname">
                                                    <option value="${classname.classid}">${classname.classname}</option>
                                                    
                                                </c:forEach>
                                                </select ></td>
                                                <td><div id="txtSubject">
                                                        <select name="subjectname" id="subjectname" class="text1">
                                                <option class="text1">Select Group</option>
                                                


                                            </select></div></td>
                                            <td><input type="text" class="text1" name="uploadFile"/></td>
                                            <td><div class="fileUpload btn btn-primary">
                                                    
    <span>Upload</span>
    <input id="uploadBtn" type="file" name="upoadFile1" class="upload" />
</div></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="#" onclick="JAVASCRIPT:addcoursematerial.submit()"  class="sbtnSubmit">Add</a>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>

                        <table class="box-table-a">
                            <caption>User List</caption>
                            <thead>
                                <tr>
                                    <th scope="col">Material Id</th>
                                    <th scope="col">Material Name</th>
                                    <th scope="col">Class</th>
                                    <th scope="col">Subject</th>
                                    <th scope="col">file name</th>
                                    <th scope="col">Download</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${alstCourseMaterial}" var="coursematerial">
                                <tr>
                                    <td>${coursematerial.materialid}</td>
                                    <td>${coursematerial.materialname}</td>
                                    <td>${coursematerial.classid}</td>
                                    <td>${coursematerial.subjectid}</td>
                                    <td>${coursematerial.filename}</td>
                                    <td><a href="CourseContentServlet?filename=${coursematerial.filename}">Download</a></td>
                                    
                                </tr></c:forEach>
                            
                            </tbody>
                        </table>


                    </section>
                </div>


            </div>

        </div>
    </body>
</html>
