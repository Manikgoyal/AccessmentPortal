/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.logindatalayer;

import com.arcadian.loginbeans.ClassesBean;
import com.arcadian.loginbeans.StudentClassesBean;
import com.arcadian.loginbeans.UserGroupsBeans;
import com.sun.org.apache.bcel.internal.generic.AALOAD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author manik
 */
public class AssignStudentService {
     Connection con;
    ResultSet rs;
    Statement smt;

    public AssignStudentService() {
    
        try {
            con=ConnectDBService.connect();
            smt=con.createStatement();
        } catch (SQLException e) {
            System.out.println("Exception in Course Content="+e);
        }
    }
    
    public ArrayList getStudentList( String username){
       ArrayList alststudents=new ArrayList();
        
       try{
           String query="select ug.userid as userid from usergroups ug,userbranch ub where ug.groupid='1004' and ub.userid=ug.userid and branchid=(select branchid from userbranch where userid='"+username+"')";
           rs=smt.executeQuery(query);
           while(rs.next()){
               
               alststudents.add(rs.getString("userid"));
           }
       }
       catch(SQLException e){
           System.out.println("Exception in getStudentList="+e);
       }
    return alststudents;
    }
        
        
   public ArrayList getClassList( String username){
       ArrayList alstClassList=new ArrayList();
        ClassesBean classesBean;
       try{
           String query="select classid from classes where branchid=(select branchid from userbranch where userid='"+username+"')";
           rs=smt.executeQuery(query);
           while(rs.next()){
               classesBean=new ClassesBean();
               classesBean.setClassid(rs.getString("classid"));
               alstClassList.add(classesBean);
               
           }
       }
       catch(SQLException e){
           System.out.println("Exception in getClassList="+e);
       }
    return alstClassList;
    }   
    
   public ArrayList getAssignedStudentList(){
       ArrayList alstAssignedStudentList=new ArrayList();
       try {
           String query="select userid from studentclasses where status=true";
           rs=smt.executeQuery(query);
           while(rs.next()){
               alstAssignedStudentList.add(rs.getString("userid"));
           }
           
       } catch (SQLException e) {
           System.out.println("Exception in getAssignedStudentList="+e);
       }
       
       return alstAssignedStudentList;
   }

   public int assignStudentList(String studentid,String classid){
       int i=0;
       try {
           String query="insert into studentclasses(userid,classid,status) values(?,?,?)";
           PreparedStatement statement=con.prepareStatement(query);
           statement.setString(1, studentid);
           statement.setString(2,classid);
           statement.setBoolean(3, true);
           i=statement.executeUpdate();
       } catch (SQLException e) {
           System.out.println("Exception in assignStudentList"+e);
       }
       
       return i;
   }
   
   public ArrayList getAssignedStudent(){
       ArrayList alstAssignedStudentList=new ArrayList();
       StudentClassesBean studentClassesBean;
       try {
           String query="select * from studentclasses where status=true";
           rs=smt.executeQuery(query);
           while(rs.next()){
               studentClassesBean=new StudentClassesBean();
               studentClassesBean.setClassid(rs.getString("classid"));
               studentClassesBean.setUserid(rs.getString("userid"));
               alstAssignedStudentList.add(studentClassesBean);
               
           }
           
       } catch (SQLException e) {
           System.out.println("Exception in getAssignedStudentList="+e);
       }
       
       return alstAssignedStudentList;
   }
   
   
    
}
