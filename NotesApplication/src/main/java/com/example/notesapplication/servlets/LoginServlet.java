package com.example.notesapplication.servlets;

import com.example.notesapplication.error.ErrorHandler;
import com.example.notesapplication.model.Note;
import com.example.notesapplication.model.User;
import com.example.notesapplication.persistence.NoteMapper;
import com.example.notesapplication.persistence.UserMapper;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserMapper userMapper = new UserMapper();
        NoteMapper noteMapper = new NoteMapper();
        ErrorHandler error = new ErrorHandler();
        User user = new User(request.getParameter("username").toLowerCase(), request.getParameter("password").toLowerCase());

        if (userMapper.isVerified(user)) {
            // User is stored in the session
            request.getSession().setAttribute("user", user);

            // Notes list is stored in the session
            Stack<Note> notes = noteMapper.getNotes(user);
            request.getSession().setAttribute("notes", notes);
            request.getSession().setAttribute("noteTitle", notes.get(0).getTitle());
            request.getSession().setAttribute("noteTime", notes.get(0).getTime());
            request.getSession().setAttribute("noteContent", notes.get(0).getComment());

            request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
        } else if (!userMapper.usernameAlreadyUsed(user.getUsername())) {
            request.setAttribute("usernameErrorClass", error.errorClass());
            request.setAttribute("errorMessage", error.usernameDoesntExist());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            request.setAttribute("passwordErrorClass", error.errorClass());
            request.setAttribute("errorMessage", error.passwordIncorrect());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
