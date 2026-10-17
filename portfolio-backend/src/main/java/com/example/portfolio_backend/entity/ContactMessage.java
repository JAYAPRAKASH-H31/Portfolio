package com.example.portfolio_backend.entity;
import jakarta.persistence.Id;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;

/**
 * ContactMessage
 */
@Entity
@Table(name = "ViwerDetails")
public class ContactMessage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty
    private String name;
    private String email;
    private String subject;
    private String message;
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public ContactMessage(Long id, @NotEmpty String name, String email, String subject, String message) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.message = message;
    }
    public ContactMessage() {
    }
    


}