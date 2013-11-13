/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.loginservlet;

import com.arcadian.logindatalayer.TestsService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author manik
 */
public class TestFinishServlet extends HttpServlet {

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
            ArrayList alstCorrectAns=null;
            ArrayList alstWrongAns = null;
            
            String userid=(String)session.getAttribute("username");
            String testid=(String)session.getAttribute("testid");
            System.out.println(userid+testid);
            if(session.getAttribute("alstWrongAns")!=null)
            alstWrongAns=(ArrayList)session.getAttribute("alstWrongAns");
            if(session.getAttribute("alstCorrectAns")!=null)
            alstCorrectAns=(ArrayList)session.getAttribute("alstCorrectAns");
            
            if (request.getParameter("group") != null) {
            String quesno=request.getParameter("quesno");
            
            TestsService testsService = new TestsService();
            String ans=testsService.getAns(Integer.parseInt(quesno));
            String stuans = request.getParameter("group");
            
            
            if(ans.equalsIgnoreCase(stuans)){
                alstCorrectAns.add("y");
                session.setAttribute("alstCorrectAns",alstCorrectAns);
            }
            else{
                alstWrongAns.add("n");
                session.setAttribute("alstWrongAns",alstWrongAns);
            }
        }
            
            int marks=alstCorrectAns.size();
            
            
            
            
            TestsService testsService=new TestsService();
           int i= testsService.insertResult(userid, testid,marks);
            if(i==1){
                System.out.println("result inserted");
            }
            
            response.sendRedirect("DashboardServlet");
            
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
