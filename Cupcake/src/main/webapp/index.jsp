<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Log ind</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/styles.css">
</head>
<body class="d-flex">
    <div class="vh-100 w-100 d-flex flex-column justify-content-center align-items-center">
        <h1 class="mb-4">Log ind</h1>
        <form id="loginform" method="post" class="d-flex flex-column gap-2 justify-content-center mb-3" action="Login">
            <input type="email" class="form-control" name="email" placeholder="Email" required>
            <input type="password" class="form-control" name="password" placeholder="Password" required>
            <button type="submit" class="btn btn-primary">Log ind</button>
        </form>
        <a href="createAccount.jsp">Opret konto</a>
    </div>
</body>
</html>