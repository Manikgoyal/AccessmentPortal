/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.logindatalayer;

import com.arcadian.loginbeans.BranchesBean;
import com.arcadian.loginbeans.GroupBean;
import com.arcadian.loginbeans.UserDetailBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author manik
 */
public class AddUserService {

    Connection con;
    ResultSet rs;
    Statement smt;
    
    public AddUserService() {
    
        try {
            con=ConnectDBService.connect();
            smt=con.createStatement();
        } catch (Exception e) {
        }
        
    }
    
    public  ArrayList getGroupName(){
        ArrayList  alstGroupName=new ArrayList();
        GroupBean bean;
        
        try {
            String query="select groupname,groupid from groups where status=true";
            rs=smt.executeQuery(query);
            
            while(rs.next()){
                bean=new GroupBean();
                bean.setGroupname(rs.getString("groupname"));
                bean.setGroupid(rs.getString("groupid"));
                alstGroupName.add(bean);
            }
            
        } catch (SQLException e) {
            System.out.println("Exception in getGroupName="+e);
        }
        
        return alstGroupName;
    }
    
    public  ArrayList getBranchName(){
        ArrayList  alstBranchName=new ArrayList();
        BranchesBean bean;
        
        try {
            String query="select * from branches";
            rs=smt.executeQuery(query);
            
            while(rs.next()){
                bean=new BranchesBean();
                bean.setBranchname(rs.getString("branchname"));
                bean.setBranchid(rs.getString("branchid"));
                
                alstBranchName.add(bean);
            }
            
        } catch (SQLException e) {
            System.out.println("Exception in getGroupName="+e);
        }
        
        return alstBranchName;
    }
    
    public int addUserDetail(String username,String  password){
        int i=0;
        try {
            String query="insert into users (userid,password) values('"+username+"','"+password+"')";
            i=smt.executeUpdate(query);
            
        } catch (SQLException e) {
            System.out.println("Exception in addUserDetail"+e);
        }
        
        return i;
    }
    
    public int addUserBranches(String username,String  branchid){
        int i=0;
        try {
            String query="insert into userbranch (userid,branchid) values('"+username+"','"+branchid+"')";
            i=smt.executeUpdate(query);
            
        } catch (SQLException e) {
            System.out.println("Exception in addUserDetail"+e);
        }
        
        return i;
    }
    
    public int addUserGroup(String username,String  groupname){
        int i=0;
        try {
            String query="insert into usergroups (userid,groupid) values('"+username+"','"+groupname+"')";
            i=smt.executeUpdate(query);
            
        } catch (SQLException e) {
            System.out.println("Exception in addUserDetail"+e);
        }
        
        return i;
    }
    
    public ArrayList fetchUserDetail(){
     
        UserDetailBean detailBean;
        
        ArrayList<UserDetailBean> alst=new ArrayList<UserDetailBean>();
        
        try {
            String query="select u.userid,u.password,g.groupname,b.branchname "
                    + "from users u,usergroups ug,groups g,\n" +
                    "userbranch ub,branches b where "
                    + "(u.userid=ug.userid and ug.groupid=g.groupid)"
                    + " and (u.userid=ub.userid and ub.branchid=b.branchid);";
            rs=smt.executeQuery(query);
            
            while(rs.next()){
                detailBean=new UserDetailBean();
                detailBean.setUserid(rs.getString("userid"));
                detailBean.setPassword(rs.getString("password"));
                detailBean.setBranchname(rs.getString("branchname"));
                detailBean.setGroupname(rs.getString("groupname"));
                
                alst.add(detailBean);
            }
            
        } catch (SQLException e) {
            System.out.println("Exception in fetchUserDetail="+e);
        }
        
        return alst;
        
    }
    
    
}
