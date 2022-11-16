<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplateAdmin>
    <%-- cover start --%>
    <section class="d-flex flex-column bg-dark text-center p-5">
        <h1 class="text-light m-auto fw-bold mb-1">Kunder</h1>
    </section>
    <%-- cover end --%>
    <section class="container-xl p-5">
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th scope="col">BrugerID</th>
                    <th scope="col">Fornavn</th>
                    <th scope="col">Efternavn</th>
                    <th scope="col">Email</th>
                    <th scope="col">Kodeord</th>
                    <th scope="col">Antal ordre</th>
                    <th scope="col">Se ordre</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${sessionScope.users.values()}">
                    <form action="AdminLoadOrdersServlet" method="post" class="mb-0">
                        <tr>
                            <td>${user.getId()}</td>
                            <td>${user.getFirstName()}</td>
                            <td>${user.getLastName()}</td>
                            <td>${user.getEmail()}</td>
                            <td>${user.getPassword()}</td>
                            <td>${user.getOrders().size()}</td>
                            <c:if test="${user.getOrders().size() < 1}">
                                <td><button class="btn btn-primary" disabled>Vis mere</button></td>
                            </c:if>
                            <c:if test="${user.getOrders().size() >= 1}">
                                <td><button class="btn btn-primary" type="submit" name="userId" value="${user.getId()}">Vis mere</button></td>
                            </c:if>
                        </tr>
                    </form>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
</t:pageTemplateAdmin>