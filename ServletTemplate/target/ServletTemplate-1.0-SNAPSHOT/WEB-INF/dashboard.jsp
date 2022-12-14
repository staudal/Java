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
            <span>
                <p class="mb-0 me-3 d-inline">${sessionScope.user.getEmail()}</p>
                <form class="d-inline" method="post" action="Logout">
                    <button class="btn btn-secondary">Log ud</button>
                </form>
                <button type="button" class="btn btn-primary position-relative" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    Inbox
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                    ${sessionScope.user.getBasket().getSizeOfBasket()}
                    </span>
                </button>
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">Indk??bskurv</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form method="post" class="mb-0">
                                <div class="modal-body">
                                    <c:forEach var="item" items="${sessionScope.user.getBasket().getCupcakes()}">
                                        <div class="card mb-3">
                                            <div class="card-header d-flex justify-content-between align-items-center">
                                                <div><p class="mb-0">1x Cupcake</p></div>
                                                <button class="btn btn-danger badge" formaction="RemoveOrder" type="submit" name="cupcake" value="${item.key}">Delete</button>
                                            </div>
                                            <div class="card-body d-flex justify-content-between align-items-center">
                                                <p class="mb-0 d-inline"><strong>Topping: </strong>${item.value.getToppingName()}</p>
                                                <p class="mb-0 d-inline"><strong>Bund: </strong>${item.value.getBottomName()}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="modal-footer d-flex justify-content-between">
                                    <span><strong>Total: </strong>${sessionScope.user.getBasket().getTotalPrice()} DKK</span>
                                    <div>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Understood</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </span>
        </div>
    </div>
    <div class="mt-3 pt-4 pb-4 bg-light d-flex flex-column border">
        <h2 class="m-auto">Bestil cupcake</h2>
        <form class="row g-3 align-items-center mt-3 m-auto mb-0" method="post" style="width: 800px">
            <div class="col-md-4">
                <label for="bottom" class="form-label">Kagebund</label>
                <select class="form-select" id="bottom" required name="bottom">
                    <option selected disabled value="">V??lg...</option>
                    <option value="chokolade">Chokolade</option>
                    <option value="vanilje">Vanilje</option>
                    <option value="muskatn??d">Muskatn??d</option>
                    <option value="pistacie">Pistacie</option>
                    <option value="mandel">Mandel</option>
                </select>
            </div>
            <div class="col-md-4">
                <label for="topping" class="form-label">Topping</label>
                <select class="form-select" id="topping" required name="topping">
                    <option selected disabled value="">V??lg...</option>
                    <option value="chokolade">Chokolade</option>
                    <option value="bl??b??r">Bl??b??r</option>
                    <option value="hindb??r">Hindb??r</option>
                    <option value="jordb??r">Jordb??r</option>
                    <option value="rosin">Rosin</option>
                    <option value="appelsin">Appelsin</option>
                    <option value="citron">Citron</option>
                    <option value="bl?? ost">Bl?? ost</option>
                </select>
            </div>
            <div class="col-md-4">
                <label for="antal" class="form-label">Antal</label>
                <select class="form-select" id="antal" required name="amount">
                    <option selected disabled value="">V??lg...</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
            <button class="btn btn-primary" type="submit" formaction="Order">L??g i kurv</button>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
