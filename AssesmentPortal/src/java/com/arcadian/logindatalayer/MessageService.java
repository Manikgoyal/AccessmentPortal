package com.arcadian.logindatalayer;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



import com.arcadian.loginbeans.MessageBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author manik
 */
public class MessageService {

    Connection con;
    Statement smt;
    ResultSet rs;
    
    public MessageService() {
        try {
            con=ConnectDBService.connect();
            smt=con.createStatement();
            
        } catch (SQLException e) {
            System.out.println("Exception in LoginService Constructor="+e);
        }
        
    }
    public int sendmessage(String message,String subject,String receiver,String sender){
        int i=0;
        try{
            String query="insert into mailing (receiver, message, time, date, flag, sender, subject) values('"+receiver+"','"+message+"','9.30','05/04/03','1','"+sender+"','"+subject+"')";
                    
            i=smt.executeUpdate(query);
        }
        catch(SQLException e){
            System.out.println("error in sending message"+e);
        }
       return i; 
    }
     public ArrayList fetchsentmessage(String sender){
        ArrayList alstsentmessages=new ArrayList();
        MessageBean bean=null;
        try{
            String query="select messageid,message,subject,receiver from mailing where sender='"+sender+"' ";
                    
            rs=smt.executeQuery(query);
            while(rs.next()){
                bean=new MessageBean();
                bean.setMessageid(rs.getString("messageid"));
                bean.setMessage(rs.getString("message"));
                bean.setReceiver(rs.getString("receiver"));
                bean.setSubject(rs.getString("subject"));
                alstsentmessages.add(bean);
            }
        }
        catch(Exception e){
            System.out.println("error in getting sentbox"+e);
        }
       return alstsentmessages; 
    } public ArrayList fetchreceivedmessage(String sender){
        ArrayList alstreceivedmessages=new ArrayList();
        MessageBean bean=null;
        try{
            String query="select messageid,message,subject,sender from mailing where receiver='"+sender+"' ";
                    
            rs=smt.executeQuery(query);
            while(rs.next()){
                bean=new MessageBean();
                bean.setMessageid(rs.getString("messageid"));
                bean.setMessage(rs.getString("message"));
                bean.setSender(rs.getString("sender"));
                bean.setSubject(rs.getString("subject"));
                alstreceivedmessages.add(bean);
            }
        }
        catch(Exception e){
            System.out.println("error in getting inbox"+e);
        }
       return alstreceivedmessages; 
    }
      public ArrayList getuserlist(){
        ArrayList userlist=new ArrayList();
        MessageBean bean=null;
        try{
            String query="select userid from users";        
            rs=smt.executeQuery(query);
            while(rs.next()){
                bean=new MessageBean();
                bean.setUserslist(rs.getString("userid"));
                userlist.add(bean);
                
            }
            System.out.println(userlist);
        }
        catch(Exception e){
            System.out.println("error in fecthing users"+e);
        }
       return userlist; 
    }
    
}