<%-- 
    Document   : getsubid
    Created on : 28 Oct, 2013, 4:05:40 PM
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
        <select name="subjectid" id="subjectid">
            <option>Select Subject</option>
            <c:forEach items="${alstSubject}" var="subject">
                <option value="${subject.subjectid}">${subject.subjectname}</option>
            </c:forEach>
        </select>
    </body>
</html>
