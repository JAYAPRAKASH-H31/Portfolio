import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String badge;
  final String title;
  final String subtitle;
  final bool isCenter;

  const SectionTitle({
    super.key,
    required this.badge,
    required this.title,
    required this.subtitle,
    this.isCenter = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Blue badge tag
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accentSoft,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.primaryLight.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Text(
            badge.toUpperCase(),
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Main Title
        Text(
          title,
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
            letterSpacing: -0.5,
          ),
        ),

        const SizedBox(height: 8),

        // Subtitle
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            subtitle,
            textAlign: isCenter ? TextAlign.center : TextAlign.start,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
