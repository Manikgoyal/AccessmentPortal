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

                        <form action="TestsServlet" method="post">
                        
                        <table class="box-table-a">
                            <tr>
                                <td colspan="2">BranchId</td>
                                <td colspan="2">Classid</td>
                                <td>SubjectId</td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="text" name="branchid" value="${branchid}"></td>
                                
                                <td colspan="2"><select name="classid" onchange="showUser2(this.value)">
                                        <option>Select Class</option>
                                        <c:forEach items="${classid}" var="class"><option>${class}</option></c:forEach>
                                    </select></td>
                                
                                
                                <td><div id="txtSubject">
                                                        <select name="subjectname" id="subjectname">
                                                <option class="text1">Select Group</option>
                                            </select></div></td>
                                
                            </tr>
                            <tr><td colspan="5">Question</td></tr>
                            <tr><td colspan="5"><textarea name="question" placeholder="Remember, be nice!" cols="100" rows="1" style="width: 900px;height: 60px;"></textarea></td></tr>
                        
                            <tr>
                                <td>Opt 1</td>
                                <td>Opt 2</td>
                                <td>Opt 3</td>
                                <td>Opt 4</td>
                                <td>Ans</td>
                            </tr>
                            <tr>
                                <td><input type="text" name="opt1" style="width: 120px;"></td>
                                <td><input type="text" name="opt2" style="width: 120px;"></td>
                                <td><input type="text" name="opt3" style="width: 120px;"></td>
                                <td><input type="text" name="opt4" style="width: 120px;"></td>
                                <td><input type="text" name="ans" style="width: 120px;"></td>
                               
                            </tr>
                            
                            <tr>
                                <td colspan="5"><button type="submit" style="float: right">Add Question</button></td>
                            </tr>
                        
                        </table>

                                    </form>

                    </section>
                </div>
</div>

        </div>
    </body>
</html>
