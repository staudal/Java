<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplate>
    <%-- cover start --%>
    <section class="d-flex flex-column bg-dark text-center p-5">
        <small class="text-muted">Step 1 af 3</small>
        <h1 class="text-light m-auto fw-bold mb-1">Vælg kagebund</h1>
        <p class="text-white-50 mb-0">Start med at vælge en bund til din cupcake</p>
    </section>
    <%-- cover end --%>
    <%-- product start --%>
    <section class="container-xl p-5">
        <form action="SaveBottom" method="post">
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <div class="col">
                    <div class="card h-100">
                        <img src="https://i.ibb.co/nsqfdqb/chokolade.jpg" class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title">Chokolade</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                            <button class="btn btn-primary w-100" type="submit" name="bottom" value="Chokolade">Vælg</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <img src="https://i.ibb.co/hCPZ33z/vanilje.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Vanilje</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                            <button class="btn btn-primary w-100" type="submit" name="bottom" value="Vanilje">Vælg</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <img src="https://i.ibb.co/qB2bjwG/muskatn-d.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Muskatnød</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                            <button class="btn btn-primary w-100" type="submit" name="bottom" value="Muskatnød">Vælg</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <img src="https://i.ibb.co/HBdGK2f/pistacie.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Pistacie</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                            <button class="btn btn-primary w-100" type="submit" name="bottom" value="Pistacie">Vælg</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <img src="https://i.ibb.co/5r8kPsN/mandel.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Mandel</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                            <button class="btn btn-primary w-100" type="submit" name="bottom" value="Mandel">Vælg</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>
    <%-- product end --%>
</t:pageTemplate>