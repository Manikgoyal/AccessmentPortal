/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.loginservlet;

import com.arcadian.logindatalayer.LoginService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author manik
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            HttpSession session=request.getSession();
            
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            
            LoginService loginService=new LoginService();
           Boolean status= loginService.authenticateUser(username, password);
            System.out.println("Status =" +status);
            
            if(status==true){
                session.setAttribute("username", username);
                ArrayList alstgrouppermissions=loginService.getGroupPermissions(username);
                ArrayList allowedIndivisualPermissions=loginService.getIndividualAllowedPermissions(username);
                ArrayList deniedIndivisualPermissions=loginService.getIndividualDeniedPermissions(username);
                alstgrouppermissions.addAll(allowedIndivisualPermissions);
                alstgrouppermissions.removeAll(deniedIndivisualPermissions);
                Set alstFinalPermission=new HashSet(alstgrouppermissions);
                System.out.println("arraylist=="+alstFinalPermission);
                
                
                
                ArrayList  alstpermissionname=loginService.getPermissionName(alstFinalPermission);
                
                session.setAttribute("allowed_permissions", alstpermissionname);
                response.sendRedirect("dashboard/dashboard.jsp");
                         
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
