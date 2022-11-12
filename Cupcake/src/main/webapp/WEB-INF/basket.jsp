<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplate>
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
                      <h5 class="card-title">Olsker Classic (${cupcake.getBottom().getName()})</h5>
                      <p class="card-text">Kagen består af en luftig bund af ${cupcake.getBottom().getName().toLowerCase()} med en blød, luftig ${cupcake.getTopping().getName().toLowerCase()}fromage pyntet med sprinkles.</p>
                      <p class="card-text mb-0"><small class="text-muted">Kagebund: ${cupcake.getBottom().getName()}</small></p>
                      <p class="card-text mb-0"><small class="text-muted">Topping: ${cupcake.getTopping().getName()}</small></p>
                    </div>
                  </div>
                </div>
                <div class="card-footer d-flex justify-content-between">
                  <small class="text-muted">Pris: ${cupcake.getPrice()} DKK</small>
                </div>
              </div>
            </c:forEach>
            <c:if test="${sessionScope.user.getBasket().getSizeOfBasket() >= 1}">
              <form action="EmptyBasket" method="post" class="mb-0">
                <button class="btn btn-danger w-100">Tøm kurv</button>
              </form>
            </c:if>
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
              <c:if test="${sessionScope.user.getBasket().getSizeOfBasket() < 1}">
                <button type="button" class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#staticBackdrop" disabled>Gå til betaling</button>
              </c:if>
              <c:if test="${sessionScope.user.getBasket().getSizeOfBasket() >= 1}">
                <button type="button" class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Gå til betaling</button>
              </c:if>

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
</t:pageTemplate>