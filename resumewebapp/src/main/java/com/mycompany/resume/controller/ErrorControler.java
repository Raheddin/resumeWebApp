/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.resume.controller;

import com.Company.dao.inter.UserDaoInter;
import com.Company.entity.User;
import com.Company.main.Contex;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "ErrorControler", urlPatterns = {"/error"})
public class ErrorControler extends HttpServlet {


    private UserDaoInter userDao = Contex.instanceUserDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            /*String str = request.getParameter("msg");
            request.setAttribute("msg",str);*/
            request.getRequestDispatcher("error.jsp").forward(request,response);

    }

    }
