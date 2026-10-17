import 'package:flutter/material.dart';

class SkillModel {
  final String name;
  final String category;
  final IconData icon;

  const SkillModel({
    required this.name,
    required this.category,
    this.icon = Icons.code_rounded,
  });
}