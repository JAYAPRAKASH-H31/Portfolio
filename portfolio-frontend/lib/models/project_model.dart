import 'package:flutter/material.dart';

class ProjectModel {
  final String title;
  final String category;
  final String description;
  final String longDescription;
  final String technologies;
  final List<String> tags;
  final List<String> features;
  final IconData icon;
  final String? githubUrl;
  final String? demoUrl;
  final bool featured;

  const ProjectModel({
    required this.title,
    this.category = 'Software Project',
    required this.description,
    this.longDescription = '',
    required this.technologies,
    this.tags = const [],
    this.features = const [],
    this.icon = Icons.code_rounded,
    this.githubUrl,
    this.demoUrl,
    this.featured = false,
  });
}