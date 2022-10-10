package com.example.bankapplication.error;

public class ErrorHandler {
    public String usernameDoesNotExist() {
        return "<div id=\"validationServer03Feedback\" class=\"invalid-feedback\">\n" +
                "      There are no accounts with that username.\n" +
                "    </div>";
    }

    public String usernameAlreadyExists() {
        return "<div id=\"validationServer03Feedback\" class=\"invalid-feedback\">\n" +
                "      There is already an account with that username.\n" +
                "    </div>";
    }

    public String wrongPassword() {
        return "<div id=\"validationServer03Feedback\" class=\"invalid-feedback\">\n" +
                "      Oops, wrong password. Try again.\n" +
                "    </div>";
    }

    public String errorClass() {
        return "is-invalid";
    }

    public String passwordTooShort() {
        return "<div id=\"validationServer03Feedback\" class=\"invalid-feedback\">\n" +
                "      Your password must be more than 4 characters.\n" +
                "    </div>";
    }
}
