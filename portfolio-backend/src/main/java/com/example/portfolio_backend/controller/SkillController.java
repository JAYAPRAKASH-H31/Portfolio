package com.example.portfolio_backend.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.portfolio_backend.entity.Skill_data;
import com.example.portfolio_backend.service.SkillService;

@RestController
@RequestMapping("/api/skills")
public class SkillController {
    
    private SkillService skillService;

    public SkillController(SkillService skillService) {
        this.skillService = skillService;
    }

    @GetMapping
    public List<Skill_data> findAllSkills()
    {
        return skillService.getAllSkills();
    }

    @PostMapping
    public Skill_data putSkills(@RequestBody Skill_data skill_data)
    {
        return skillService.addSkill(skill_data);
    }

}
