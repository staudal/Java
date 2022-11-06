package com.example.notesapplication.servlets;

import com.example.notesapplication.model.Note;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@WebServlet(name = "EditNoteServlet", value = "/EditNoteServlet")
public class EditNoteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<UUID, Note> notes = (Map<UUID, Note>) request.getSession().getAttribute("notes");
        UUID currentNoteId = (UUID) request.getSession().getAttribute("currentNoteId");

        String title = request.getParameter("title");
        String comment = request.getParameter("comment");

        notes.get(currentNoteId).setTitle(title);
        notes.get(currentNoteId).setComment(comment);

        request.getSession().setAttribute("notes", notes);
        request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
    }
}
