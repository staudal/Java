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
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Bestil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
            </ul>
            <form class="d-flex mb-0" action="LoadBasket" method="post">
                <button type="submit" class="btn btn-primary">Indkøbskurv</button>
            </form>
        </div>
    </div>
</nav>
<%-- navigation end --%>
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
                    <img src="https://i.ibb.co/GvjCk0P/login-Background.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Chokolade</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                        <button class="btn btn-primary w-100" type="submit" name="bottom" value="Chokolade">Vælg</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img src="https://i.ibb.co/GvjCk0P/login-Background.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Vanilje</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                        <button class="btn btn-primary w-100" type="submit" name="bottom" value="Vanilje">Vælg</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img src="https://i.ibb.co/GvjCk0P/login-Background.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Muskatnød</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                        <button class="btn btn-primary w-100" type="submit" name="bottom" value="Muskatnød">Vælg</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img src="https://i.ibb.co/GvjCk0P/login-Background.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Pistacie</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis sollicitudin mi, a dictum lectus malesuada eget.</p>
                        <button class="btn btn-primary w-100" type="submit" name="bottom" value="Pistacie">Vælg</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img src="https://i.ibb.co/GvjCk0P/login-Background.jpg" class="card-img-top" alt="...">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
