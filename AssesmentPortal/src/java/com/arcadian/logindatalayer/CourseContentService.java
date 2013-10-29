/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.logindatalayer;

import com.arcadian.loginbeans.CourseMaterialBean;
import com.arcadian.loginbeans.UserClassesBean;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author manik
 */
public class CourseContentService {
     Connection con;
    ResultSet rs;
    Statement smt;

    public CourseContentService() {
    
        try {
            con=ConnectDBService.connect();
            smt=con.createStatement();
        } catch (SQLException e) {
            System.out.println("Exception in Course Content="+e);
        }
    }
    
    
    public ArrayList getUserClass(String username){
    
        ArrayList alstSubject=new ArrayList();
        UserClassesBean classesBean=null;
        
        try {
            String query="select u.classname as  classname,u.classid as classid from classes u,userclasses uc where uc.userid='"+username+"' and uc.classid=u.classid";
            rs=smt.executeQuery(query);
            while(rs.next()){
                classesBean=new UserClassesBean();
                classesBean.setClassname(rs.getString("classname"));
                classesBean.setClassid(rs.getString("classid"));
                alstSubject.add(classesBean);
                
            }
            
        } catch (SQLException e) {
            System.out.println("Exception in getSubject="+e);
        }
    
    return alstSubject;
    } 
    
    public ArrayList getSubject(String username,String classid){
    
        ArrayList alstSubject=new ArrayList();
        ArrayList alsttemp=new ArrayList();
        UserClassesBean classesBean=null;
        
        try {
            String query="select subjectid from userclasses where userid='"+username+"' and classid='"+classid+"' ";
            rs=smt.executeQuery(query);
            while(rs.next()){
                classesBean=new UserClassesBean();
                classesBean.setSubjectid(rs.getString("subjectid"));
                alsttemp.add(rs.getString("subjectid"));
                for(int i=0;i<alsttemp.size();i++){
                    String str=(String) alsttemp.get(i);
                    rs=smt.executeQuery("select subjectname from subjects where subjectid='"+str+"'");
                    while(rs.next()){
                        classesBean.setSubjectname(rs.getString("subjectname"));
                        alstSubject.add(classesBean);
                    }
                    
                }
                
            }
            
            
        } catch (SQLException e) {
            System.out.println("Exception in getSubject="+e);
        }
    
    return alstSubject;
    } 
    public int updatecoursematerial(String materialid,
            String materialname,String classid,String subjectid,String username,String file){
        int i=0; 
        Date date=new Date();
        try {
            String query="insert into coursematerial (materialid,materialname,classid,subjectid,userid,dateupload,file) "
                    + "values (?,?,?,?,?,?,?)";
            PreparedStatement statement=con.prepareStatement(query);
            statement.setString(1, materialid);
            statement.setString(2, materialname);
            statement.setString(3, classid);
            statement.setString(4, subjectid);
            statement.setString(5, username);
            statement.setString(6, date.toString());
            statement.setString(7, file);
            
            i=statement.executeUpdate();
            
            }
          catch( SQLException e){
              System.out.println("could not update the course material"+e);
          }
          return i;
    }
    
    public ArrayList<CourseMaterialBean> fetchCourseMaterial(String username){
    
    ArrayList<CourseMaterialBean> alstCourseMaterial=new ArrayList<CourseMaterialBean>();
        CourseMaterialBean courseMaterialBean;
    String query="select materialid,materialname,subjectid,classid,file from coursematerial where userid=?";
        try {
         PreparedStatement statement=   con.prepareStatement(query);
            statement.setString(1,username);
            rs=statement.executeQuery();
            
            while(rs.next()){
                courseMaterialBean=new CourseMaterialBean();
                
                courseMaterialBean.setMaterialid(rs.getString("materialid"));
                courseMaterialBean.setMaterialname(rs.getString("materialname"));
                courseMaterialBean.setSubjectid(rs.getString("subjectid"));
                courseMaterialBean.setClassid(rs.getString("classid"));
                courseMaterialBean.setFilename(rs.getString("file"));
                alstCourseMaterial.add(courseMaterialBean);
            }
            
            
            
        } catch (SQLException e) {
            System.out.println("Exception in fetchCourseMaterial"+e);
        }
    
    
    return alstCourseMaterial;
    }
}