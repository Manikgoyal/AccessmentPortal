<%-- 
    Document   : getlecturersubjectid
    Created on : 31 Oct, 2013, 11:17:25 AM
    Author     : manik
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
    </head>
    <body>
        <select name="subjectid" onchange="showUser5(this.value,'${classid}')">
        <option>All</option>
        <c:forEach items="${alstAssignLecture}" var="subject">
            <option ${subject}>${subject}</option>
        </c:forEach>
                          


        </select>
    </body>
</html>
