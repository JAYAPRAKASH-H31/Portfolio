package com.example.portfolio_backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.portfolio_backend.entity.ContactMessage;

public interface ContactRepository extends JpaRepository<ContactMessage , Long> {
    
}
