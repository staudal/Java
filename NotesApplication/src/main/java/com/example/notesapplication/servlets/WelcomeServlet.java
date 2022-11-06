package com.example.notesapplication.servlets;

import com.example.notesapplication.model.Note;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.*;

@WebServlet(name = "WelcomeServlet", value = "/WelcomeServlet")
public class WelcomeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<UUID, Note> notes = new TreeMap<>();
        Note initialNote = new Note("Your first note", "Here you can type something you need to remember for later. It might be groceries.", new Timestamp(System.currentTimeMillis()));
        notes.put(initialNote.getId(), initialNote);

        request.getSession().setAttribute("title", initialNote.getTitle());
        request.getSession().setAttribute("comment", initialNote.getComment());
        request.getSession().setAttribute("timestamp", initialNote.getTimestamp());

        UUID currentNoteId = initialNote.getId();

        request.getSession().setAttribute("currentNoteId", currentNoteId);
        request.getSession().setAttribute("notes", notes);
        request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
    }
}
