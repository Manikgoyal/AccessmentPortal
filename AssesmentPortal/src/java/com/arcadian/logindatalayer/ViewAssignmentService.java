/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.logindatalayer;

import com.arcadian.loginbeans.AssignmentFolderBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author manik
 */
public class ViewAssignmentService {
    
    Connection con;
    ResultSet rs;
    Statement smt;

    public ViewAssignmentService() {

        try {
            con = ConnectDBService.connect();
            smt = con.createStatement();
        } catch (SQLException e) {
            System.out.println("Exception in Course Content=" + e);
        }
    }
    
    public ArrayList getAssignments(String username){
        
        ArrayList alstassignments=new ArrayList();
        ArrayList alsttemp=new ArrayList();
        AssignmentFolderBean folderBean;
        
        String query="select assignmentid from assignmentnotice where userid='"+username+"'";
       try {
             rs=smt.executeQuery(query);
        while(rs.next()){
          alsttemp.add(rs.getString("assignmentid"));
        }
        
        for(int i=0;i<alsttemp.size();i++){
            String str=(String)alsttemp.get(i);
            
            String query1="select userid,assignmentid,file from assignmentfolder where assignmentid='"+str+"'";
            rs=smt.executeQuery(query1);
            while(rs.next()){
                folderBean=new AssignmentFolderBean();
                folderBean.setUserid(rs.getString("userid"));
                folderBean.setAssignmentid(rs.getString("assignmentid"));
                folderBean.setFile(rs.getString("file"));
                alstassignments.add(folderBean);
            }
            
        }
           System.out.println("folder bean opdb"+alstassignments);
            
        } catch (SQLException e) {
            System.out.println("Exception in getAssignments="+e);
        }
        
        return alstassignments;
    }
    
    
            public int updateAssignmentFolder(String username,String assignmentid,String marks) {
        int i = 0;
        try {
            
            String query = "update assignmentfolder set marks='"+marks+"' where (userid,assignmentid)=('"+username+"','"+assignmentid+"')";
           i=smt.executeUpdate(query);

        } catch (SQLException e) {
            System.out.println("could not update the assignment folder" + e);
        }
        return i;
    }
    
}
