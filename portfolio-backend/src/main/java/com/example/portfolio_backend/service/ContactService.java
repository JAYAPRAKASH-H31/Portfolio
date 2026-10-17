package com.example.portfolio_backend.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.portfolio_backend.entity.ContactMessage;
import com.example.portfolio_backend.repository.ContactRepository;

@Service
public class ContactService {
    @Autowired
    private ContactRepository contactRepository;

    public ContactMessage addContactMessage(ContactMessage contactMessage)
    {
        return contactRepository.save(contactMessage);
    }
}
