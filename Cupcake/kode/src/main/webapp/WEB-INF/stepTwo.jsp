<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplate>
    <%-- cover start --%>
    <section class="d-flex flex-column bg-dark text-center p-5">
        <small class="text-muted">Step 2 af 3</small>
        <h1 class="text-light m-auto fw-bold mb-1">Vælg topping</h1>
        <p class="text-white-50 mb-0">Fuldend din cupcake med en lækker topping</p>
    </section>
    <%-- cover end --%>
    <%-- product start --%>
    <section class="container-xl p-5">
        <form action="SaveTopping" method="post">
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <div class="col">
                    <div class="card h-100">
                        <img src="https://i.ibb.co/nsqfdqb/chokolade.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Chokolade</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                            <button class="btn btn-primary w-100" type="submit" name="topping" value="Chokolade">Vælg</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <img src="https://i.ibb.co/BwQC5nn/bla-b-r.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Blåbær</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                            <button class="btn btn-primary w-100" type="submit" name="topping" value="Blåbær">Vælg</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <img src="https://i.ibb.co/WzVdTSN/hindb-r.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Hindbær</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                            <button class="btn btn-primary w-100" type="submit" name="topping" value="Hindbær">Vælg</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <img src="https://i.ibb.co/2ZJ367Z/jordb-r.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Jordbær</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                            <button class="btn btn-primary w-100" type="submit" name="topping" value="Jordbær">Vælg</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <img src="https://i.ibb.co/JK8LpwH/appelsin.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Appelsin</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                            <button class="btn btn-primary w-100" type="submit" name="topping" value="Appelsin">Vælg</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <img src="https://i.ibb.co/XpPZVH7/citron.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Citron</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                            <button class="btn btn-primary w-100" type="submit" name="topping" value="Citron">Vælg</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>
    <%-- product end --%>
</t:pageTemplate>