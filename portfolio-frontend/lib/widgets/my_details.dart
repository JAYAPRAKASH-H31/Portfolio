import 'package:flutter/material.dart';
import 'package:portfolio_01/pages/contact_page.dart';
import 'package:portfolio_01/pages/projects_page.dart';
import 'package:portfolio_01/utils/app_colors.dart';
import 'package:portfolio_01/utils/responsive.dart';
import 'package:portfolio_01/widgets/custom_button.dart';

class MyDetails extends StatelessWidget {
  const MyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final double horizontalPadding = Responsive.horizontalPadding(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF8FAFC), Color(0xFFEFF6FF), Color(0xFFE0F2FE)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? 40 : 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: isMobile ? _buildMobileHero(context) : _buildDesktopHero(context),
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // DESKTOP HERO
  // ------------------------------------------------------------

  Widget _buildDesktopHero(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left Column: Text & CTAs
        Expanded(
          flex: 6,
          child: _buildHeroContent(context, isMobile: false),
        ),

        const SizedBox(width: 48),

        // Right Column: Stylized Blue Tech Avatar Card
        Expanded(
          flex: 4,
          child: _buildAvatarCard(),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // MOBILE HERO
  // ------------------------------------------------------------

  Widget _buildMobileHero(BuildContext context) {
    return Column(
      children: [
        _buildAvatarCard(size: 160),
        const SizedBox(height: 32),
        _buildHeroContent(context, isMobile: true),
      ],
    );
  }

  // ------------------------------------------------------------
  // HERO TEXT CONTENT & BUTTONS
  // ------------------------------------------------------------

  Widget _buildHeroContent(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Status Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.borderBlue,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.08),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.statusGreen,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Headline
        Text(
          'Hi, I am Jayaprakash H',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 32 : 44,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
            letterSpacing: -1,
            height: 1.15,
          ),
        ),

        const SizedBox(height: 12),

        // Role with blue gradient look
        ShaderMask(
          shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
          child: Text(
            'Flutter & Java Backend Developer',
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              fontSize: isMobile ? 20 : 26,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: -0.2,
            ),
          ),
        ),

        const SizedBox(height: 18),

        // Bio
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            'Crafting modern, high-performance cross-platform mobile apps with Flutter and building robust, scalable REST API systems with Java & Spring Boot.',
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ),

        const SizedBox(height: 32),

        // Action Buttons
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            PrimaryButton(
              text: 'View Projects',
              icon: Icons.rocket_launch_rounded,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProjectsPage()),
                );
              },
            ),
            SecondaryButton(
              text: 'Contact Me',
              icon: Icons.chat_bubble_outline_rounded,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
            ),
          ],
        ),

        const SizedBox(height: 36),

        // Quick Stats Row
        _buildStatsRow(isMobile),
      ],
    );
  }

  // ------------------------------------------------------------
  // STATS ROW
  // ------------------------------------------------------------

  Widget _buildStatsRow(bool isMobile) {
    return Wrap(
      spacing: isMobile ? 20 : 36,
      runSpacing: 16,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      children: [
        _statItem('4+', 'Projects Built'),
        _statItem('10+', 'Technologies'),
        _statItem('CSE', 'Engineering Focus'),
      ],
    );
  }

  Widget _statItem(String number, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // STYLIZED BLUE AVATAR CARD
  // ------------------------------------------------------------

  Widget _buildAvatarCard({double size = 260}) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer Soft Glow Ring
          Container(
            width: size + 36,
            height: size + 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accentSoft.withValues(alpha: 0.6),
            ),
          ),

          // Middle Border Ring
          Container(
            width: size + 16,
            height: size + 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryLight.withValues(alpha: 0.5),
                width: 2,
              ),
            ),
          ),

          // Main Avatar Container
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.35),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.terminal_rounded,
                    size: size * 0.28,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'JP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size * 0.2,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    'ENGINEERING',
                    style: TextStyle(
                      color: AppColors.accentSoft,
                      fontSize: size * 0.05,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
