import 'package:flutter/material.dart';

class AppColors {
  // Primary Blue Shades
  static const Color primary = Color(0xFF2563EB);       // Royal Blue
  static const Color primaryDark = Color(0xFF1E3A8A);   // Deep Navy Blue
  static const Color primaryLight = Color(0xFF60A5FA);  // Sky Blue
  static const Color primaryHover = Color(0xFF1D4ED8);  // Rich Blue

  // Secondary & Accent Shades
  static const Color secondary = Color(0xFF0EA5E9);     // Electric Cyan Blue
  static const Color accent = Color(0xFF38BDF8);        // Light Cyan Accent
  static const Color accentSoft = Color(0xFFE0F2FE);    // Ice Blue Soft Tint

  // Neutral & Background Shades
  static const Color background = Color(0xFFF8FAFC);    // Crisp Clean Slate/Ice White
  static const Color backgroundAlt = Color(0xFFF0F7FF); // Soft Blue Wash
  static const Color surface = Colors.white;            // Card Surface
  static const Color surfaceDark = Color(0xFF0F172A);   // Slate Navy Surface

  // Text Colors
  static const Color textPrimary = Color(0xFF0F172A);   // Deep Slate
  static const Color textSecondary = Color(0xFF475569); // Slate Grey
  static const Color textMuted = Color(0xFF94A3B8);     // Muted Blue-Grey
  static const Color textWhite = Colors.white;

  // Borders & Dividers
  static const Color border = Color(0xFFE2E8F0);        // Subtle Border
  static const Color borderBlue = Color(0xFFBFDBFE);    // Soft Blue Border

  // Status & Highlights
  static const Color statusGreen = Color(0xFF10B981);   // Available for Work green
  static const Color statusGreenSoft = Color(0xFFD1FAE5);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1D4ED8), Color(0xFF0EA5E9)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient blueSoftGradient = LinearGradient(
    colors: [Color(0xFFEFF6FF), Color(0xFFE0F2FE)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient darkCardGradient = LinearGradient(
    colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}