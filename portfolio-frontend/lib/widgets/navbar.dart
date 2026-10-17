import 'package:flutter/material.dart';
import '../pages/about_page.dart';
import '../pages/contact_page.dart';
import '../pages/home_page.dart';
import '../pages/projects_page.dart';
import '../pages/skills_page.dart';
import '../utils/app_colors.dart';
import '../utils/responsive.dart';

class Navbar extends StatelessWidget {
  final String activeRoute;

  const Navbar({
    super.key,
    this.activeRoute = 'Home',
  });

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return _buildMobileNavbar(context);
    }
    return _buildDesktopNavbar(context);
  }

  // ------------------------------------------------------------
  // DESKTOP NAVBAR
  // ------------------------------------------------------------

  Widget _buildDesktopNavbar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.border.withValues(alpha: 0.8),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 14,
      ),
      child: Row(
        children: [
          // Brand Logo
          _buildBrandLogo(context),

          const Spacer(),

          // Navigation Links & CTA
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _navItem(
                    context,
                    title: 'Home',
                    isActive: activeRoute == 'Home',
                    page: const HomePage(),
                  ),
                  _navItem(
                    context,
                    title: 'About',
                    isActive: activeRoute == 'About',
                    page: const AboutPage(),
                  ),
                  _navItem(
                    context,
                    title: 'Skills',
                    isActive: activeRoute == 'Skills',
                    page: const SkillsPage(),
                  ),
                  _navItem(
                    context,
                    title: 'Projects',
                    isActive: activeRoute == 'Projects',
                    page: const ProjectsPage(),
                  ),
                  _navItem(
                    context,
                    title: 'Contact',
                    isActive: activeRoute == 'Contact',
                    page: const ContactPage(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // MOBILE NAVBAR
  // ------------------------------------------------------------

  Widget _buildMobileNavbar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.border.withValues(alpha: 0.8),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 14,
      ),
      child: Row(
        children: [
          _buildBrandLogo(context),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: AppColors.accentSoft,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () => _showMobileMenu(context),
              icon: const Icon(Icons.menu_rounded, color: AppColors.primary),
              tooltip: 'Menu',
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // BRAND LOGO
  // ------------------------------------------------------------

  Widget _buildBrandLogo(BuildContext context) {
    return InkWell(
      onTap: () {
        if (activeRoute != 'Home') {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
          );
        }
      },
      borderRadius: BorderRadius.circular(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'JP',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'JAYAPRAKASH',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  letterSpacing: 1.0,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.statusGreen,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'PORTFOLIO',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // NAVIGATION ITEM (DESKTOP)
  // ------------------------------------------------------------

  Widget _navItem(
    BuildContext context, {
    required String title,
    required bool isActive,
    required Widget page,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () {
          if (!isActive) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          }
        },
        style: TextButton.styleFrom(
          foregroundColor: isActive ? AppColors.primary : AppColors.textSecondary,
          backgroundColor: isActive ? AppColors.accentSoft : Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // MOBILE MENU (BOTTOM SHEET)
  // ------------------------------------------------------------

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),
                _mobileMenuItem(
                  context,
                  title: 'Home',
                  icon: Icons.home_rounded,
                  isActive: activeRoute == 'Home',
                  page: const HomePage(),
                ),
                _mobileMenuItem(
                  context,
                  title: 'About',
                  icon: Icons.person_rounded,
                  isActive: activeRoute == 'About',
                  page: const AboutPage(),
                ),
                _mobileMenuItem(
                  context,
                  title: 'Skills',
                  icon: Icons.auto_awesome_rounded,
                  isActive: activeRoute == 'Skills',
                  page: const SkillsPage(),
                ),
                _mobileMenuItem(
                  context,
                  title: 'Projects',
                  icon: Icons.layers_rounded,
                  isActive: activeRoute == 'Projects',
                  page: const ProjectsPage(),
                ),
                _mobileMenuItem(
                  context,
                  title: 'Contact',
                  icon: Icons.mail_rounded,
                  isActive: activeRoute == 'Contact',
                  page: const ContactPage(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _mobileMenuItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required bool isActive,
    required Widget page,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: isActive ? AppColors.accentSoft : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isActive ? AppColors.primary : AppColors.textSecondary,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? AppColors.primary : AppColors.textPrimary,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            fontSize: 16,
          ),
        ),
        trailing: isActive
            ? const Icon(Icons.check_circle_rounded, color: AppColors.primary, size: 18)
            : null,
        onTap: () {
          Navigator.pop(context);
          if (!isActive) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          }
        },
      ),
    );
  }
}