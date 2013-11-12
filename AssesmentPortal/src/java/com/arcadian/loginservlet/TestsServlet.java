/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.loginservlet;

import com.arcadian.loginbeans.TestDataBean;
import com.arcadian.logindatalayer.TestsService;
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
public class TestsServlet extends HttpServlet {

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
            String username=(String)session.getAttribute("username");
            
            TestsService service=new TestsService();
            String branchid= service.fetchBranch(username);
            request.setAttribute("branchid", branchid);
            
            ArrayList alstclassid=service.fetchClassid(username);
            request.setAttribute("classid",alstclassid);
            
            RequestDispatcher dispatcher=request.getRequestDispatcher("dashboard/tests.jsp");
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
        
        
        String branchid=request.getParameter("branchid");
        String classid=request.getParameter("classid");
        String Subject=request.getParameter("subjectid");
        String question=request.getParameter("question");
        String opt1=request.getParameter("opt1");
        String opt2=request.getParameter("opt2");
        String opt3=request.getParameter("opt3");
        String opt4=request.getParameter("opt4");
        String ans=request.getParameter("ans");
        
        TestDataBean testDataBean=new TestDataBean();
        testDataBean.setBranchid(branchid);
        testDataBean.setClassid(classid);
        testDataBean.setSubjectid(Subject);
        testDataBean.setQuestion(question);
        testDataBean.setOpt1(opt1);
        testDataBean.setOpt2(opt2);
        testDataBean.setOpt3(opt3);
        testDataBean.setOpt4(opt4);
        testDataBean.setAns(ans);
        
        TestsService service=new TestsService();
       int i= service.setTestQuestion(testDataBean);
        if(i==1){
            System.out.println("data inserted");
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
