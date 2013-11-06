<%-- 
    Document   : queslist
    Created on : 4 Nov, 2013, 10:26:41 PM
    Author     : manik
--%>
<%@page import="com.arcadian.loginbeans.TestDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table class="box-table-a">
            
            <thead>
            <th>classid</th>
            <th>Subjectid</th>
            <th>question</th>
            <th>opt1</th>
            <th>opt2</th>
            <th>opt3</th>
            <th>opt4</th>
            <th>ans</th>
            </thead>
            <tbody>
                <%
                    
                    ArrayList alstQuestionList=(ArrayList)request.getAttribute("alstQuestionList");
                for(int i=0;i<alstQuestionList.size();i++){
                    
                 TestDataBean testDataBean=(TestDataBean)alstQuestionList.get(i);
                    
                    %>
                <tr>
                    <td><%=testDataBean.getClassid() %></td>
                    <td><%=testDataBean.getSubjectid() %></td>
                    <td><%=testDataBean.getQuestion() %></td>
                    <td><%=testDataBean.getOpt1() %></td>
                    <td><%=testDataBean.getOpt2() %></td>
                    <td><%=testDataBean.getOpt3() %></td>
                    <td><%=testDataBean.getOpt4() %></td>
                    <td><%=testDataBean.getAns()%></td>
                 
                </tr>
                <%
                }
                %>    
            </tbody>
        </table>
    </body>
</html>
