<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jakobstaudal
  Date: 08/11/2022
  Time: 18.59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<%-- navigation start --%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-xl">
    <a class="navbar-brand" href="#">Olsker Cupcakes</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse d-flex justify-content-between align-items-center" id="navbarSupportedContent">
      <form class="mb-0" method="post">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <button class="nav-link btn" formaction="LoadCupcakeMaker">Bestil</button>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
        </ul>
      </form>
      <form class="d-flex mb-0" action="LoadBasket" method="post">
        <button type="submit" class="btn btn-primary">Indkøbskurv</button>
      </form>
    </div>
  </div>
</nav>
<%-- navigation end --%>
<%-- cover start --%>
<section class="d-flex flex-column bg-dark text-center p-5">
  <h1 class="text-light m-auto fw-bold mb-1">Indkøbskurv</h1>
</section>
<%-- cover end --%>
<%-- cart start --%>
<section class="p-5">
  <div class="container-xl">
    <div class="row">
      <div class="col-8 bg-light p-5">
        <div class="d-flex justify-content-between border-bottom mb-4">
          <p class="fw-bold">Min kurv</p>
          <p>Du har ${sessionScope.user.getBasket().getSizeOfBasket()} ting i kurven</p>
        </div>
        <div class="d-flex flex-column">
          <c:forEach var="cupcake" items="${sessionScope.user.getBasket().getCupcakes()}">
            <div class="card mb-3">
              <div class="row g-0">
                <div class="col-md-4">
                  <img src="https://i.ibb.co/GvjCk0P/login-Background.jpg" class="img-fluid rounded-start h-100">
                </div>
                <div class="col-md-8">
                  <div class="card-body">
                    <h5 class="card-title">Olsker Classic (${cupcake.value.getBottom().getName()})</h5>
                    <p class="card-text">Kagen består af en luftig bund af ${cupcake.value.getBottom().getName().toLowerCase()} med en blød, luftig ${cupcake.value.getTopping().getName().toLowerCase()}fromage pyntet med sprinkles.</p>
                    <p class="card-text mb-0"><small class="text-muted">Kagebund: ${cupcake.value.getBottom().getName()}</small></p>
                    <p class="card-text mb-0"><small class="text-muted">Topping: ${cupcake.value.getTopping().getName()}</small></p>
                  </div>
                </div>
              </div>
              <div class="card-footer d-flex justify-content-between">
                <small class="text-muted">Pris: ${cupcake.value.getPrice()} DKK</small>
                <form class="mb-0" method="post" action="RemoveFromBasket">
                  <button class="btn btn-danger badge" type="submit" name="cupcake" value="${cupcake.value.getId()}">Fjern</button>
                </form>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
      <div class="col-4 bg-light p-5">
        <div class="border-bottom mb-4">
          <p class="fw-bold">Ordreoversigt</p>
        </div>
        <div class="d-flex flex-column">
          <div class="d-flex justify-content-between">
            <p><strong>Subtotal</strong></p>
            <p><strong>${sessionScope.user.getBasket().getTotalPrice()} DKK</strong></p>
          </div>
          <div class="d-flex justify-content-between">
            <p class="text-muted">Levering</p>
            <p class="text-muted">Gratis</p>
          </div>
          <div class="d-flex justify-content-between">
            <p class="text-muted">Antal</p>
            <p class="text-muted">${sessionScope.user.getBasket().getSizeOfBasket()} cupcake(s)</p>
          </div>
          <div class="d-flex justify-content-between">
            <p class="text-muted">Miljøgebyr</p>
            <p class="text-muted">5 DKK</p>
          </div>
          <div class="d-flex justify-content-between border-top pt-2">
            <p class="fw-bold">Total</p>
            <p class="fw-bold">${sessionScope.user.getBasket().getTotalPrice() + 5} DKK</p>
          </div>
          <form class="mb-0 mt-2" action="PayForOrder" method="post">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Gå til betaling</button>

            <!-- Modal -->
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Betaling</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="d-flex flex-column">
                      <div class="row mb-3">
                        <div class="col">
                          <label for="firstName" class="form-label">Fornavn</label>
                          <input type="text" class="form-control" placeholder="${sessionScope.user.getFirstName()}" id="firstName" disabled>
                        </div>
                        <div class="col">
                          <label for="lastName" class="form-label">Efternavn</label>
                          <input type="text" class="form-control" placeholder="${sessionScope.user.getLastName()}" id="lastName" disabled>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <div class="col">
                          <label for="email" class="form-label">Email</label>
                          <input type="email" class="form-control" placeholder="${sessionScope.user.getEmail()}" id="email" disabled>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <div class="col">
                          <label for="delivery" class="form-label">Leveringsmetode</label>
                          <select class="form-select" id="delivery" required>
                            <option selected disabled value="">Vælg en leveringsmetode</option>
                            <option value="1">Afhentning i butik</option>
                          </select>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <div class="col">
                          <label for="payment" class="form-label">Betalingsmetode</label>
                          <select class="form-select" id="payment" required>
                            <option selected disabled value="">Vælg en betalingsmetode</option>
                            <option value="1">Træk fra min konto</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Luk</button>
                    <button type="submit" class="btn btn-primary">Betal nu</button>
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
<%-- cart end --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
