import 'package:flutter/material.dart';

import 'package:portfolio_01/models/skill_model.dart';
import 'package:portfolio_01/services/skill_api_service.dart';
import 'package:portfolio_01/utils/app_colors.dart';
import 'package:portfolio_01/utils/responsive.dart';
import 'package:portfolio_01/widgets/navbar.dart';
import 'package:portfolio_01/widgets/section_title.dart';
import 'package:portfolio_01/widgets/skill_card.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  String selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'Mobile',
    'Backend',
    'Database',
    'Tools',
  ];

  final SkillApiService skillApiService = SkillApiService();

  List<SkillModel> skills = [];

  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadSkills();
  }

  Future<void> loadSkills() async {
    try {
      final fetchedSkills = await skillApiService.getSkills();

      if (!mounted) return;

      setState(() {
        skills = fetchedSkills;
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

  List<SkillModel> get filteredSkills {
    if (selectedCategory == 'All') {
      return skills;
    }

    return skills
        .where(
          (s) =>
              s.category.toLowerCase() ==
              selectedCategory.toLowerCase(),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final double padding = Responsive.horizontalPadding(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(activeRoute: 'Skills'),

            const SizedBox(height: 40),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  children: [
                    const SectionTitle(
                      badge: 'Skill Matrix',
                      title: 'Technical Expertise',
                      subtitle:
                          'A categorized overview of programming languages, frameworks, databases, and developer tooling I use.',
                    ),

                    const SizedBox(height: 32),

                    // Filter Chips
                    Wrap(
                      spacing: 12,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: categories.map((cat) {
                        final bool isSelected =
                            selectedCategory == cat;

                        return ChoiceChip(
                          label: Text(
                            cat == 'All' ? 'All Skills' : cat,
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
                                selectedCategory = cat;
                              });
                            }
                          },
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 36),

                    // Skills
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
                              'Unable to load skills',
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

                                loadSkills();
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      )
                    else if (filteredSkills.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 80),
                        child: Text(
                          'No skills found.',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      )
                    else
                      LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount =
                              constraints.maxWidth < 600
                                  ? 1
                                  : (constraints.maxWidth < 950
                                      ? 2
                                      : 4);

                          return GridView.builder(
                            shrinkWrap: true,
                            physics:
                                const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 18,
                              mainAxisSpacing: 18,
                              mainAxisExtent: 140,
                            ),
                            itemCount: filteredSkills.length,
                            itemBuilder: (context, index) {
                              return SkillCard(
                                skill: filteredSkills[index],
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