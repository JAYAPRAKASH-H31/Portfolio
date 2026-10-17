package com.example.portfolio_backend.repository;

import com.example.portfolio_backend.entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProjectRepository extends JpaRepository<Project, Long> {

}