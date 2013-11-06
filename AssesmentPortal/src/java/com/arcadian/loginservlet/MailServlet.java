/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.loginservlet;

import com.arcadian.logindatalayer.MessageService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class MailServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session=request.getSession();
            
            String receiver;
            String subject ;
            String message ;
            String sender;
            receiver = request.getParameter("directorylist");
            subject = request.getParameter("subject");
            message = request.getParameter("message");
            sender = (String)session.getAttribute("username");
            
            if (subject != null || message != null) {
                int i;

                MessageService obj = new MessageService();
                i = obj.sendmessage(message, subject, receiver,sender);
                if (i == 1) {
                    System.out.println("message sent");
                }
            }
            ArrayList userlist;
            MessageService obj1 = new MessageService();
           userlist = obj1.getuserlist();

            System.out.println("userlidt"+userlist.size());
            ArrayList alstmessagessent;
             alstmessagessent = obj1.fetchsentmessage(sender);
             
             System.out.println("message"+alstmessagessent.size());
             
             receiver=(String)session.getAttribute("username");
              ArrayList alstmessagesreceived;
             alstmessagesreceived=obj1.fetchreceivedmessage(receiver);
             System.out.println("revieve"+alstmessagesreceived.size());
            request.setAttribute("userlist", userlist);
            request.setAttribute("alstmessagessent", alstmessagessent);
            request.setAttribute("alstmessagesreceived", alstmessagesreceived);
            RequestDispatcher dispatcher=request.getRequestDispatcher("dashboard/mailing.jsp");
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
