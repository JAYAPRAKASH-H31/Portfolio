import 'package:flutter/material.dart';
import '../models/skill_model.dart';
import '../utils/app_colors.dart';

class SkillCard extends StatelessWidget {
  final SkillModel skill;

  const SkillCard({
    super.key,
    required this.skill,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.borderBlue.withValues(alpha: 0.7),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Top Row: Icon + Category Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.accentSoft,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.borderBlue,
                    width: 1,
                  ),
                ),
                child: Icon(
                  skill.icon,
                  color: AppColors.primary,
                  size: 22,
                ),
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundAlt,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.borderBlue.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Text(
                    skill.category,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Skill Name
          Text(
            skill.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 3),
        ],
      ),
    );
  }
}