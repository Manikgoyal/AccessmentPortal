package com.arcadian.loginbeans;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author android
 */
public class MessageBean {
    String Sender="";
    String Receiver="";
    String Subject="";
    String Message="";
    String Messageid="";
    String userslist="";

    public String getUserslist() {
        return userslist;
    }

    public void setUserslist(String userslist) {
        this.userslist = userslist;
    }
    

    public String getSender() {
        return Sender;
    }

    public void setSender(String Sender) {
        this.Sender = Sender;
    }

    public String getReceiver() {
        return Receiver;
    }

    public void setReceiver(String Receiver) {
        this.Receiver = Receiver;
    }

    public String getSubject() {
        return Subject;
    }

    public void setSubject(String Subject) {
        this.Subject = Subject;
    }

    public String getMessage() {
        return Message;
    }

    public void setMessage(String Message) {
        this.Message = Message;
    }

    public String getMessageid() {
        return Messageid;
    }

    public void setMessageid(String Messageid) {
        this.Messageid = Messageid;
    }
    
    
}
