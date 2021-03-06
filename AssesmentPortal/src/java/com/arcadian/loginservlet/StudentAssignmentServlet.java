/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcadian.loginservlet;

import com.arcadian.loginbeans.AssignmentNoticeBean;
import com.arcadian.logindatalayer.AssignmentFolderService;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author manik
 */
public class StudentAssignmentServlet extends HttpServlet {

    AssignmentFolderService assignmentFoldetService;
    String username;
    private static final long serialVersionUID = 1L;
    private ServletFileUpload uploader = null;

    @Override
    public void init() throws ServletException {
        DiskFileItemFactory fileFactory = new DiskFileItemFactory();
        File filesDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
        fileFactory.setRepository(filesDir);
        this.uploader = new ServletFileUpload(fileFactory);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            assignmentFoldetService = new AssignmentFolderService();
            HttpSession session = request.getSession();
            username = (String) session.getAttribute("username");

            ArrayList<AssignmentNoticeBean> alstAssignmentNotice = assignmentFoldetService.fetchAssignmentNotice(username);
            request.setAttribute("alstAssignmentNotice", alstAssignmentNotice);

            RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard/assignmentfolder.jsp");
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
        
        if (request.getParameter("filename") != null) {
            String fileName = request.getParameter("filename");
            File file = new File(request.getServletContext().getAttribute("FILES_DIR") + File.separator + fileName);
            System.out.println("File location on server::" + file.getAbsolutePath());
            ServletContext ctx = getServletContext();
            InputStream fis = new FileInputStream(file);
            String mimeType = ctx.getMimeType(file.getAbsolutePath());
            System.out.println("mime type=" + mimeType);
            response.setContentType(mimeType != null ? mimeType : "application/octet-stream");
            response.setContentLength((int) file.length());
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

            ServletOutputStream os = response.getOutputStream();
            byte[] bufferData = new byte[102400];
            int read = 0;
            while ((read = fis.read(bufferData)) != -1) {
                os.write(bufferData, 0, read);
            }
            os.flush();
            os.close();
            fis.close();
            System.out.println("File downloaded at client successfully");
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
      
        
        if (!ServletFileUpload.isMultipartContent(request)) {
            throw new ServletException("Content type is not multipart/form-data");
        }
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            List<FileItem> fileItemsList = uploader.parseRequest(request);
            Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
            
            String assignmentid="";
            String filename="";
            while (fileItemsIterator.hasNext()) {
                
                FileItem fileItem = fileItemsIterator.next();
                System.out.println(fileItem);
                if (fileItem.isFormField()) {

                    String name = fileItem.getFieldName();
                    String value = fileItem.getString();
                    
                    if (name.equalsIgnoreCase("assignmentid")) {
                        assignmentid = value;
                    }
                    System.out.println("Assignment id=="+assignmentid);
                }

                if (fileItem.getName() != null) {

                        File file = new File(request.getServletContext().getAttribute("FILES_DIR") + File.separator + fileItem.getName());
                    System.out.println("Absolute Path at server=" + file.getAbsolutePath());
                    fileItem.write(file);
                    filename=fileItem.getName();
                }
                
            }
            assignmentFoldetService = new AssignmentFolderService();
                    assignmentFoldetService.updateAssignmentFolder(username, assignmentid,filename);

        } catch (FileUploadException e) {
            System.out.println("Exception in file upload" + e);
        } catch (Exception ex) {
            Logger.getLogger(CourseContentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
