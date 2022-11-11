<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplate>
    <%-- cover start --%>
    <section class="d-flex flex-column bg-dark text-center p-5">
        <small class="text-muted">Step 3 af 3</small>
        <h1 class="text-light m-auto fw-bold mb-1">Din cupcake</h1>
        <p class="text-white-50 mb-0">Bekræft venligst at alt er som det skal være</p>
    </section>
    <%-- cover end --%>
    <%-- product start --%>
    <section class="container-xl p-5">
        <form action="AddToBasket" method="post">
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <div class="col">
                    <div class="card h-100">
                        <div class="card-header text-center fw-bold">Kagebund</div>
                        <img src="https://i.ibb.co/GvjCk0P/login-Background.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">${sessionScope.bottom.getName()}</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <div class="card-header text-center fw-bold">Topping</div>
                        <img src="https://i.ibb.co/GvjCk0P/login-Background.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">${sessionScope.topping.getName()}</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                        </div>
                    </div>
                </div>
                <div class="col d-flex justify-content-center align-items-center flex-column">
                    <button class="btn btn-primary" type="submit">Læg i kurv</button>
                </div>
            </div>
        </form>
    </section>
    <%-- product end --%>
</t:pageTemplate>