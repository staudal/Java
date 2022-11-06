package com.example.notesapplication.model;

import java.sql.Timestamp;
import java.util.UUID;

public class Note {
    private UUID id;
    private String title;
    private String comment;
    private Timestamp timestamp;

    public Note(String title, String comment, Timestamp timestamp) {
        this.id = UUID.randomUUID();
        this.title = title;
        this.comment = comment;
        this.timestamp = timestamp;
    }

    public UUID getId() {
        return id;
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

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
}
