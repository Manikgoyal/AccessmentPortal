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
                       
                        <c:choose>
                            <c:when test="${page_number le (listsize-1)}">
                                <form action="QuestionServlet" name="ques" method="post">
                        
                            
                            <table class="box-table-a">
                            
                            <c:forEach items="${alstQuesAns}" var="ques">
                            <tr>
                                <td colspan="2">Question ${ques.question}</td>
                            </tr>
                            
                            <tr>
                                <td><input type="radio" name="group" value="A"/> ${ques.opt1}</td>
                                <td><input type="radio" name="group" value="B"/> ${ques.opt2}</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="group" value="C"/> ${ques.opt3}</td>
                                <td><input type="radio" name="group" value="D"/> ${ques.opt4}</td>
                            
                            </tr>
                            <tr>
                                <td><input type="hidden" name="page_number" value="${page_number+1}" /></td>
                                <td><input type="hidden" name="quesno" value="${ques.quesno}" /></td>
                            </tr>
                            </c:forEach>
                            <tr>
                                <td> <a href="#" onclick="JAVASCRIPT:ques.submit()"  class="sbtnSubmit">Next</a></td>
                            </tr>
                        </table>
                            </form>
                            </c:when>
                            <c:when test="${page_number eq listsize}">
                                
                                
                                       <form action="TestFinishServlet" name="ques" method="post">
                        
                            
                            <table class="box-table-a">
                            
                            <c:forEach items="${alstQuesAns}" var="ques">
                            <tr>
                                <td colspan="2">Question ${ques.question}</td>
                            </tr>
                            
                            <tr>
                                <td><input type="radio" name="group" value="A"/> ${ques.opt1}</td>
                                <td><input type="radio" name="group" value="B"/> ${ques.opt2}</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="group" value="C"/> ${ques.opt3}</td>
                                <td><input type="radio" name="group" value="D"/> ${ques.opt4}</td>
                            
                            </tr>
                            <tr>
                                <c:out value="${ques.quesno}"></c:out>
                                <td><input type="hidden" name="page_number" value="${page_number+1}" />
                                    
                                </td>
                                <td><input type="hidden" name="quesno" value="${ques.quesno}" /></td>
                            </tr>
                            </c:forEach>
                            <tr>
                                <td> <a href="#" onclick="JAVASCRIPT:ques.submit()"  class="sbtnSubmit">Submit</a></td>
                            </tr>
                        </table>
                            </form>
                                    
                            </c:when>
                                </c:choose>
                                
                        

                    </section>
                </div>
</div>

        </div>
    </body>
</html>
