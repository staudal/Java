package com.example.notesapplication.servlets;

import com.example.notesapplication.model.Note;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@WebServlet(name = "DeleteNoteServlet", value = "/DeleteNoteServlet")
public class DeleteNoteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<UUID, Note> notes = (Map<UUID, Note>) request.getSession().getAttribute("notes");
        UUID currentNoteId = (UUID) request.getSession().getAttribute("currentNoteId");

        notes.remove(currentNoteId);

        request.getSession().setAttribute("title", "");
        request.getSession().setAttribute("comment", "");
        request.getSession().setAttribute("timestamp", "");

        request.getSession().setAttribute("notes", notes);
        request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
    }
}
