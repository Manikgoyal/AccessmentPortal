/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.loginservlet;

import com.arcadian.loginbeans.TestNoticeBean;
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
public class ApproveTestServlet extends HttpServlet {

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
            if(request.getParameter("status1")!=null & request.getParameter("testid1")!=null){
                String status=request.getParameter("status1");
                String testid=request.getParameter("testid1");
                if(status.equalsIgnoreCase("true")){
                    int i=service.updateStatus(false, testid);
                    if(i==1){
                        System.out.println("updated");
                    }
            }
                else{
                    int i=service.updateStatus(true, testid);
                if(i==1){
                        System.out.println("updated");
                    }
                }
                
            }
            
            
            if(request.getParameter("status1")==null & request.getParameter("testid1")!=null){
                String testid=request.getParameter("testid1");
                int i=service.deleteTest(testid);
                if(i==1){
                    System.out.println("test deleted successfully");
                }
            }
            
            
            String branchid= service.fetchBranch(username);
            
            
            request.setAttribute("branchid", branchid);
            
            ArrayList alstclassid=service.fetchClassid(username);
            request.setAttribute("classid",alstclassid);
            
            ArrayList alstTestDetails=service.fetctTestDetails(branchid);
            request.setAttribute("alstTestDetails", alstTestDetails);
            
            
            
            RequestDispatcher dispatcher=request.getRequestDispatcher("dashboard/approvetest.jsp");
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
        String testid=request.getParameter("testid");
         String branchid=request.getParameter("branchid");
        String classid=request.getParameter("classid");
        String Subject=request.getParameter("subjectid");
        String dateoftest=request.getParameter("dateoftest");
        String maxmarks=request.getParameter("maxmarks");
        String time=request.getParameter("time");
        String status=request.getParameter("status");
        String testname=request.getParameter("testname");
        
        TestNoticeBean testNoticeBean=new TestNoticeBean();
        testNoticeBean.setTestid(testid);
        testNoticeBean.setTestname(testname);
        testNoticeBean.setBranchid(branchid);
        testNoticeBean.setClassid(classid);
        testNoticeBean.setMaximarks(maxmarks);
        testNoticeBean.setMaxitime(time);
        testNoticeBean.setStatus(Boolean.parseBoolean(status));
        testNoticeBean.setDateoftest(dateoftest);
        testNoticeBean.setSubjectid(Subject);
        TestsService testsService=new TestsService();
        int i=testsService.createTest(testNoticeBean);
        
        if(i==1){
            System.out.println("test created successfully");
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
