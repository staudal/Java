<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplate>
  <%-- cover start --%>
  <section class="d-flex flex-column bg-dark text-center p-5">
    <h1 class="text-light m-auto fw-bold mb-1">Dine ordre</h1>
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
            <th scope="col">Pris</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="order" items="${sessionScope.orders}">
          <tr>
            <th scope="row">${order.value.getOrderId()}</th>
            <td>${order.value.getDate()}</td>
            <td>${order.value.getStatus()}</td>
            <td>${order.value.getPrice()} DKK</td>
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
                  <c:forEach var="cupcake" items="${order.value.getCupcakes()}">
                    <tr>
                      <td>${cupcake.value.getId()}</td>
                      <td>${cupcake.value.getBottom().getName()}</td>
                      <td>${cupcake.value.getTopping().getName()}</td>
                      <td>${cupcake.value.getPrice()}</td>
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
  </section>
</t:pageTemplate>