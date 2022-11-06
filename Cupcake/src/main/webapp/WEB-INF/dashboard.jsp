<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jakobstaudal
  Date: 02/11/2022
  Time: 20.36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="m-3 d-flex flex-column">
    <img src="https://i.ibb.co/dKgXFQ0/hero.png" alt="Hero image of cupcakes">
    <div class="mt-3 d-flex justify-content-between bg-light p-3 border">
        <div class="d-flex align-items-center gap-4">
            <form method="post" class="mb-0">
                <button class="btn" formaction="Redirecter" name="page" value="dashboard">Bestil</button>
            </form>
        </div>
        <div>
            <p class="mb-0 d-inline me-4">Velkommen, ${sessionScope.firstName}!</p>
            <form class="d-inline-block mb-0" method="post">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">Konto</button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="#">Personoplysninger</a></li>
                        <li><a class="dropdown-item" href="#">Adgangskode</a></li>
                        <li><button class="dropdown-item" formaction="Logout">Log ud</button></li>
                    </ul>
                </div>
            </form>
            <button type="button" class="btn btn-primary position-relative" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                Indkøbskurv
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                ${sessionScope.user.getBasket().getSizeOfBasket()}
                </span>
            </button>
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Indkøbskurv</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form method="post" class="mb-0">
                            <div class="modal-body">
                                <c:forEach var="item" items="${sessionScope.user.getBasket().getCupcakes()}">
                                    <div class="card mb-3">
                                        <div class="card-header text-center">
                                            <div><strong>Cupcake</strong></div>
                                        </div>
                                        <div class="card-body d-flex justify-content-between align-items-center">
                                            <p class="mb-0 d-inline"><strong>Topping: </strong>${item.value.getToppingName()}</p>
                                            <p class="mb-0 d-inline"><strong>Bund: </strong>${item.value.getBottomName()}</p>
                                        </div>
                                        <div class="card-footer d-flex justify-content-between align-items-center">
                                            <p class="mb-0"><strong>Pris: </strong>${item.value.getCupcakePrice()} DKK</p>
                                            <button class="btn btn-danger badge" formaction="RemoveOrder" type="submit" name="cupcake" value="${item.key}">Fjern</button>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="modal-footer d-flex justify-content-between">
                                <span><strong>Total: </strong>${sessionScope.user.getBasket().getTotalPrice()} DKK</span>
                                <div>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Luk</button>
                                    <button type="button" class="btn btn-primary">Gå til betaling</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mt-3 pt-4 pb-4 bg-light d-flex flex-column border">
        <h2 class="m-auto">Bestil cupcake</h2>
        <form class="row g-3 align-items-center mt-3 m-auto mb-0" method="post" style="width: 800px">
            <div class="col-md-4">
                <label for="bottom" class="form-label">Kagebund</label>
                <select class="form-select" id="bottom" required name="bottom">
                    <option selected disabled value="">Vælg...</option>
                    <option value="chokolade">Chokolade</option>
                    <option value="vanilje">Vanilje</option>
                    <option value="muskatnød">Muskatnød</option>
                    <option value="pistacie">Pistacie</option>
                    <option value="mandel">Mandel</option>
                </select>
            </div>
            <div class="col-md-4">
                <label for="topping" class="form-label">Topping</label>
                <select class="form-select" id="topping" required name="topping">
                    <option selected disabled value="">Vælg...</option>
                    <option value="chokolade">Chokolade</option>
                    <option value="blåbær">Blåbær</option>
                    <option value="hindbær">Hindbær</option>
                    <option value="jordbær">Jordbær</option>
                    <option value="rosin">Rosin</option>
                    <option value="appelsin">Appelsin</option>
                    <option value="citron">Citron</option>
                    <option value="blå ost">Blå ost</option>
                </select>
            </div>
            <div class="col-md-4">
                <label for="antal" class="form-label">Antal</label>
                <select class="form-select" id="antal" required name="amount">
                    <option selected disabled value="">Vælg...</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
            <button class="btn btn-primary" type="submit" formaction="Order">Læg i kurv</button>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
