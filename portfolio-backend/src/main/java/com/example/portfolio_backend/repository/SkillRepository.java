package com.example.portfolio_backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.portfolio_backend.entity.Skill_data;

public interface SkillRepository extends JpaRepository<Skill_data, Long> {

}