/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.logindatalayer;

import com.arcadian.loginbeans.UserClassesBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author manik
 */
public class AssignLecturerService {

    Statement smt;
    ResultSet rs;
    Connection con;
    
    
    public AssignLecturerService() {
        try {
    con=ConnectDBService.connect();
            smt=con.createStatement();
        } catch (SQLException e) {
            System.out.println("Exception in AssignLecturer Service"+e);
        }
    
    }
    
    
    public ArrayList getLecturerId(String username){
        
        ArrayList alstAssignedLecturer=new ArrayList();
        
        
        try {
            String query="select ug.userid as userid from usergroups ug,"
                    + "userbranch ub where ug.groupid='1003' and ub.userid=ug.userid and "
                    + "branchid=(select branchid from userbranch where userid='"+username+"');";
        rs=smt.executeQuery(query);
        while(rs.next()){
        alstAssignedLecturer.add(rs.getString("userid"));
            
        }
        
        } catch (SQLException e) {
            System.out.println("Exception in getLecturerId"+e);
        }
        
        return alstAssignedLecturer;
        
    }
    
    public ArrayList getLecturerClassID(String username){
        ArrayList alstClassId=new ArrayList();
        
        try {
            String query="select classid from classes where branchid=(select branchid from userbranch where userid='"+username+"')";
            rs=smt.executeQuery(query);
            while(rs.next()){
                alstClassId.add(rs.getString("classid"));
            }
        } catch (SQLException e) {
            System.out.println("Exception in getLecturerClassId"+e);
        }
        return alstClassId;
    }
    
    public ArrayList getSubjectId(String classid){
        
        ArrayList alstSubjectId=new ArrayList();
        
        try {
            String query="select subjectid from subjectclasses where classid='"+classid+"'";
            rs=smt.executeQuery(query);
            while(rs.next()){
                alstSubjectId.add(rs.getString("subjectid"));
            }
        } catch (SQLException e) {
            System.out.println("Exception in getSubjectId"+e);
        }
        
        return alstSubjectId;
    }
    
    public int assignLecturer(String classid,String lectid,String subjectid,String userid){
        int i=0;
        
        try {
            
            String query="insert into userclasses (userid,classid,subjectid,branchid) values('"+lectid+"','"+classid+"','"+subjectid+"',(select branchid from userbranch where userid='"+userid+"'))";
           
            i=smt.executeUpdate(query);
            
            
        } catch (SQLException e) {
            System.out.println("Exception in assignLecturer ="+e);
        }
        return i;
    }
    
    public ArrayList fetchAssignLecturer(String username){
        ArrayList<UserClassesBean> alstAssignLecturer=new ArrayList<UserClassesBean>();
        UserClassesBean userClassesBean;
        try {
            String query="select userid,classid,subjectid,branchid from userclasses where branchid=(select branchid from userbranch where userid='"+username+"')and status=true";
            rs=smt.executeQuery(query);
            while(rs.next()){
                userClassesBean=new UserClassesBean();
                userClassesBean.setUserid(rs.getString("userid"));
                userClassesBean.setClassid(rs.getString("classid"));
                userClassesBean.setSubjectid(rs.getString("subjectid"));
                userClassesBean.setBranchid(rs.getString("branchid"));
                alstAssignLecturer.add(userClassesBean);
            }
        } catch (Exception e) {
        }
        return alstAssignLecturer;
    }
    
    
}
