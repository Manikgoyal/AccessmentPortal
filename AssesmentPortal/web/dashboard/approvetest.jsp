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
       <script src="<%=request.getContextPath()%>/pages/viewlecturersubject.js"></script>
       <script src="<%=request.getContextPath()%>/pages/queslist.js"></script>
        
       <script>
           function chkclick(str,testid){
           document.location.href="ApproveTestServlet?status1="+str+"&testid1="+testid;
           
           }
           
           function deleteTest(testid){
               document.location.href="ApproveTestServlet?testid1="+testid;
           }
           
           
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
                    <h4>Course Material</h4>
                    <section class="centr">
                        <form action="ApproveTestServlet" method="post">
                        <table class="box-table-a">
                            <tr>
                                <td colspan="4">Test Name</td>
                            </tr>
                            <tr>
                                <td colspan="4"><input type="text" name="testname" /></td>
                            </tr>
                            
                            <tr>
                                <td>Test Id</td>
                                <td>BranchId</td>
                                <td>Classid</td>
                                <td>SubjectId</td>
                            </tr>
                            
                            <tr>
                                <td><input type="text" name="testid" ></td>
                                <td><input type="text" name="branchid" value="${branchid}"></td>
                                
                                <td><select name="classid" onchange="showUser6(this.value)">
                                        <option>Select Class</option>
                                        <c:forEach items="${classid}" var="class"><option>${class}</option></c:forEach>
                                    </select></td>
                                
                                
                                <td><div id="txtSubject">
                                                        <select name="subjectname" id="subjectname">
                                                <option class="text1">Select Group</option>
                                            </select></div></td>
                                
                            </tr>
                             <tr>
                                <td>Max Marks</td>
                                <td>Date of Test</td>
                                <td>Max Time</td>
                                <td>Status</td>
                            </tr>
                            
                            <tr>
                                <td><input type="text" name="maxmarks"></td>
                                <td><input type="date" name="dateoftest"/></td>
                                <td><input type="time" name="time"></td>
                                <td><input type="text" name="status"></td>
                            </tr>
                            <tr>
                                <td colspan="4"><button type="submit">Create Test</button></td>
                            </tr>
                        </table>
                                  
                                  </form>  
                                    
                                    
                                    <table class="box-table-a">
                                        <thead>
                                        <th>Test Id</th>
                                        <th>Test Name</th>
                                        <th>Class Id</th>
                                        <th>Subject Id</th>
                                        <th>Max Marks</th>
                                        <th>Date Of Test</th>
                                        <th>Max Time</th>
                                        <th>Status</th>
                                        <th>delete</th>
                                        </thead>
                                        
                                        <tbody>
                                        <c:forEach items="${alstTestDetails}" var="test">
                                            <tr>
                                                <td>${test.testid}</td>
                                                <td>${test.testname}</td>
                                                <td>${test.classid}</td>
                                                <td>${test.subjectid}</td>
                                                <td>${test.maximarks}</td>
                                                <td>${test.dateoftest}</td>
                                                <td>${test.maxitime}</td>
                                                
                                                <c:choose>
                                                    <c:when test="${test.status eq 'true'}">
                                                        <c:set var="checked" value="checked"></c:set>
                                                        <td><input type="checkbox" name="chkStatus"  ${checked} value="${test.status}" onchange="chkclick(this.value,'${test.testid}')" /></td>        
                                                    </c:when>
                                                    <c:otherwise>
                                                    <td><input type="checkbox" name="chkStatus" value="${test.status}" onchange="chkclick(this.value,'${test.testid}')" /></td> 
                                                    </c:otherwise>
                                                </c:choose>
                                                    <td><a href="#" onclick="deleteTest('${test.testid}')">delete</a></td>
                                                    
                                            </tr></c:forEach>
                                        </tbody>
                                    </table>
                               
                    </section>
                </div>
</div>

        </div>
    </body>
</html>
