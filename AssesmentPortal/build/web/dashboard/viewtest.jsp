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

                        <table class="box-table-a">
                            <tr>
                                <td colspan="2">BranchId</td>
                                <td colspan="2">Classid</td>
                                <td>SubjectId</td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="text" name="branchid" value="${branchid}"></td>
                                
                                <td colspan="2"><select name="classid" onchange="showUser6(this.value)">
                                        <option>Select Class</option>
                                        <c:forEach items="${classid}" var="class"><option>${class}</option></c:forEach>
                                    </select></td>
                                
                                
                                <td><div id="txtSubject">
                                                        <select name="subjectname" id="subjectname">
                                                <option class="text1">Select Group</option>
                                            </select></div></td>
                                
                            </tr>
                        </table>
                                    <div id="queslist">
                                        
                                        
                                    </div>
                                    
                               
                    </section>
                </div>
</div>

        </div>
    </body>
</html>
