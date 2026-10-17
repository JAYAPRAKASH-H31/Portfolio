package com.example.portfolio_backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.portfolio_backend.entity.ContactMessage;
import com.example.portfolio_backend.service.ContactService;

@RestController
@RequestMapping("/api/ContactSave")
public class ContactController {
    @Autowired
    private ContactService contactService;

    @PostMapping
    private ContactMessage saveContact(@RequestBody ContactMessage contactMessage)
    {
        return contactService.addContactMessage(contactMessage);
    }
}
