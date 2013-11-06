/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.logindatalayer;

import com.arcadian.loginbeans.AttendanceBean;
import com.arcadian.loginbeans.SubjectsBean;
import com.arcadian.loginbeans.UsersBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author HP
 */
public class ViewClassAttendanceService {

    Connection con;
    ResultSet rs;
    Statement smt;

    public ViewClassAttendanceService() {

        try {
            con = ConnectDBService.connect();
            smt = con.createStatement();
        } catch (SQLException e) {
            System.out.println("Exception in Course Content=" + e);
        }
    }

    public ArrayList fetchlectures(String subjectid, String classid) {
        ArrayList alstlectures;
        ArrayList alstmaster = new ArrayList();
        
        try {
            String query = "select lectid from attendance where subjectid ='" + subjectid + "' and classid ='" + classid + "' ";
                rs = smt.executeQuery(query);
alstlectures=new ArrayList();
                while (rs.next()) {
                    
                    String str = rs.getString("lectid");
                    alstlectures.add(str);
                }
                alstmaster.add(alstlectures);
            
        } catch (SQLException e) {
            System.out.println("error in fetching lecture list" + e);
        }
        return alstmaster;
    }

    public ArrayList fetchusers(String classid) {
        ArrayList alststudentattendance = new ArrayList();
        UsersBean bean;
        try {
            String query = "select userid from studentclasses where classid ='" + classid + "' ";
            rs = smt.executeQuery(query);
            while (rs.next()) {
                bean = new UsersBean();
                bean.setUserid(rs.getString("userid"));
                alststudentattendance.add(bean);
            }
        } catch (SQLException e) {
            System.out.println("error in fetching student list" + e);
        }
        return alststudentattendance;
    }

    public ArrayList getClassid(String username) {
        ArrayList alstClassid = new ArrayList();

        try {
            String query = "select classid from userclasses where userid='" + username + "'";
            rs = smt.executeQuery(query);
            while (rs.next()) {
                alstClassid.add(rs.getString("classid"));
            }
        } catch (SQLException e) {
            System.out.println("Exception in getClassid=" + e);
        }

        return alstClassid;
    }

    public ArrayList getSubjectName(String classid) {

        ArrayList alstSubject = new ArrayList();
        String query = "select sc.subjectid,s.subjectname from subjectclasses sc,subjects s where classid='" + classid + "' and sc.subjectid=s.subjectid";
        SubjectsBean subjectsBean;

        try {
            rs = smt.executeQuery(query);
            while (rs.next()) {
                subjectsBean = new SubjectsBean();

                subjectsBean.setSubjectid(rs.getString("subjectid"));
                subjectsBean.setSubjectname(rs.getString("subjectname"));
                alstSubject.add(subjectsBean);
            }

        } catch (SQLException e) {
            System.out.println("Exception in getSubjectName" + e);
        }
        return alstSubject;
    }

    public ArrayList userAttendance(ArrayList lectures, ArrayList users) {

        ArrayList alstuserAttandance = new ArrayList();
        ArrayList alstLectures = null;
        
        try {
            for(int i=0;i<users.size();i++){
                ArrayList alstTemp = new ArrayList();
                 UsersBean bean = (UsersBean) users.get(i);
                String userid = bean.getUserid();
                alstTemp.add(userid);
                
                for(int j=0;j<lectures.size();j++){
                    String lectid=(String)lectures.get(j);
                    String query = "select attended from classattendance where lectid='" + lectid + "' and userid='" + userid + "'";
                    rs = smt.executeQuery(query);
                     if (rs.next()) {
                    do {
                        alstTemp.add(rs.getString("attended"));
                        
                    } while (rs.next());
                } else {
                    alstTemp.add("na");
                }
                    
                    
                }
                alstTemp.add(lectures.size());
                alstuserAttandance.add(alstTemp);
            }
            
        } catch (SQLException e) {
            System.out.println("Exception "+e);
        }

        
        return alstuserAttandance;
    }

   
}
