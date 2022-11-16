<%--
  Created by IntelliJ IDEA.
  User: jakobstaudal
  Date: 05/11/2022
  Time: 19.06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Opret konto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/styles.css">
</head>
<body class="d-flex" id="login-body">
    <div class="vh-100 w-100 d-flex flex-column justify-content-center align-items-center">
        <h1 class="mb-4">Opret konto</h1>
        <form style="width: 500px" method="post" class="d-flex flex-column gap-2 justify-content-center mb-3" action="CreateAccount">
            <input type="text" class="form-control" name="firstName" placeholder="First name" required>
            <input type="text" class="form-control" name="lastName" placeholder="Last name" required>
            <input type="email" class="form-control" name="email" placeholder="Email" required>
            <input type="password" class="form-control" name="password" placeholder="Password" required>
            <button type="submit" class="btn btn-primary">Opret konto</button>
        </form>
        <a href="index.jsp">Log ind</a>
    </div>
</body>
</html>
