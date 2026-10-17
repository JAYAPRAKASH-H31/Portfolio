package com.example.portfolio_backend.service;

import com.example.portfolio_backend.entity.Project;
import com.example.portfolio_backend.repository.ProjectRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectService {
     @Autowired
    private ProjectRepository projectRepository;

    public List<Project> getAllProjects()
    {
        return projectRepository.findAll();
    }

    public Project addProject(Project project)
    {
        return projectRepository.save(project);
    }
}
