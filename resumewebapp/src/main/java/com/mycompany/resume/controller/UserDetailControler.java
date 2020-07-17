/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.resume.controller;

import com.Company.dao.inter.UserDaoInter;
import com.Company.entity.User;
import com.Company.main.Contex;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(name = "UserDetailControler", urlPatterns = {"/userdetail"})
public class UserDetailControler extends HttpServlet {


    private UserDaoInter userDao = Contex.instanceUserDao();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action= request.getParameter("action");
        int id =Integer.valueOf(request.getParameter("id"));
        if(action.equals("update")) {
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");

            User user = userDao.getById(id);
            user.setName(name);
            user.setSurName(surname);

            userDao.updateUser(user);
        }else if(action.equals("delete")){
            userDao.removeUser(id);
        }
        response.sendRedirect("users");
        
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userIdStr = request.getParameter("id");
            if (userIdStr == null || userIdStr.trim().isEmpty()) {
                throw new IllegalArgumentException("id is not specified ");
            }
            Integer userid = Integer.parseInt(request.getParameter("id"));
            UserDaoInter userDao = Contex.instanceUserDao();
            User u = userDao.getById(userid);
            if (u == null) {
                throw new IllegalArgumentException("There is no user whith this id="+userid);
            }

            request.setAttribute("user",u);
            request.setAttribute("ovner",true);
            request.getRequestDispatcher("userdetail.jsp").forward(request,response);
        }catch (Exception e){
            e.printStackTrace();
            response.sendRedirect("error?msg="+e.getMessage());
        }
        //return u;
    }

    }
