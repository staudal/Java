package com.example.notesapplication.servlets;

import com.example.notesapplication.model.Note;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

@WebServlet(name = "ChangeNoteServlet", value = "/ChangeNoteServlet")
public class ChangeNoteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieving notes from session scope
        Map<UUID, Note> notes = (Map<UUID, Note>) request.getSession().getAttribute("notes");

        // Retrieving note id from request scope
        UUID noteId = UUID.fromString(request.getParameter("noteId"));

        // Setting current note in session scope
        UUID currentNoteId = noteId;

        // Changing current note parameters in session scope
        request.getSession().setAttribute("title", notes.get(noteId).getTitle());
        request.getSession().setAttribute("comment", notes.get(noteId).getComment());
        request.getSession().setAttribute("timestamp", notes.get(noteId).getTimestamp());

        request.getSession().setAttribute("currentNoteId", currentNoteId);
        request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
    }
}
