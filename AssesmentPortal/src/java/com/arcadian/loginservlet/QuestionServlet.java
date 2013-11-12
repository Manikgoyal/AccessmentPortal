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
import java.util.Collections;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class QuestionServlet extends HttpServlet {

    ArrayList alstQuestion = new ArrayList();
    HttpSession session;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int page_number = 1;

            if (request.getParameter("page_number") != null) {
                page_number = Integer.parseInt(request.getParameter("page_number"));
            }

            String que = (String) alstQuestion.get(page_number - 1);
            int ques_no = Integer.parseInt(que);
            
            TestsService service = new TestsService();
            ArrayList alstQuesAns = service.getQuestionAns(ques_no);
            
            request.setAttribute("alstQuesAns", alstQuesAns);
            request.setAttribute("listsize", alstQuestion.size());
            request.setAttribute("page_number", page_number);

            RequestDispatcher rd = request.getRequestDispatcher("dashboard/testview.jsp");
            rd.forward(request, response);

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    static int flag = 1;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (flag == 1) {
            String testid = request.getParameter("testid");
            TestsService testsService = new TestsService();
            alstQuestion = testsService.getQuestion(testid);
            Collections.shuffle(alstQuestion);
            flag++;
        }

        if (request.getParameter("group") != null) {

            String quesno=request.getParameter("quesno");
            System.out.println(quesno);
            String stuans = request.getParameter("group");
            ArrayList alstStudent = new ArrayList();

            if (session.getAttribute("alststu") != null) {
                alstStudent = (ArrayList) session.getAttribute("alststu");
            }

            alstStudent.add(stuans);

            session.setAttribute("alststu", alstStudent);

            System.out.println(alstStudent);

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
    }

}
