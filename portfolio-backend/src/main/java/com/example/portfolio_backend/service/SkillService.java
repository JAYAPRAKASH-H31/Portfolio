package com.example.portfolio_backend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.portfolio_backend.entity.Skill_data;
import com.example.portfolio_backend.repository.SkillRepository;

@Service
public class SkillService {
    @Autowired
    private SkillRepository skillRepository;

    public List<Skill_data> getAllSkills()
    {
        return skillRepository.findAll();
    }

    public Skill_data addSkill(Skill_data skill_data)
    {
        return skillRepository.save(skill_data);
    }
}
