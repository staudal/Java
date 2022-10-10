<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="bg-light">
<div class="d-flex justify-content-center align-items-center mw-100 w-100 vh-100 flex-column">
  <h1 class="mb-5">Create an account</h1>
  <form action="createAccount" class="row g-3" method="post" style="width: 500px">
    <div class="p-0">
      <input type="text" class="form-control ${requestScope.usernameErrorClass}" name="username" placeholder="Username" autofocus required>
      ${requestScope.usernameErrorMessage}
    </div>
    <div class="p-0">
      <input type="password" class="form-control ${requestScope.passwordErrorClass}" name="password" placeholder="Password" required>
      ${requestScope.passwordErrorMessage}
    </div>
    <button class="btn btn-primary w-100 mb-3" type="submit">Create account</button>
  </form>
  <a href="index.jsp" class="text-decoration-none text-center text-body">Already have an account?</a>
</div>
</body>
</html>