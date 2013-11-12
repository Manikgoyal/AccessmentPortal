<%-- 
    Document   : studentsattendancetabbled
    Created on : 2 Nov, 2013, 9:00:46 PM
    Author     : manik
--%>

<%@page import="com.arcadian.loginbeans.SubjectsBean"%>
<%@page import="com.arcadian.logindatalayer.ViewClassAttendanceService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.arcadian.loginbeans.AttendanceBean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        	
    
    <style type="text/css">
	      body, html {
	          height: 100%;
	          margin: 0;
	          -webkit-font-smoothing: antialiased;
	          font-weight: 200;
	      }
	      
	      .tabs input[type=radio] {
	          position: absolute;
	          top: -9999px;
	          left: -9999px;
	      }
	      .tabs {
	        width: 1000px;
	        float: none;
	        list-style: none;
	        position: relative;
	        padding: 0;
	        margin: 0px;
	      }
	      .tabs li{
	        float: left;
	      }
	      .tabs label {
	          display: block;
	          padding: 12px 07px;
	          border-radius: 2px 2px 0 0;
	          color: #693B8D;
	          font-size: 15px;
	          font-weight: normal;
	          font-family: 'Roboto', helveti;
	          background: rgba(255,255,255,0.2);
	          cursor: pointer;
	          position: relative;
	          top: 3px;
	          -webkit-transition: all 0.2s ease-in-out;
	          -moz-transition: all 0.2s ease-in-out;
	          -o-transition: all 0.2s ease-in-out;
	          transition: all 0.2s ease-in-out;
	      }
	      .tabs label:hover {
                  background: #ccccff;
	        top: 0;
	      }
	      
	      [id^=tab]:checked + label {
	        background: #ccccff;
	        color: white;
	        top: 0;
	      }
	      
	      [id^=tab]:checked ~ [id^=tab-content], [id^=tab]:checked ~ [id^=tab-content] > div {
	          display: block;
	      }
	      .tab-content{
	        z-index: 2;
	        display: none;
	        text-align: left;
	        overflow: hidden;
	        width: 100%;
	        font-size: 10px;
	        line-height: 140%;
	        padding-top: 10px;
	        background: #EDE8F1;
	        padding: 0px;
	        color: white;
	        position: absolute;
	        top: 53px;
	        left: 0;
	        box-sizing: border-box;
	      }
	      .tab-content > div{
	        display: none;
	        -webkit-animation-duration: 0.5s;
	        -o-animation-duration: 0.5s;
	        -moz-animation-duration: 0.5s;
	        animation-duration: 0.5s;
	      }
	    </style>
    </head>
    
    <body>
      
                                                                                  <ul class="tabs">
                                                                                    
                                                                                      <%
            
            ViewClassAttendanceService obj=new ViewClassAttendanceService();
            String classid=request.getParameter("classid");
           
            ArrayList alstSubject=obj.getSubjectName(classid);
            request.setAttribute("alstSubject",alstSubject);
            
            
            
            for(int i=0;i<alstSubject.size();i++){
            
                SubjectsBean subjectsBean=(SubjectsBean)alstSubject.get(i);
              String subject=subjectsBean.getSubjectname();
            %>
			        <li>
                                    <input type="radio" checked name="tabs" id="tab<%=(i+1)%>">
                                    <label for="tab<%=(i+1)%>"><%=subject%></label>
			          <div id="tab-content<%=(i+1)%>" class="tab-content">
			            <div class="animated  bounceIn">
			               <table class="box-table-a" border="1">
                                           <caption style="font-size: 15px; padding: 5px;color: #000; ">Student Attendance</caption>
                            <thead>
                             <th>Users</th>
                             <%
                                ArrayList alstLectures=obj.fetchlectures(subjectsBean.getSubjectid(), classid);
                                ArrayList alstusers= obj.fetchusers(classid);
                                ArrayList alstuserattendance=null;
                                
                                   
                                    %>
                             
                             
                             <%
                                for(int j=0;j<alstLectures.size();j++){
                                   
                                    
                                    
                                    ArrayList alstect=(ArrayList)alstLectures.get(j);
                                    alstuserattendance=obj.userAttendance(alstect, alstusers);
                                    for(int k=0;k<alstect.size();k++){
                                        String str=(String)alstect.get(k);
                                        
                                        
                                   %>
                             
                                   
                                   
                             <th><%=k+1%></th>
                             <%
                                }
                                    
                                }
                                
                %>
                             
                             <th>Total</th>
                            </thead>
                            
                            <tbody>
                                
                              
                                <tr> 
                                    <%
                                    for(int z=0;z<alstuserattendance.size();z++){
                                        
                                        ArrayList alstFinal=(ArrayList)alstuserattendance.get(z);
                                    
                                        for(int l=0;l<alstFinal.size();l++){
                                            
                                        
                                        
                                    %>
                                     
                                    <td><%=alstFinal.get(l) %></td>
                                    
                                    <%
                                        }
                                        %>
                                        
                                          </tr>
                                        <%
                                    }
                                    %>
                                    
                             
                                
                            </tbody>
                        </table>
                        </div>
	</div>
                            </li>
                             <%
            }
                  %>   
</ul>


    </body>
</html>
