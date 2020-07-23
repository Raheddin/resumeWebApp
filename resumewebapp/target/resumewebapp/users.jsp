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
    <link rel="stylesheet" href="assets/css/users.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/93cf21298f.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="assets/js/users.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
    /*User s = (User)request.getSession().getAttribute("loggedInUser");*/
%>
<div class="container  ">
    <div class="row">
        <div class="col">
        <form action="users" method="GET">
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
                    <%--<form action="userdetail" method="Post">--%>
                    <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%=u.getId()%>">
                    <button onclick="setIdForDelete('<%=u.getId()%>')" class="btn btn-danger" type="submit"  data-toggle="modal" data-target="#exampleModal" value="delete" >
                        <i class="btntable fas fa-trash-alt"></i>
                    </button>
                   <%-- </form>--%>
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

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                are you sure?
            </div>
            <div class="modal-footer">
                <form action="userdetail" method="Post">
                <input type="hidden" name="action" value="delete"/>
                <input type="hidden" name="id" id="idForDelete"/>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                <button class="btn btn-danger"  type="submit"  value="Yes">Yes</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
