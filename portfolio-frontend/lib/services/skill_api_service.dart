import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/skill_model.dart';

class SkillApiService {
  static const String baseUrl = 'http://localhost:8080/api/skills';

  Future<List<SkillModel>> getSkills() async {
    final response = await http.get(
      Uri.parse(baseUrl),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((skill) {
        return SkillModel(
          name: skill['name'] ?? '',
          category: skill['category'] ?? '',
          icon: _getIcon(skill['icon']),
        );
      }).toList();
    } else {
      throw Exception(
        'Failed to load skills: ${response.statusCode}',
      );
    }
  }

  IconData _getIcon(String? icon) {
    switch (icon) {
      case 'phone_android':
        return Icons.phone_android_rounded;

      case 'storage':
        return Icons.storage_rounded;

      case 'database':
        return Icons.storage_rounded;

      case 'code':
        return Icons.code_rounded;

      case 'language':
        return Icons.language_rounded;

      case 'build':
        return Icons.build_rounded;

      case 'api':
        return Icons.api_rounded;

      case 'design':
        return Icons.design_services_rounded;

      default:
        return Icons.code_rounded;
    }
  }
}