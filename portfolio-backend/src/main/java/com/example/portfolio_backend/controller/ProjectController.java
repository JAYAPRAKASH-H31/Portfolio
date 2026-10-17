package com.example.portfolio_backend.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.portfolio_backend.entity.Project;
import com.example.portfolio_backend.service.ProjectService;

@RestController
@RequestMapping("/api/projects")
public class ProjectController {
    private ProjectService projectService;

    public ProjectController(ProjectService projectService) {
        this.projectService = projectService;
    }

    @GetMapping
    public List<Project> findAllProjects()
    {
        return projectService.getAllProjects();
    }

    @PostMapping
    public Project putProjects(@RequestBody Project project)
    {
        return projectService.addProject(project);
    }
}
