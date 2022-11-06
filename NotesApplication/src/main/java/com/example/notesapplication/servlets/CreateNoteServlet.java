package com.example.notesapplication.servlets;

import com.example.notesapplication.model.Note;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Deque;
import java.util.Map;
import java.util.UUID;

@WebServlet(name = "CreateNoteServlet", value = "/CreateNoteServlet")
public class CreateNoteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Getting notes list from session
        Map<UUID, Note> notes = (Map<UUID, Note>) request.getSession().getAttribute("notes");

        // Getting parameters for new note from form
        String title = request.getParameter("title");
        String comment = request.getParameter("comment");

        // Creating new note
        Note note = new Note(title, comment, new Timestamp(System.currentTimeMillis()));
        notes.put(note.getId(), note);

        // Setting new parameters in session scope
        request.getSession().setAttribute("title", note.getTitle());
        request.getSession().setAttribute("comment", note.getComment());
        request.getSession().setAttribute("timestamp", note.getTimestamp());

        // Return user to dashboard
        request.getSession().setAttribute("notes", notes);
        request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
    }
}
