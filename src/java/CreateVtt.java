/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author jayanthi_raviteja
 */
public class CreateVtt extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String vtt=request.getParameter("q");
            String name=request.getParameter("q1");
            String n=name+".vtt";
            System.out.println(vtt);
            HttpSession session = request.getSession(true);
            ServletContext sc = getServletContext();
            String filePath = sc.getRealPath("/");
            //String path =filePath.substring(0, filePath.length() - 10);
            System.out.println("File Path is : " + filePath);
            session.setAttribute("filename","\\ss_annotate\\Feedbacks\\"+n);
           // File file = new File(filePath+"ss_annotate\\Feedbacks\\"+n);
            File file1 = new File("C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ss_annotate\\Feedbacks\\"+n);
          // File file= new File("/var/lib/tomcat6/webapps/ss_annotate/Feedbacks/"+n);
            FileWriter fw = new FileWriter(file1.getAbsoluteFile(),true);
			BufferedWriter bw = new BufferedWriter(fw);
                        bw.write(vtt);
                        bw.close(); 
                       
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {            
            out.close();
        }

    }


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
