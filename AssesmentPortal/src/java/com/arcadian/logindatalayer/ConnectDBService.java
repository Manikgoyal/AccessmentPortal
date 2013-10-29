/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.logindatalayer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author manik
 */
public class ConnectDBService {
    
   public static Connection conn;
    
    public static Connection connect(){
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/collegemgmt","root", "redhat");
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Exception in ConnectDBService="+e);
        }
        
        return conn;
    }
    
}
