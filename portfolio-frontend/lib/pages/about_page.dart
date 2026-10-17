import 'package:flutter/material.dart';
import 'package:portfolio_01/pages/contact_page.dart';
import 'package:portfolio_01/pages/projects_page.dart';
import 'package:portfolio_01/utils/app_colors.dart';
import 'package:portfolio_01/utils/responsive.dart';
import 'package:portfolio_01/widgets/custom_button.dart';
import 'package:portfolio_01/widgets/navbar.dart';
import 'package:portfolio_01/widgets/section_title.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double padding = Responsive.horizontalPadding(context);
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(activeRoute: 'About'),

            const SizedBox(height: 40),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  children: [
                    const SectionTitle(
                      badge: 'About Me',
                      title: 'Engineering Passion & Focus',
                      subtitle:
                          'A passionate Computer Science student dedicated to building clean, maintainable software and engaging user experiences.',
                    ),

                    const SizedBox(height: 40),

                    // Main Bio Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(isMobile ? 24 : 36),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.borderBlue),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.05),
                            blurRadius: 18,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  gradient: AppColors.primaryGradient,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.school_rounded,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Computer Science Engineering Student',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    Text(
                                      'Specializing in Mobile Engineering & Backend Systems',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),
                          const Divider(color: AppColors.border),
                          const SizedBox(height: 20),

                          const Text(
                            'I am a Computer Science Engineering student passionate about crafting digital products that make a genuine difference. My journey spans full lifecycle development—from designing intuitive user interfaces in Flutter to engineering high-throughput, secure backend microservices with Java and Spring Boot.',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textSecondary,
                              height: 1.7,
                            ),
                          ),

                          const SizedBox(height: 16),

                          const Text(
                            'I place high value on clean architecture, well-documented code, and scalable database schemas. Whether it is solving algorithmic challenges or fine-tuning mobile animations, I enjoy diving deep into technical details and continuously expanding my engineering horizons.',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textSecondary,
                              height: 1.7,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 50),

                    // "What I Do" Cards Grid
                    const SectionTitle(
                      badge: 'Capabilities',
                      title: 'What I Bring to the Table',
                      subtitle:
                          'A well-rounded skill set blending client-side finesse with server-side stability.',
                    ),

                    const SizedBox(height: 36),

                    LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount = constraints.maxWidth < 650
                            ? 1
                            : (constraints.maxWidth < 950 ? 2 : 3);
                        return GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: isMobile ? 1.4 : 1.1,
                          children: [
                            _buildPillarCard(
                              icon: Icons.phone_iphone_rounded,
                              title: 'Mobile Apps (Flutter)',
                              description:
                                  'Designing responsive, fast cross-platform applications with pixel-perfect UI, seamless state management, and native-feeling animations.',
                            ),
                            _buildPillarCard(
                              icon: Icons.dns_rounded,
                              title: 'Backend (Java & Spring)',
                              description:
                                  'Building secure, RESTful microservices, JWT authentication, business logic validation, and robust transaction management.',
                            ),
                            _buildPillarCard(
                              icon: Icons.storage_rounded,
                              title: 'Databases & APIs',
                              description:
                                  'Architecting relational schemas in MySQL, optimizing queries with Hibernate JPA, and designing predictable REST APIs.',
                            ),
                          ],
                        );
                      },
                    ),

                    const SizedBox(height: 50),

                    // Collaboration CTA
                    Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: [
                        PrimaryButton(
                          text: 'Explore My Projects',
                          icon: Icons.layers_rounded,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProjectsPage(),
                              ),
                            );
                          },
                        ),
                        SecondaryButton(
                          text: 'Get In Touch',
                          icon: Icons.mail_outline_rounded,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ContactPage(),
                              ),
                            );
                          },
                        ),
                      ],
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

  Widget _buildPillarCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderBlue.withValues(alpha: 0.8)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.accentSoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primary, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}