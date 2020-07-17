package com.mycompany.resume.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName ="JSPFileFilter",urlPatterns = {"*.jsp"})
public class JspFilter implements Filter{


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) {
        HttpServletRequest req=(HttpServletRequest)servletRequest;
        HttpServletResponse  res =(HttpServletResponse)servletResponse;
        try{
            res.sendRedirect("error?msg=NOT FOUND");
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void destroy() {

    }

}
