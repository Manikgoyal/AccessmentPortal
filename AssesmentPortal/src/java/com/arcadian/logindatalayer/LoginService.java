/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.logindatalayer;

import com.arcadian.loginbeans.PermissionsBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;

/**
 *
 * @author manik
 */
public class LoginService {

    Connection con;
    Statement smt;
    ResultSet rs;
    
    public LoginService() {
        try {
            con=ConnectDBService.connect();
            smt=con.createStatement();
            
        } catch (SQLException e) {
            System.out.println("Exception in LoginService Constructor="+e);
        }
        
    }
    
    public Boolean authenticateUser(String username,String password){
        
        Boolean status=false;
        
        try {
            String query="select status from users where userid='"+username+"' and password='"+password+"'";
            
            rs=smt.executeQuery(query);
            
            while(rs.next()){
                status=rs.getBoolean("status");
            }
            
        } catch (SQLException e) {
        }
    
            return status;
        }
    
    public ArrayList getGroupPermissions(String username){
        
        ArrayList alstgrouppermissions=new ArrayList();
        ArrayList alsttemp=new ArrayList();
        
        String query="select groupid from usergroups where userid='"+username+"' and status=true";
       try {
             rs=smt.executeQuery(query);
        while(rs.next()){
          alsttemp.add(rs.getString("groupid"));
        }
        
        for(int i=0;i<alsttemp.size();i++){
            String str=(String)alsttemp.get(i);
            
            String query1="select permissionid from grouppermissions where groupid='"+str+"' and status=true";
            rs=smt.executeQuery(query1);
            while(rs.next()){
                alstgrouppermissions.add(rs.getString("permissionid"));
            }
            
        }
            
        } catch (SQLException e) {
            System.out.println("Exception in getGroupPermissions="+e);
        }
       
        
        
        return alstgrouppermissions;
    }
    
    
    public ArrayList getIndividualAllowedPermissions(String username){
        ArrayList allowedIndividualPermission=new ArrayList();
        try {
            String query="select permissionid from specialpermissions where userid='"+username+"' and status=true";
            rs=smt.executeQuery(query);
            while(rs.next()){
                allowedIndividualPermission.add(rs.getString("permissionid") );
            }
            
        } catch (SQLException e) {
            System.out.println("Exception in getIndividualPermisions ="+e);
        }
        
        return allowedIndividualPermission;
    }
    
    public ArrayList getIndividualDeniedPermissions(String username){
        ArrayList deniedIndividualPermission=new ArrayList();
        try {
            String query="select permissionid from specialpermissions where userid='"+username+"' and status=false";
            rs=smt.executeQuery(query);
            while(rs.next()){
                deniedIndividualPermission.add(rs.getString("permissionid") );
            }
            
        } catch (SQLException e) {
            System.out.println("Exception in getIndividualPermisions ="+e);
        }
        
        return deniedIndividualPermission;
    }
    
    public ArrayList  getPermissionName(Set alstPermission){
        ArrayList  alstpermissionname=new ArrayList<String>();
        PermissionsBean permissionsBean;
        try {
            
            Iterator itr=alstPermission.iterator();
            while(itr.hasNext()){
                String query="select permissionname,servletname from permissions where permissionid='"+itr.next()+"'";
                rs=smt.executeQuery(query);
                while(rs.next()){
                    permissionsBean=new PermissionsBean();
                    permissionsBean.setPermissionname(rs.getString("permissionname"));
                    permissionsBean.setServletname(rs.getString("servletname"));
                    alstpermissionname.add(permissionsBean);
                }
            }
            System.out.println(alstpermissionname.size());
            
        } catch (SQLException e) {
            System.out.println(e);
        }
       return alstpermissionname;
    }
    
    
    
}
