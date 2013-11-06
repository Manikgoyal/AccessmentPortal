/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.logindatalayer;

import com.arcadian.loginbeans.AssignmentNoticeBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author android
 */
public class AssignmentFolderService {

    Connection con;
    ResultSet rs;
    Statement smt;

    public AssignmentFolderService() {

        try {
            con = ConnectDBService.connect();
            smt = con.createStatement();
        } catch (SQLException e) {
            System.out.println("Exception in Course Content=" + e);
        }
    }

    public ArrayList<AssignmentNoticeBean> fetchAssignmentNotice(String username) {

        ArrayList<AssignmentNoticeBean> alstAssignmentNotice = new ArrayList<AssignmentNoticeBean>();
        AssignmentNoticeBean noticeBean;
        String query = "select assignmentid,assignmentname,subjectid,classid,file from assignmentnotice where classid=(select classid from studentclasses where userid=?)";
        try {
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, username);
            rs = statement.executeQuery();

            while (rs.next()) {
                noticeBean = new AssignmentNoticeBean();

                noticeBean.setAssignmentid(rs.getString("assignmentid"));
                noticeBean.setAssignmentname(rs.getString("assignmentname"));
                noticeBean.setSubjectid(rs.getString("subjectid"));
                noticeBean.setClassid(rs.getString("classid"));
                noticeBean.setFile(rs.getString("file"));
                alstAssignmentNotice.add(noticeBean);
            }
        } catch (SQLException e) {
            System.out.println("Exception in fetchCourseMaterial" + e);
        }


        return alstAssignmentNotice;
    }
    
        public int updateAssignmentFolder(String username, String assignmentid,
            String file) {
        int i = 0;
        Date date = new Date();
        try {
            System.out.println(username);
            System.out.println("Assignmentid="+assignmentid);
            System.out.println(file);
            
            String query = "insert into assignmentfolder (userid,assignmentid,file) values('"+username+"','"+assignmentid+"','"+file+"');";
           i=smt.executeUpdate(query);

        } catch (SQLException e) {
            System.out.println("could not update the assignment folder" + e);
        }
        return i;
    }
}
