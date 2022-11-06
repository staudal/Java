<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Notes App</title>
</head>
<body>
<div class="container-fluid vh-100">
    <div class="row row-space h-100">
        <div class="col-3 bg-light border-end p-3 overflow-scroll vh-100">
            <form action="CreateNoteServlet" method="post">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    New note
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form action="CreateNoteServlet" method="post">
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <input type="text" class="form-control" placeholder="Title" name="title">
                                    </div>
                                    <div class="mb-3">
                                        <textarea class="form-control" rows="3" placeholder="Comment" name="comment"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </form>
            <c:forEach var="note" items="${sessionScope.notes}">
                <form method="post">
                    <button class="card mt-3 text-start w-100" formaction="ChangeNoteServlet" name="noteId" value="${note.value.getId()}">
                        <div class="card-body">
                            <h5 class="card-title">${note.value.getTitle()}</h5>
                            <p class="card-text">${note.value.getComment()}</p>
                            <p class="card-text"><small class="text-muted">${note.value.getTimestamp()}</small></p>
                        </div>
                    </button>
                </form>
            </c:forEach>
        </div>
        <div class="col-9 p-0 position-relative">
            <div class="bg-light w-100 p-5 border-bottom">
                <h1>${sessionScope.title}</h1>
                <p class="m-0">${sessionScope.timestamp}</p>
            </div>
            <div class="w-100 p-5">
                <p>${sessionScope.comment}</p>
            </div>
            <form class="position-absolute bottom-0 start-50 translate-middle-x mb-3" method="post">
                <button class="btn btn-danger" formaction="DeleteNoteServlet" type="submit">Delete note</button>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>