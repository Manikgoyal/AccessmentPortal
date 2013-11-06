/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.loginservlet;

import com.arcadian.logindatalayer.AssignStudentService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author manik
 */
public class AssignStudentServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session=request.getSession();
            String username=(String)session.getAttribute("username");
            System.out.println("rr"+username);
            AssignStudentService assignStudentService=new AssignStudentService();
            ArrayList alstassignStudent=assignStudentService.getStudentList(username);
           ArrayList alstAssignedStudentList=assignStudentService.getAssignedStudentList();
           alstassignStudent.removeAll(alstAssignedStudentList);
           request.setAttribute("alstassignStudent",alstassignStudent);
           
           ArrayList alstAssignedStudent=assignStudentService.getAssignedStudent();
           request.setAttribute("alstAssignedStudent",alstAssignedStudent);
           
           ArrayList alstClassList=assignStudentService.getClassList(username);
            request.setAttribute("alstClassList",alstClassList);
            
            RequestDispatcher dispatcher=request.getRequestDispatcher("dashboard/assignstudent.jsp");
            dispatcher.forward(request, response);
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
        
        if(request.getParameter("classid")!=null){
            String classid=request.getParameter("classid");
            String studentid=request.getParameter("studentid");
            
            AssignStudentService assignStudentService=new AssignStudentService();
            int i=assignStudentService.assignStudentList(studentid, classid);
           if(i==1)
            System.out.println("Student assigned to class");
        }
        
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
