import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../utils/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/custom_button.dart';

class ProjectDetailsPage extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailsPage({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final double padding = Responsive.horizontalPadding(context);
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Banner
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: AppColors.blueSoftGradient,
                border: Border(
                  bottom: BorderSide(color: AppColors.borderBlue, width: 1),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: padding,
                vertical: isMobile ? 32 : 48,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accentSoft,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.primary.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Text(
                          project.category.toUpperCase(),
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Title & Icon Row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryGradient,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(
                              project.icon,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              project.title,
                              style: TextStyle(
                                fontSize: isMobile ? 28 : 36,
                                fontWeight: FontWeight.w800,
                                color: AppColors.textPrimary,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Short tagline / summary
                      Text(
                        project.description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.textSecondary,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Content Area
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Detailed Overview Card
                    _buildCard(
                      title: 'Project Overview',
                      icon: Icons.info_outline_rounded,
                      child: Text(
                        project.longDescription.isNotEmpty
                            ? project.longDescription
                            : project.description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.textSecondary,
                          height: 1.7,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Key Features List
                    if (project.features.isNotEmpty) ...[
                      _buildCard(
                        title: 'Key Features & Capabilities',
                        icon: Icons.checklist_rounded,
                        child: Column(
                          children: project.features.map((feature) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: AppColors.accentSoft,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check_rounded,
                                      size: 14,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      feature,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: AppColors.textPrimary,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Technologies Used
                    _buildCard(
                      title: 'Technologies & Architecture',
                      icon: Icons.memory_rounded,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.technologies,
                            style: const TextStyle(
                              fontSize: 15,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (project.tags.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: project.tags.map((tag) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.backgroundAlt,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.borderBlue,
                                    ),
                                  ),
                                  child: Text(
                                    tag,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ],
                      ),
                    ),

                    const SizedBox(height: 36),

                    // Actions Row
                    Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      children: [
                        PrimaryButton(
                          text: 'Back to Projects',
                          icon: Icons.arrow_back_rounded,
                          onPressed: () => Navigator.pop(context),
                        ),
                        SecondaryButton(
                          text: 'View Code / GitHub',
                          icon: Icons.code_rounded,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'GitHub Repository: ${project.githubUrl ?? "Coming soon"}',
                                ),
                                backgroundColor: AppColors.primary,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderBlue.withValues(alpha: 0.8)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primary, size: 22),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: AppColors.border),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}