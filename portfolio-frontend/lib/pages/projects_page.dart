import 'package:flutter/material.dart';

import 'package:portfolio_01/models/project_model.dart';
import 'package:portfolio_01/services/project_api_service.dart';
import 'package:portfolio_01/utils/app_colors.dart';
import 'package:portfolio_01/utils/responsive.dart';
import 'package:portfolio_01/widgets/navbar.dart';
import 'package:portfolio_01/widgets/project_card.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  String selectedFilter = 'All';

  final List<String> filters = ['All', 'Mobile', 'Backend'];

  final ProjectApiService projectApiService = ProjectApiService();

  List<ProjectModel> projects = [];

  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadProjects();
  }

  Future<void> loadProjects() async {
    try {
      final fetchedProjects = await projectApiService.getProjects();

      if (!mounted) return;

      setState(() {
        projects = fetchedProjects;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  List<ProjectModel> get filteredProjects {
    if (selectedFilter == 'All') {
      return projects;
    }

    if (selectedFilter == 'Mobile') {
      return projects
          .where(
            (p) =>
                p.category.toLowerCase().contains('mobile') ||
                p.technologies.toLowerCase().contains('flutter'),
          )
          .toList();
    }

    if (selectedFilter == 'Backend') {
      return projects
          .where(
            (p) =>
                p.category.toLowerCase().contains('backend') ||
                p.technologies.toLowerCase().contains('spring'),
          )
          .toList();
    }

    return projects;
  }

  @override
  Widget build(BuildContext context) {
    final double padding = Responsive.horizontalPadding(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(activeRoute: 'Projects'),

            const SizedBox(height: 40),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  children: [
                    // Filter Chips
                    Wrap(
                      spacing: 12,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: filters.map((filter) {
                        final bool isSelected = selectedFilter == filter;

                        return ChoiceChip(
                          label: Text(
                            filter == 'All' ? 'All Projects' : filter,
                          ),
                          selected: isSelected,
                          selectedColor: AppColors.primary,
                          backgroundColor: Colors.white,
                          labelStyle: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                          side: BorderSide(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.borderBlue,
                            width: 1,
                          ),
                          onSelected: (val) {
                            if (val) {
                              setState(() {
                                selectedFilter = filter;
                              });
                            }
                          },
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 36),

                    // Projects
                    if (isLoading)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 100),
                        child: CircularProgressIndicator(),
                      )
                    else if (errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 80),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 50,
                              color: Colors.redAccent,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Unable to load projects',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              errorMessage!,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                  errorMessage = null;
                                });

                                loadProjects();
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      )
                    else if (filteredProjects.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 80),
                        child: Text(
                          'No projects found.',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      )
                    else
                      LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount = constraints.maxWidth < 700
                              ? 1
                              : (constraints.maxWidth < 1000 ? 2 : 3);

                          return GridView.builder(
                            shrinkWrap: true,
                            physics:
                                const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 24,
                              mainAxisSpacing: 24,
                              mainAxisExtent: 350,
                            ),
                            itemCount: filteredProjects.length,
                            itemBuilder: (context, index) {
                              return ProjectCard(
                                project: filteredProjects[index],
                              );
                            },
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 80),

            // Footer
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: const Center(
                child: Text(
                  '© 2026 Jayaprakash H • Built with Flutter',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}