<%@page import="com.Company.entity.User" %>
<%@page import="com.Company.main.Contex" %>
<%@page import="com.Company.dao.inter.UserDaoInter" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Page</title>
    <link rel="stylesheet" href="assets/css/usersCss.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/93cf21298f.js" crossorigin="anonymous"></script>
</head>
<body>
<%
    UserDaoInter userDao = Contex.instanceUserDao();
    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String nationalityId = request.getParameter("nid");
    Integer nId = null;
    if (nationalityId != null && !nationalityId.trim().isEmpty()) {
        nId = Integer.parseInt(nationalityId);
    }

    List<User> users = userDao.getAll(name, surname, nId);
%>
<div class="container  ">
    <div class="row">
        <div class="col">
        <form action="users.jsp" method="GET">
            <%--<input type="hidden" name="id" value=""/>--%>
            <div class="form-group">
                <label for="name">Name:</label>
                <input placeholder="Enter name"  class="form-control" type="text" name="name" value=""/>
            </div>
            <div class="form-group">
                <label for="surname">Surname:</label>
                <input  placeholder="Enter Surname" class="form-control" type="text" name="surname" value=""/>
            </div>
            <input class="btn btn-primary" type="submit" name="search" value="Search"/>
        </form>
    </div>
        <div class="col">
            <form action="users.jsp" method="GET">
                <%--<input type="hidden" name="id" value=""/>--%>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input placeholder="Enter name"  class="form-control" type="text" name="name" value=""/>
                </div>
                <div class="form-group">
                    <label for="surname">Surname:</label>
                    <input  placeholder="Enter Surname" class="form-control" type="text" name="surname" value=""/>
                </div>
                <input class="btn btn-primary" type="submit" name="search" value="Search"/>
            </form>
        </div>
        <div class="col">
            <form action="users.jsp" method="GET">
                <%--<input type="hidden" name="id" value=""/>--%>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input placeholder="Enter name"  class="form-control" type="text" name="name" value=""/>
                </div>
                <div class="form-group">
                    <label for="surname">Surname:</label>
                    <input  placeholder="Enter Surname" class="form-control" type="text" name="surname" value=""/>
                </div>
                <input class="btn btn-primary" type="submit" name="search" value="Search"/>
            </form>
        </div>
        <div class="col">
            <form action="users.jsp" method="GET">
                <%--<input type="hidden" name="id" value=""/>--%>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input placeholder="Enter name"  class="form-control" type="text" name="name" value=""/>
                </div>
                <div class="form-group">
                    <label for="surname">Surname:</label>
                    <input  placeholder="Enter Surname" class="form-control" type="text" name="surname" value=""/>
                </div>
                <input class="btn btn-primary" type="submit" name="search" value="Search"/>
            </form>
        </div>
    </div>
    <hr/>
    <div>
        <table class="table">
            <thead>
            <tr>
                <th>Name</th>
                <th>Surname</th>
                <th>Nationality</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                for (User u : users) {
            %>
            <tr>
                <td><%=u.getName()%>
                </td>
                <td><%=u.getSurName()%>
                </td>
                <td><%=u.getNationality().getName() == null ? "N/A" : u.getNationality().getName()%>
                </td>
                <td style="width: 5px">
                    <form action="userdetail" method="Post">
                    <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%=u.getId()%>">
                    <button class="btn btn-danger" type="submit"  value="delete" >
                        <i class="btntable fas fa-trash-alt"></i>
                    </button>
                    </form>
                </td>
                <td style="width: 5px">
                    <form action="userdetail" method="get">
                        <input type="hidden" name="id" value="<%=u.getId()%>">
                        <button class="btn btn-secondary" type="submit" name="action" value="uppdate">
                            <i class="fas fa-pen-square"></i>
                        </button>
                    </form>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
