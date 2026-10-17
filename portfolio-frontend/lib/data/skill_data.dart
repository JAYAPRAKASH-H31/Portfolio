import 'package:flutter/material.dart';
import '../models/skill_model.dart';

const List<SkillModel> skills = [
  // Mobile Development
  SkillModel(
    name: 'Flutter',
    category: 'Mobile',
    icon: Icons.phone_android_rounded,
  ),
  SkillModel(
    name: 'Dart',
    category: 'Mobile',
    icon: Icons.code_rounded,
  ),
  SkillModel(
    name: 'State Management',
    category: 'Mobile',
    icon: Icons.account_tree_rounded,
  ),

  // Backend Development
  SkillModel(
    name: 'Java',
    category: 'Backend',
    icon: Icons.coffee_rounded,
  ),
  SkillModel(
    name: 'Spring Boot',
    category: 'Backend',
    icon: Icons.dns_rounded,
  ),
  SkillModel(
    name: 'RESTful APIs',
    category: 'Backend',
    icon: Icons.cloud_sync_rounded,
  ),
  SkillModel(
    name: 'Spring Security & JWT',
    category: 'Backend',
    icon: Icons.security_rounded,
  ),

  // Databases
  SkillModel(
    name: 'MySQL',
    category: 'Database',
    icon: Icons.storage_rounded,
  ),
  SkillModel(
    name: 'Hibernate / JPA',
    category: 'Database',
    icon: Icons.dataset_rounded,
  ),

  // Tools & Workflow
  SkillModel(
    name: 'Git & GitHub',
    category: 'Tools',
    icon: Icons.merge_type_rounded,
  ),
  SkillModel(
    name: 'Postman & API Testing',
    category: 'Tools',
    icon: Icons.send_and_archive_rounded,
  ),
  SkillModel(
    name: 'Data Structures & OOP',
    category: 'Core',
    icon: Icons.hub_rounded,
  ),
];