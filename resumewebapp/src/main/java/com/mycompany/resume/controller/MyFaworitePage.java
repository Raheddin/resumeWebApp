/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.resume.controller;

import com.Company.dao.inter.SkillDaoInter;
import com.Company.dao.inter.UserDaoInter;
import com.Company.entity.Skill;
import com.Company.entity.User;
import com.Company.main.Contex;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author acer
 */
@WebServlet(name = "MyFaworitePage", urlPatterns = {"/MyFaworitePage"})
public class MyFaworitePage extends HttpServlet {
    
    UserDaoInter userDaoInter=Contex.instanceUserDao();
    SkillDaoInter sdi =Contex.instanceSkillDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int i = Integer.valueOf(request.getParameter("id"));
        
         response.setContentType("text/html;charset=UTF-8");
         User u =userDaoInter.getById(i);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MyFaworitePage</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println(u+"<br>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
       String name = String.valueOf(req.getParameter("name"));
       response.setContentType("text/html;charset=UTF-8");
       Skill s = new Skill(0, name);
       sdi.insertSkill(s);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MyFaworitePage</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("skills"+sdi.getAll());
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
    }

    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }


}
