<%-- 
    Document   : header
    Created on : 6 Nov, 2013, 1:39:06 PM
    Author     : manik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="cachecontrol.jsp" %>
        <header class="row-fluid">
                    <article id="innlogo" class="span3"><a href="#"><img src="<%=request.getContextPath()%>/dashboard/img/logo.png" alt="" title="logo"></a></article>
                    <article id="inptxt" class="span4"><input type="text" placeholder="Search" class="input-block-level" id="inputNew"></article>
                    <article id="transforming" class="span5">
                        <ul>
                            <li><img src="<%=request.getContextPath()%>/dashboard/img/home_img.jpg" alt="" title=""></li>   
                            <li><img src="<%=request.getContextPath()%>/dashboard/img/chat_img.jpg" alt="" title=""></li>
                            <li><img src="<%=request.getContextPath()%>/dashboard/img/percent.jpg" alt="" title=""></li>
                            <li><a href="<%=request.getContextPath()%>/LogoutServlet"><img src="<%=request.getContextPath()%>/dashboard/img/logout.jpg" alt="" title="" style="height: 30px; margin:-4px 0px 0px 10px;" ></a></li>
                        </ul>

                    </article>
                </header>
    </body>
</html>
