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

                        <form action="AddUserServlet" method="get" name="adduser">
                            <table class="box-table-a">
                                <caption>New User</caption>
                                <thead>
                                    <tr>
                                        <th>Username</th>
                                        <th>Password</th>
                                        <th>Department</th>
                                        <th>User Group</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <input type="text" name="username" required/></td>
                                        <td><input type="text" name="password" required/></td>
                                        <td><select name="department">
                                                <option>Select Branch</option>
                                                <c:forEach items="${alstbranchName}" var="branches">
                                                    <option value="${branches.branchid}">${branches.branchname}</option>
                                                </c:forEach>
                                                </select></td>
                                        <td><select name="groupname">
                                                <option>Select Group</option>
                                                <c:forEach items="${alstgroupName}" var="grpname">
                                                    <option value="${grpname.groupid}">${grpname.groupname}</option>
                                                </c:forEach>


                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="#" onclick="JAVASCRIPT:adduser.submit()"  class="sbtnSubmit">Add</a>
                                        </td>
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
                                    <th scope="col">Id</th>
                                    <th scope="col">UserName</th>
                                    <th scope="col">Password</th>
                                    <th scope="col">User group</th>
                                    <th scope="col">Department</th>
                                    <th scope="col">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                ArrayList<UserDetailBean> alst=(ArrayList<UserDetailBean>)request.getAttribute("alstuser");
                                    for(int i=0;i<alst.size();i++)
                                    {
                                        UserDetailBean bean=(UserDetailBean)alst.get(i);
                                %>
                                
                                <tr>
                                    <td>1</td>
                                    <td><%=bean.getUserid() %></td>
                                    <td><%=bean.getPassword()%></td>
                                    <td><%= bean.getGroupname() %></td>
                                    <td><%= bean.getBranchname() %></td>
                                    <td><a href="#">del</a> | <a href="#">edit</a></td>
                                </tr>
                                  <%
                                    }
                                  %>  
                            
                            </tbody>
                        </table>


                    </section>
                </div>


            </div>

        </div>
    </body>
</html>
