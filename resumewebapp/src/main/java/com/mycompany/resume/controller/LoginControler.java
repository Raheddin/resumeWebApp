/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.resume.controller;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.Company.dao.inter.UserDaoInter;
import com.Company.entity.User;
import com.Company.main.Contex;
import com.mycompany.resume.util.ControlerUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "LoginControler", urlPatterns = {"/login"})
public class LoginControler extends HttpServlet {


    private UserDaoInter userDao = Contex.instanceUserDao();
    private BCrypt.Verifyer verifyer=BCrypt.verifyer();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.getRequestDispatcher("login.jsp").forward(request,response);

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       try {
           String email = request.getParameter("email");
           String password = request.getParameter("password");

           User user=userDao.findByEmail(email);
           if (user==null)
               throw new IllegalArgumentException("User doesnt existtt!!!");

           BCrypt.Result rs = verifyer.verify(password.toCharArray(),user.getPassword().toCharArray());

           if (!rs.verified)
           throw new IllegalArgumentException("password is incorect !!!!");

           request.getSession().setAttribute("loggedInUser",user);
           response.sendRedirect("users");
       }catch (Exception ex){
           ControlerUtil.errorPage(response,ex);
       }



    }

    }
