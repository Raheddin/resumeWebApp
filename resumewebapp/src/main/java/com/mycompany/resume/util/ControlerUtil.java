package com.mycompany.resume.util;

import javax.servlet.http.HttpServletResponse;

public class ControlerUtil {
    public static  void errorPage(HttpServletResponse resp,Exception ex){
        try{
            ex.printStackTrace();
            resp.sendRedirect("error?msg="+ex.getMessage());
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
