package com.mycompany.resume.controller;

import com.Company.dao.inter.UserDaoInter;
import com.Company.entity.User;
import com.Company.main.Contex;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserRequestUtill {
    public static void checkRequest(HttpServletRequest request, HttpServletResponse response) throws IllegalArgumentException{

            String userIdStr = request.getParameter("id");
            if (userIdStr == null || userIdStr.trim().isEmpty()) {
                throw new IllegalArgumentException("id is not specified ");
    }
    }

    public static User processRequest(HttpServletRequest request, HttpServletResponse response) throws IllegalArgumentException {
     UserRequestUtill.checkRequest(request,response);
        Integer userid = Integer.parseInt(request.getParameter("id"));
        UserDaoInter userDao = Contex.instanceUserDao();
        User u = userDao.getById(userid);
        if (u == null) {
            throw new IllegalArgumentException("There is no user whith this id");
        }
         return u;
    }
    }
