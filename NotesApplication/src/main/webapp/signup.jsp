<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <title>Notes App</title>
</head>
<body>
<div class="container flex-column d-flex justify-content-center align-items-center vh-100">
  <h1 class="mb-5">Create an account</h1>
  <div style="width: 500px">
    <form action="SignupServlet" method="post">
      <input class="form-control mb-3 ${requestScope.usernameErrorClass}" type="text" placeholder="Username" name="username" required autofocus>
      <input class="form-control mb-3 ${requestScope.passwordErrorClass}" type="password" placeholder="Password" name="password" required>
      <button class="btn btn-primary w-100" type="submit">Create account</button>
      <div class="invalid-feedback text-center pt-3">
        ${requestScope.errorMessage}
      </div>
    </form>
  </div>
</div>
<div class="position-fixed bottom-0 start-50 translate-middle-x">
  <a class="btn btn-secondary mb-3" href="index.jsp">Already have an account?</a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>