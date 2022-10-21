package com.example.notesapplication.error;

public class ErrorHandler {

    public String errorClass() {
        return "is-invalid";
    }

    public String usernameAlreadyExists() {
        return "That username is taken. Try another.";
    }

    public String usernameDoesntExist() {
        return "There are no accounts with that username. Try again.";
    }

    public String passwordIncorrect() {
        return "Password seems strange, don't you think? Try again.";
    }

    public String usernameContainsWhitespace() {
        return "The username can't contain whitespaces. Try again.";
    }

    public String usernameContainsSpecialCharacters() {
        return "The username can't contain special characters. Try again.";
    }

    public String passwordContainsWhitespace() {
        return "The password can't contain whitespaces. Try again.";
    }
}
