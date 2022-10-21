package com.example.notesapplication.servlets;

import com.example.notesapplication.error.ErrorHandler;
import com.example.notesapplication.model.Note;
import com.example.notesapplication.model.User;
import com.example.notesapplication.persistence.NoteMapper;
import com.example.notesapplication.persistence.UserMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SignupServlet", value = "/SignupServlet")
public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Initializing objects
        UserMapper userMapper = new UserMapper();
        NoteMapper noteMapper = new NoteMapper();
        ErrorHandler error = new ErrorHandler();
        User user = new User(request.getParameter("username").toLowerCase(), request.getParameter("password").toLowerCase());

        if (user.getUsername().contains(" ")) {
            request.setAttribute("usernameErrorClass", error.errorClass());
            request.setAttribute("errorMessage", error.usernameContainsWhitespace());
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else if (user.getPassword().contains(" ")) {
            request.setAttribute("passwordErrorClass", error.errorClass());
            request.setAttribute("errorMessage", error.passwordContainsWhitespace());
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else if (!user.getUsername().matches("^[a-zA-Z]*$")) {
            request.setAttribute("usernameErrorClass", error.errorClass());
            request.setAttribute("errorMessage", error.usernameContainsSpecialCharacters());
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else if (userMapper.usernameAlreadyUsed(user.getUsername())) {
            request.setAttribute("usernameErrorClass", error.errorClass());
            request.setAttribute("errorMessage", error.usernameAlreadyExists());
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            // User is created and stored in session
            userMapper.add(user);
            request.getSession().setAttribute("user", user);

            // Note list is created and stored in session
            List<Note> notes = new ArrayList<>();
            request.getSession().setAttribute("notes", notes);

            request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
        }
    }
}