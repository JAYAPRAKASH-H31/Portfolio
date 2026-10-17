import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/project_model.dart';

class ProjectApiService {
  static const String baseUrl = 'http://localhost:8080/api/projects';

  Future<List<ProjectModel>> getProjects() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((project) {
        return ProjectModel(
          title: project['title'],
          category: project['category'] ?? 'Software Project',
          description: project['description'],
          longDescription: project['longDescription'] ?? '',
          technologies: project['technologies'] ?? '',
          tags: List<String>.from(project['tags'] ?? []),
          features: List<String>.from(project['features'] ?? []),
          githubUrl: project['githubUrl'],
          demoUrl: project['demoUrl'],
          featured: project['featured'] ?? false,
        );
      }).toList();
    } else {
      throw Exception('Failed to load projects: ${response.statusCode}');
    }
  }
}
