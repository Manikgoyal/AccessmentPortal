/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.logindatalayer;

import com.arcadian.loginbeans.LecturesBean;
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
public class LecturesService {

    Connection con;
    ResultSet rs;
    Statement smt;

    public LecturesService() {

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


    public int updateLectures(String lectureid,
            String lecturename, String classid, String subjectid, String username, String file) {
        int i = 0;
        Date date = new Date();
        try {
            String query = "insert into lectures (lectureid,lecturename,classid,subjectid,userid,file) "
                    + "values (?,?,?,?,?,?)";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, lectureid);
            statement.setString(2, lecturename);
            statement.setString(3, classid);
            statement.setString(4, subjectid);
            statement.setString(5, username);
            statement.setString(6, file);

            i = statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println("could not update the course material" + e);
        }
        return i;
    }

    public ArrayList<LecturesBean> fetchlectures(String username) {

        ArrayList<LecturesBean> alstLectures = new ArrayList<LecturesBean>();
        LecturesBean lecturesBean;
        String query = "select lectureid,lecturename,subjectid,classid,file from lectures where userid=?";
        try {
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, username);
            rs = statement.executeQuery();

            while (rs.next()) {
                lecturesBean = new LecturesBean();

                lecturesBean.setLectureid(rs.getString("lectureid"));
                lecturesBean.setLecturename(rs.getString("lecturename"));
                lecturesBean.setSubjectid(rs.getString("subjectid"));
                lecturesBean.setClassid(rs.getString("classid"));
                lecturesBean.setFilename(rs.getString("file"));
                alstLectures.add(lecturesBean);
            }



        } catch (SQLException e) {
            System.out.println("Exception in fetchCourseMaterial" + e);
        }


        return alstLectures;
    }
}
