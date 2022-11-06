<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jakobstaudal
  Date: 02/11/2022
  Time: 20.36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="m-3 d-flex flex-column">
  <img src="https://i.ibb.co/dKgXFQ0/hero.png" alt="Hero image of cupcakes">
  <div class="mt-3 d-flex justify-content-between bg-light p-3 border">
    <div class="d-flex align-items-center gap-4">
      <form method="post" class="mb-0">
        <button class="btn" formaction="Redirecter" name="page" value="dashboard">Bestil</button>
        <button class="btn" formaction="Redirecter" name="page" value="basket">Indkøbskurv</button>
      </form>
    </div>
    <div>
            <span>
                <p class="mb-0 me-3 d-inline">${sessionScope.email}</p>
                <form class="d-inline" method="post" action="Logout">
                    <button class="btn btn-secondary">Log ud</button>
                </form>
            </span>
    </div>
  </div>
  <div class="mt-3 pt-4 pb-4 bg-light d-flex flex-column border">
      <c:forEach var="item" items="${sessionScope.user.getBasket().getCupcakes()}">
          <p>1x ${item.getTopping()}, 1x ${item.getBottom()}</p>
      </c:forEach>
  </div>
</div>
</body>
</html>