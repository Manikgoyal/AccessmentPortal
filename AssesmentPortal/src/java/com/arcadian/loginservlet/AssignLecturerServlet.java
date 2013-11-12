/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.loginservlet;

import com.arcadian.logindatalayer.AssignLecturerService;
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
public class AssignLecturerServlet extends HttpServlet {

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

            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");

            AssignLecturerService assignLecturerService = new AssignLecturerService();
            ArrayList asltAssignLecturerId = assignLecturerService.getLecturerId(username);
            request.setAttribute("asltAssignLecturerId", asltAssignLecturerId);

            ArrayList alstLecturerClassId = assignLecturerService.getLecturerClassID(username);
            request.setAttribute("alstLecturerClassId", alstLecturerClassId);

            ArrayList alstAssignLecturer = assignLecturerService.fetchAssignLecturer(username);
            request.setAttribute("alstAssignLecturer", alstAssignLecturer);

            RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard/assignlecturer.jsp");
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
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String lectid = request.getParameter("lectid");
        String classid = request.getParameter("classid");
        String subjectid = request.getParameter("subjectid");

        AssignLecturerService assignLecturerService = new AssignLecturerService();
        int i = assignLecturerService.assignLecturer(classid, lectid, subjectid, username);
        if (i == 1) {
            System.out.println("lecturer assigned");
        }

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
