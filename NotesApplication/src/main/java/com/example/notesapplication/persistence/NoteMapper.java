package com.example.notesapplication.persistence;

import com.example.notesapplication.model.Note;
import com.example.notesapplication.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Stack;

public class NoteMapper {
    DatabaseConnection connection = new DatabaseConnection();

    public Stack<Note> getNotes(User user) {
        String command = "SELECT * FROM notes WHERE username = '" + user.getUsername() + "'";
        Stack<Note> notes = new Stack<>();

        try {
            PreparedStatement statement = connection.connect().prepareStatement(command);
            ResultSet set = statement.executeQuery();
            while (set.next()) {
                notes.add(new Note(set.getInt("id"), set.getString("title"), set.getString("comment"), set.getString("username"), set.getTimestamp("time")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return notes;
    }

    public void addNote(Note note) {
        String command = "INSERT INTO notes (title, comment, username, time) VALUES (?, ?, ?, ?)";

        try {
            PreparedStatement statement = connection.connect().prepareStatement(command);
            statement.setString(1, note.getTitle());
            statement.setString(2, note.getComment());
            statement.setString(3, note.getUsername());
            statement.setTimestamp(4, note.getTime());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
