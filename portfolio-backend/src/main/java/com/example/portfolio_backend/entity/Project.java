package com.example.portfolio_backend.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/**
 * Project
 */

// title
// category
// description
// longDescription
// technologies
// tags
// features
// icon
// featured
// githubUrl

@Entity
@Table(name = "pprojects")
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    private String category;

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDemoUrl() {
        return demoUrl;
    }

    public void setDemoUrl(String demoUrl) {
        this.demoUrl = demoUrl;
    }

    private String demoUrl;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(columnDefinition = "TEXT")
    private String longDescription;

    @ElementCollection
    private List<String> tags;

    @Column(columnDefinition = "TEXT")
    private String technologies;

    @ElementCollection
    private List<String> features;

    private String icon;

    private boolean featured;

    private String githubUrl;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLongDescription() {
        return longDescription;
    }

    public void setLongDescription(String longDescription) {
        this.longDescription = longDescription;
    }

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    public String getTechnologies() {
        return technologies;
    }

    public void setTechnologies(String technologies) {
        this.technologies = technologies;
    }

    public List<String> getFeatures() {
        return features;
    }

    public void setFeatures(List<String> features) {
        this.features = features;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public boolean isFeatured() {
        return featured;
    }

    public void setFeatured(boolean featured) {
        this.featured = featured;
    }

    public String getGithubUrl() {
        return githubUrl;
    }

    public void setGithubUrl(String githubUrl) {
        this.githubUrl = githubUrl;
    }

    
    public Project(Long id, String title, String category, String demoUrl, String description, String longDescription,
            List<String> tags, String technologies, List<String> features, String icon, boolean featured,
            String githubUrl) {
        this.id = id;
        this.title = title;
        this.category = category;
        this.demoUrl = demoUrl;
        this.description = description;
        this.longDescription = longDescription;
        this.tags = tags;
        this.technologies = technologies;
        this.features = features;
        this.icon = icon;
        this.featured = featured;
        this.githubUrl = githubUrl;
    }

    public Project() {
    }

}