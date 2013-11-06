/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.logindatalayer;

import com.arcadian.loginbeans.AssignmentNoticeBean;
import com.arcadian.loginbeans.UserClassesBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author komal
 */
public class AssignmentService {
 
    Connection con;
    ResultSet rs;
    Statement smt;

    public AssignmentService() {

        try {
            con = ConnectDBService.connect();
            smt = con.createStatement();
        } catch (SQLException e) {
            System.out.println("Exception in Course Content=" + e);
        }
    }

    public ArrayList getUserClass(String username) {

        ArrayList alstSubject = new ArrayList();
        UserClassesBean classesBean = null;

        try {
            String query = "select u.classname as  classname,u.classid as classid from classes u,userclasses uc where uc.userid='" + username + "' and uc.classid=u.classid";
            rs = smt.executeQuery(query);
            while (rs.next()) {
                classesBean = new UserClassesBean();
                classesBean.setClassname(rs.getString("classname"));
                classesBean.setClassid(rs.getString("classid"));
                alstSubject.add(classesBean);

            }

        } catch (SQLException e) {
            System.out.println("Exception in getSubject=" + e);
        }

        return alstSubject;
    }


    public int updateAssignmentNotice(String assignmentid,
            String assignmentname, String subjectid, String classid, String username, String file) {
        int i = 0;
        Date date = new Date();
        try {
            System.out.println(subjectid);
            System.out.println(classid);
            String query = "insert into assignmentnotice (assignmentid,assignmentname,subjectid,classid,userid,dateofallotment,file) "
                    + "values (?,?,?,?,?,?,?)";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, assignmentid);
            statement.setString(2, assignmentname);
            statement.setString(3, subjectid);
            statement.setString(4, classid);
            statement.setString(5, username);
            statement.setString(6, date.toString());
            statement.setString(7, file);

            i = statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println("could not update the course material" + e);
        }
        return i;
    }

    public ArrayList<AssignmentNoticeBean> fetchAssignmentNotice(String username) {

        ArrayList<AssignmentNoticeBean> alstAssignmentNotice = new ArrayList<AssignmentNoticeBean>();
        AssignmentNoticeBean noticeBean;
        String query = "select assignmentid,assignmentname,subjectid,classid,file from assignmentnotice where userid=?";
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
    
    
}
