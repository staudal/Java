package com.example.notesapplication.servlets;

import com.example.notesapplication.model.Note;
import com.example.notesapplication.model.User;
import com.example.notesapplication.persistence.NoteMapper;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Stack;

@WebServlet(name = "CreateNoteServlet", value = "/CreateNoteServlet")
public class CreateNoteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NoteMapper noteMapper = new NoteMapper();
        User user = (User) request.getSession().getAttribute("user");
        Stack<Note> notes = noteMapper.getNotes(user);

        String title = request.getParameter("title");
        String comment = request.getParameter("comment");

        Note newNote = new Note(title, comment, user.getUsername(), new Timestamp(System.currentTimeMillis()));
        notes.push(newNote);

        request.getSession().setAttribute("notes", noteMapper.getNotes(user));
        request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
    }
}
