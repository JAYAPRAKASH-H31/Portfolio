import 'package:flutter/material.dart';
import 'package:portfolio_01/models/project_model.dart';
import 'package:portfolio_01/models/skill_model.dart';
import 'package:portfolio_01/services/project_api_service.dart';
import 'package:portfolio_01/services/skill_api_service.dart';
import 'package:portfolio_01/pages/contact_page.dart';
import 'package:portfolio_01/pages/projects_page.dart';
import 'package:portfolio_01/pages/skills_page.dart';
import 'package:portfolio_01/utils/app_colors.dart';
import 'package:portfolio_01/utils/responsive.dart';
import 'package:portfolio_01/widgets/custom_button.dart';
import 'package:portfolio_01/widgets/my_details.dart';
import 'package:portfolio_01/widgets/navbar.dart';
import 'package:portfolio_01/widgets/project_card.dart';
import 'package:portfolio_01/widgets/section_title.dart';
import 'package:portfolio_01/widgets/skill_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProjectModel> projects = [];
List<SkillModel> skills = [];

bool isLoadingProjects = true;
bool isLoadingSkills = true;

final ProjectApiService _projectApiService = ProjectApiService();
final SkillApiService _skillApiService = SkillApiService();


@override
void initState() {
  super.initState();
  _loadProjects();
  _loadSkills();
}

Future<void> _loadProjects() async {
  try {
   final data = await _projectApiService.getProjects();

    if (!mounted) return;

    setState(() {
      projects = data;
      isLoadingProjects = false;
    });
  } catch (e) {
    if (!mounted) return;

    setState(() {
      isLoadingProjects = false;
    });
  }
}

Future<void> _loadSkills() async {
  try {
    final data = await _skillApiService.getSkills();

    if (!mounted) return;

    setState(() {
      skills = data;
      isLoadingSkills = false;
    });
  } catch (e) {
    if (!mounted) return;

    setState(() {
      isLoadingSkills = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    final double padding = Responsive.horizontalPadding(context);
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Sticky-style Top Navigation
            const Navbar(activeRoute: 'Home'),

            // Hero Section
            const MyDetails(),

            const SizedBox(height: 60),

            // --------------------------------------------------------
            // FEATURED PROJECTS SECTION
            // --------------------------------------------------------
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  children: [
                    const SectionTitle(
                      badge: 'Portfolio Showcase',
                      title: 'Featured Projects',
                      subtitle:
                          'A collection of mobile applications and backend architectures built with passion and clean code.',
                    ),
                    const SizedBox(height: 40),

                    // Projects Grid / List
                    LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount = constraints.maxWidth < 700
                            ? 1
                            : (constraints.maxWidth < 1000 ? 2 : 3);
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 24,
                            mainAxisExtent: 350,
                          ),
                          itemCount: projects.take(3).length,
                          itemBuilder: (context, index) {
                            return ProjectCard(project: projects[index]);
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 32),

                    SecondaryButton(
                      text: 'View All Projects (${projects.length})',
                      icon: Icons.grid_view_rounded,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProjectsPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 80),

            // --------------------------------------------------------
            // SKILLS SHOWCASE SECTION
            // --------------------------------------------------------
            Container(
              width: double.infinity,
              color: AppColors.backgroundAlt,
              padding: EdgeInsets.symmetric(
                horizontal: padding,
                vertical: 64,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    children: [
                      const SectionTitle(
                        badge: 'Core Competencies',
                        title: 'Technical Skills & Tools',
                        subtitle:
                            'Specialized in Flutter cross-platform development, Java Spring Boot microservices, and database systems.',
                      ),
                      const SizedBox(height: 40),

                      LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount = constraints.maxWidth < 600
                              ? 1
                              : (constraints.maxWidth < 950 ? 2 : 4);
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 18,
                              mainAxisSpacing: 18,
                              mainAxisExtent: 140,
                            ),
                            itemCount: skills.take(8).length,
                            itemBuilder: (context, index) {
                              return SkillCard(skill: skills[index]);
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 32),

                      PrimaryButton(
                        text: 'Explore All Skills',
                        icon: Icons.auto_awesome_rounded,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SkillsPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 80),

            // --------------------------------------------------------
            // CALL TO ACTION / CONNECT BANNER
            // --------------------------------------------------------
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 48,
                    vertical: isMobile ? 36 : 48,
                  ),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        blurRadius: 24,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Ready to build something impactful together?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'I am actively looking for software engineering roles, internships, and collaborative projects.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 28),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ContactPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.primary,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.mail_outline_rounded, size: 18),
                            SizedBox(width: 8),
                            Text(
                              'Let\'s Connect',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 80),

            // --------------------------------------------------------
            // FOOTER
            // --------------------------------------------------------
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: Column(
        children: [
          const Divider(color: AppColors.border),
          const SizedBox(height: 20),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '© 2026 Jayaprakash H. All rights reserved.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '• Crafted with Flutter & Blue Palette •',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}