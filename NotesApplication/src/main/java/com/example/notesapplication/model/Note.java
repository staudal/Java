package com.example.notesapplication.model;

import java.sql.Timestamp;

public class Note {
    private Integer id;
    private String title;
    private String comment;
    private String username;
    private Timestamp time;

    public String highlightClass() {
        return "border-primary";
    }

    public Note(String title, String comment, String username, Timestamp time) {
        this.title = title;
        this.comment = comment;
        this.username = username;
        this.time = time;
    }

    public Note(Integer id, String title, String comment, String username, Timestamp time) {
        this.id = id;
        this.title = title;
        this.comment = comment;
        this.username = username;
        this.time = time;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
