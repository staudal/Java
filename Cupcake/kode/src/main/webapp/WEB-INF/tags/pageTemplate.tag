<%@tag description="Simple PageTemplate Tag" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<%-- navigation start --%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-xl">
        <form class="mb-0" action="NavigateToHomepage" method="post">
            <button class="btn navbar-brand" type="submit">Olsker Cupcakes</button>
        </form>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse d-flex justify-content-between align-items-center" id="navbarSupportedContent">
            <form class="mb-0" method="post">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <button class="nav-link btn" formaction="LoadCupcakeMaker">Shop</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link btn" formaction="LoadUserOrders">Ordre</button>
                    </li>
                </ul>
            </form>
            <div class="d-flex gap-2">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        Konto
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <form action="LoadAccount" method="post" class="mb-0">
                            <li><button class="dropdown-item" type="submit" name="setting" value="account">Min konto</button></li>
                            <li><button class="dropdown-item" type="submit" name="setting" value="logout">Log ud</button></li>
                        </form>
                    </ul>
                </div>
                <form class="d-flex mb-0" action="LoadBasket" method="post">
                    <button type="submit" class="btn btn-primary">Indkøbskurv</button>
                </form>
            </div>
        </div>
    </div>
</nav>
<%-- navigation end --%>
<jsp:doBody/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>