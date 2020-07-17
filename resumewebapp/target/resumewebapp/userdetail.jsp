<%@page import="com.Company.entity.User" %>
<%@page import="com.Company.main.Contex" %>
<%@page import="com.Company.dao.inter.UserDaoInter" %>
<%@ page import="com.mycompany.resume.controller.UserRequestUtill" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Page</title>
</head>
<body>
<%
    User u=(User)request.getAttribute("user");
%>
<div>
    <form action="userdetail" method="POST">
        <input type="hidden" name="id" value="<%=u.getId()%>"/>
        <input type="hidden" name="action" value="update">

        <label for="name">Name:</label>
        <input type="text" name="name" value="<%=u.getName()%>"/>
        <br/>

        <label for="surname">Surname:</label>
        <input type="text" name="surname" value="<%=u.getSurName()%>"/>
        <br/>

        <input type="submit" name="save" value="Save"/>
    </form>
</div>
</body>
</html>
