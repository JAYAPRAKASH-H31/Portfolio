import 'package:flutter/material.dart';
import '../models/project_model.dart';

const List<ProjectModel> projects = [
  ProjectModel(
    title: 'DevMirror',
    category: 'Mobile & AI Application',
    description:
        'An AI-based interview simulation platform for placement preparation with real-time feedback.',
    longDescription:
        'DevMirror helps students and job seekers prepare for technical and HR interviews with AI-generated questions, voice/video simulation, speech-to-text analysis, and real-time performance evaluation.',
    technologies: 'Flutter, Dart, AI APIs, Firebase, Clean Architecture',
    tags: ['Flutter', 'AI / ML API', 'Firebase', 'State Management'],
    features: [
      'Interactive voice & text interview simulations',
      'Instant AI-driven feedback on technical answers',
      'Performance analytics and scoring dashboards',
      'Personalized question generation by role and experience',
    ],
    icon: Icons.psychology_rounded,
    featured: true,
    githubUrl: 'https://github.com/jayaprakash-h/devmirror',
  ),
  ProjectModel(
    title: 'Expense Tracker',
    category: 'Mobile Application',
    description:
        'A clean mobile application for managing, categorizing, and visualizing personal expenses.',
    longDescription:
        'A comprehensive personal finance application built with Flutter featuring intuitive budget tracking, category breakdowns, visual analytics charts, and local data persistence.',
    technologies: 'Flutter, Dart, Provider, SQLite, FlChart',
    tags: ['Flutter', 'Provider', 'SQLite', 'Charts & Analytics'],
    features: [
      'Daily, weekly, and monthly expense categorization',
      'Interactive spending charts and budget alerts',
      'Offline-first architecture with local SQLite storage',
      'Exportable financial summaries and receipt tracking',
    ],
    icon: Icons.account_balance_wallet_rounded,
    featured: true,
    githubUrl: 'https://github.com/jayaprakash-h/expense-tracker',
  ),
  ProjectModel(
    title: 'E-Commerce Backend',
    category: 'Backend System & REST API',
    description:
        'A robust and scalable REST API backend for e-commerce with secure auth and payment integration.',
    longDescription:
        'An enterprise-grade backend built with Java and Spring Boot providing secure JWT authentication, role-based access control, catalog management, shopping cart, order processing, and MySQL database integration.',
    technologies: 'Java, Spring Boot, MySQL, Spring Security, JWT, JPA/Hibernate',
    tags: ['Java', 'Spring Boot', 'MySQL', 'JWT Auth', 'REST APIs'],
    features: [
      'JWT Authentication & Role-Based Authorization (Admin/Customer)',
      'Product catalog, inventory management, and search filters',
      'Transactional order placement and cart processing',
      'Structured database schema with Hibernate JPA & MySQL',
    ],
    icon: Icons.storefront_rounded,
    featured: true,
    githubUrl: 'https://github.com/jayaprakash-h/ecommerce-backend',
  ),
  ProjectModel(
    title: 'TaskFlow Manager',
    category: 'Full Stack & Mobile',
    description:
        'A collaborative task and sprint management tool with real-time sync and status updates.',
    longDescription:
        'A productivity app designed for student teams and agile developers to organize tasks, assign team members, track milestones, and maintain productivity metrics.',
    technologies: 'Flutter, Spring Boot, MySQL, WebSockets',
    tags: ['Flutter', 'Spring Boot', 'MySQL', 'REST API'],
    features: [
      'Kanban board and list view for project tasks',
      'Push notifications and deadline reminders',
      'REST API backend with secure Spring Boot endpoints',
    ],
    icon: Icons.checklist_rounded,
    featured: false,
    githubUrl: 'https://github.com/jayaprakash-h/taskflow-manager',
  ),
];