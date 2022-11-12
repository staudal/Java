<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplate>
  <%-- cover start --%>
  <section class="d-flex flex-column bg-dark text-center p-5">
    <h1 class="text-light m-auto fw-bold mb-1">Min konto</h1>
  </section>
  <%-- cover end --%>
  <div class="container">
    <main class="p-5">
      <div class="row g-5">
        <div class="col-md-5 col-lg-4 order-md-last">
          <h4 class="mb-3">Kontooplysninger</h4>
          <form action="AddBalanceToAccount" method="post">
            <div class="row gy-3">
              <div class="col-md-12 p-0">
                <label for="cardNumber" class="form-label">Kortnummer</label>
                <input type="text" class="form-control" id="cardNumber" required>
              </div>
              <div class="col-md-6 ps-0">
                <label for="expDate" class="form-label">Udløbsdato</label>
                <input type="text" class="form-control" id="expDate" required>
              </div>
              <div class="col-md-6 pe-0">
                <label for="cvv" class="form-label">PIN</label>
                <input type="text" class="form-control" id="cvv" required>
              </div>
              <div class="col-md-12 p-0">
                <label for="amount" class="form-label">Beløb (DKK)</label>
                <input type="text" class="form-control" id="amount" name="amount" required>
              </div>
              <button class="btn btn-primary" type="submit">Overfør</button>
            </div>
          </form>
        </div>
        <div class="col-md-7 col-lg-8">
          <h4 class="mb-3">Personoplysninger</h4>
          <form>
            <div class="row g-3">
              <div class="col-sm-6">
                <label for="firstName" class="form-label">Fornavn</label>
                <input type="text" class="form-control" id="firstName" value="${sessionScope.user.getFirstName()}" required>
              </div>

              <div class="col-sm-6">
                <label for="lastName" class="form-label">Last name</label>
                <input type="text" class="form-control" id="lastName" value="${sessionScope.user.getLastName()}" required>
              </div>

              <div class="col-12">
                <label for="username" class="form-label">Email</label>
                <div class="input-group">
                  <input type="text" class="form-control" id="username" value="${sessionScope.user.getEmail()}" required>
                </div>
              </div>

              <div class="col-12">
                <label for="address" class="form-label">Adgangskode</label>
                <input type="password" class="form-control" id="address" value="${sessionScope.user.getPassword()}" required>
              </div>

              <div class="col-12">
                <label for="balance" class="form-label">Balance</label>
                <input type="text" class="form-control" id="balance" value="${sessionScope.user.getBalance()}" disabled>
              </div>

            <button class="w-100 btn btn-primary btn-lg mt-4" type="submit">Continue to checkout</button>
          </form>
        </div>
      </div>
    </main>
  </div>
</t:pageTemplate>