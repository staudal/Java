<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplateAdmin>
  <%-- cover start --%>
  <section class="d-flex flex-column bg-dark text-center p-5">
    <h1 class="text-light m-auto fw-bold mb-1">Ordre for ${sessionScope.newUser.getFirstName()} ${sessionScope.newUser.getLastName()}</h1>
  </section>
  <%-- cover end --%>
  <section class="container-xl p-5">
    <div class="table-responsive">
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th scope="col">OrderID</th>
            <th scope="col">Dato</th>
            <th scope="col">Status</th>
            <th scope="col">Pris (heraf 5 DKK miljøgebyr)</th>
            <th scope="col">Fjern</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="order" items="${sessionScope.newUser.getOrders()}">
          <tr>
            <th scope="row">${order.getOrderId()}</th>
            <td>${order.getDate()}</td>
            <td>${order.getStatus()}</td>
            <td>${order.getPrice()} DKK</td>
            <form action="AdminRemoveOrderServlet" method="post">
              <td><button class="btn btn-danger" type="submit" name="orderId" value="${order.getOrderId()}">Fjern</button></td>
            </form>
          </tr>
          <tr>
            <td colspan="4">
              <table class="table table-bordered mb-0">
                <thead>
                  <tr>
                    <th scope="col">CupcakeID</th>
                    <th scope="col">Kagebund</th>
                    <th scope="col">Topping</th>
                    <th scope="col">Pris</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="cupcake" items="${order.getCupcakes()}">
                    <tr>
                      <td>${cupcake.getId()}</td>
                      <td>${cupcake.getBottom().getName()}</td>
                      <td>${cupcake.getTopping().getName()}</td>
                      <td>${cupcake.getPrice()} DKK</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    <form action="LoadCustomers" class="d-flex justify-content-center" method="post">
      <button class="btn btn-primary w-100" type="submit">Gå tilbage</button>
    </form>
  </section>
</t:pageTemplateAdmin>