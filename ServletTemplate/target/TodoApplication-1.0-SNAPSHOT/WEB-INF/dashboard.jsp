<%--
  Created by IntelliJ IDEA.
  User: jakobstaudal
  Date: 09/10/2022
  Time: 01.13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="bg-light">
<div class="d-flex align-items-center mt-5 flex-column">
    <form action="addTodo" class="row g-3" method="post" style="width: 600px">
        <div class="p-0 position-relative">
            <input type="text" class="form-control" name="todoItem" placeholder="Todo" autofocus required>
            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">${requestScope.todoCount}</span>
        </div>
        <button class="btn btn-primary w-100 mb-3" type="submit">Add todo</button>
    </form>
    <div style="width: 600px" class="mb-5">
        <form method="post">
            <ul class="list-group">
                <c:forEach var="item" items="${requestScope.todoList}">
                    <li class="list-group-item d-flex justify-content-between align-items-center border">
                        ${item.value}
                        <div>
                            <form method="post" class="m-0">
                                <!-- <button class="btn btn-secondary badge" name="changeButton" formaction="changeTransfer" value="${item.key}/${item.value}">Change</button> -->
                                <button type="button" class="btn btn-secondary badge" data-bs-toggle="modal" data-bs-target="#id${item.key}">Edit</button>
                                <button class="btn btn-success badge" name="todoItemId" formaction="removeTodo" value="${item.key}">Done</button>
                            </form>
                            <div class="modal fade" id="id${item.key}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <form method="post" action="changeTodo">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Change todo</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="mb-3 row">
                                                    <label class="col-sm-2 col-form-label">Old</label>
                                                    <div class="col-sm-10 d-flex align-items-center">
                                                        <p class="m-0">${item.value}</p>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label for="newTodo" class="col-sm-2 col-form-label">New</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="newTodo" name="newTodo" required>
                                                        <input type="hidden" name="todoId" value="${item.key}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Save changes</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </form>
    </div>
</div>
<div class="fixed-bottom mb-3 d-flex justify-content-center g-3">
    <form method="post">
        <button formaction="clearTodos" class="btn btn-danger me-3">Clear todos</button>
        <button formaction="logout" class="btn btn-danger">Log out</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
