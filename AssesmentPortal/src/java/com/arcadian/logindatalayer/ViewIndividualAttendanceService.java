/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.logindatalayer;

import com.arcadian.loginbeans.UserattendBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author android
 */
public class ViewIndividualAttendanceService {
      Connection con;
    ResultSet rs;
    Statement smt;
 public ViewIndividualAttendanceService() {
    
        try {
            con=ConnectDBService.connect();
            smt=con.createStatement();
        } catch (SQLException e) {
            System.out.println("Exception in individual attendance"+e);
        }
    }
 public ArrayList fetchusersubjects(String username){
     ArrayList subjects=new ArrayList();
     UserattendBean bean;
     try {
         String query="select subjectid,attendance from studentattendance  where userid='"+username+"'";
   rs=smt.executeQuery(query);
   while(rs.next()){
      bean=new UserattendBean();
       bean.setSubjectid(rs.getString("subjectid"));
       bean.setAttendance(rs.getString("attendance"));
        subjects.add(bean);
   }
     } catch (Exception e) {
         System.out.println("error in getting subjects for a student"+e);
     }return subjects;
     
 }
    
}
